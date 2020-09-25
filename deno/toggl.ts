/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglFetchDailyTimeEntriesUsecase } from "./usecase/ToggleFetchDailyTimeEntriesUsecase.ts";

const API_KEY = Deno.env.get('TOGGL_TRACK_API_KEY');
const API_ENDPOINT = 'https://api.track.toggl.com/api/v8';
const CLIENT_ID_1 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_1');
const CLIENT_ID_2 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_2');
const WORKSPACE_ID = Deno.env.get('TOGGL_TRACK_WORKSPACE_ID');
// const CLIENT_ID = Deno.args[0] === '2' ? CLIENT_ID_2 : CLIENT_ID_1;

if (!API_KEY || !CLIENT_ID_1 || !CLIENT_ID_2 || !WORKSPACE_ID) {
  throw new Error('Required: API_KEY, CLIENT_ID_1, CLIENT_ID_2, WORKSPACE_ID');
}

const usecase = new TogglFetchDailyTimeEntriesUsecase({
  apiKey: API_KEY,
  endpoint: API_ENDPOINT,
});

await usecase.run();
