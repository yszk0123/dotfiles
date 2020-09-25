/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglAPIClient } from '../api/ToggleAPIClient.ts';
import { addDate } from '../api/DateUtils.ts';
import { APIConfig } from '../api/APIUtils.ts';

export class ToggleDuplicateEntriesUsecase {
  constructor(private config: APIConfig) {}

  async run(startDelta: number, endDelta: number): Promise<void> {
    const client = new TogglAPIClient(this.config);

    const startDate = addDate(new Date(), startDelta);
    const endDate = addDate(startDate, endDelta - startDelta);
    console.log('DUPLICATE', startDate, 'to', endDate);

    const timeEntries = await client.fetchDailyTimeEntries(startDate);
    const duplicatedTimeEntries = timeEntries
      .filter((entry) => entry.tags?.includes('public'))
      .filter(rr('start'))
      .filter(rr('duration'))
      .map((entry) => ({
        description: entry.description ?? '',
        duration: entry.duration,
        pid: entry.pid,
        start: addDate(new Date(entry.start), endDelta - startDelta),
        tags: entry.tags ?? [],
        wid: entry.wid,
      }));

    console.log('Duplicating');
    console.log(duplicatedTimeEntries);
    await Promise.all(
      duplicatedTimeEntries.map(async (entry) => client.createTimeEntry(entry))
    );
    console.log('Duplicated');
  }
}

type R<T, Key extends keyof T> = Exclude<T, Key> & Required<Pick<T, Key>>;
function r<T, K extends keyof T>(t: T, k: K): t is R<T, K> {
  return t[k] != null;
}
function rr<T, K extends keyof T>(k: K) {
  return (t: T): t is R<T, K> => r(t, k);
}
