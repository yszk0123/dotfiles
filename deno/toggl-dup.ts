/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglAPIClient } from './api/ToggleAPIClient.ts';
import { addDate } from './api/DateUtils.ts';

const API_KEY = Deno.env.get('TOGGL_TRACK_API_KEY');
const API_ENDPOINT = 'https://api.track.toggl.com/api/v8';
const CLIENT_ID_1 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_1');
const CLIENT_ID_2 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_2');
const WORKSPACE_ID = Deno.env.get('TOGGL_TRACK_WORKSPACE_ID');

const DELTA = Number(Deno.args[0]) || 0;

if (!API_KEY || !CLIENT_ID_1 || !CLIENT_ID_2 || !WORKSPACE_ID) {
  throw new Error('Required: API_KEY, CLIENT_ID_1, CLIENT_ID_2, WORKSPACE_ID');
}

const client = new TogglAPIClient({ apiKey: API_KEY, endpoint: API_ENDPOINT });

const timeEntries = await client.fetchDailyTimeEntries(
  addDate(new Date(), DELTA)
);
const duplicatedTimeEntries = timeEntries
  .filter((entry) => entry.tags?.includes('public'))
  .filter(rr('start'))
  .filter(rr('duration'))
  .map((entry) => ({
    description: entry.description ?? '',
    duration: entry.duration,
    pid: entry.pid,
    start: nextDay(entry.start),
    tags: entry.tags ?? [],
    wid: entry.wid,
  }));

console.log('Duplicating');
console.log(duplicatedTimeEntries);
await Promise.all(
  duplicatedTimeEntries.map(async (entry) => client.createTimeEntry(entry))
);
console.log('Duplicated');

type R<T, Key extends keyof T> = Exclude<T, Key> & Required<Pick<T, Key>>;
function r<T, K extends keyof T>(t: T, k: K): t is R<T, K> {
  return t[k] != null;
}
function rr<T, K extends keyof T>(k: K) {
  return (t: T): t is R<T, K> => r(t, k);
}

function nextDay(dateString: string): Date {
  return addDate(new Date(dateString), 1);
}
