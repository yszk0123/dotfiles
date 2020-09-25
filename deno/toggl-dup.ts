/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { ToggleDuplicateEntriesUsecase } from "./usecase/ToggleDuplicateEntriesUsecase.ts";

const API_KEY = Deno.env.get('TOGGL_TRACK_API_KEY');
const API_ENDPOINT = 'https://api.track.toggl.com/api/v8';
const CLIENT_ID_1 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_1');
const CLIENT_ID_2 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_2');
const WORKSPACE_ID = Deno.env.get('TOGGL_TRACK_WORKSPACE_ID');

const START_DELTA = Number(Deno.args[0]) || 0;
const END_DELTA = Number(Deno.args[1]) || 0;

if (!API_KEY || !CLIENT_ID_1 || !CLIENT_ID_2 || !WORKSPACE_ID) {
  throw new Error('Required: API_KEY, CLIENT_ID_1, CLIENT_ID_2, WORKSPACE_ID');
}
if (START_DELTA === 0 && END_DELTA === 0) {
  throw new Error('START_DELTA === END_DELTA');
}

const usecase = new ToggleDuplicateEntriesUsecase({ apiKey: API_KEY, endpoint: API_ENDPOINT });
await usecase.run(START_DELTA, END_DELTA);
