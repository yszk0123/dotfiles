/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglAPIClient } from './api/ToggleAPIClient.ts';
import { config } from './config.ts';
import { TogglDuplicateEntriesUsecase } from './usecase/TogglDuplicateEntriesUsecase.ts';

const START_DELTA = Number(Deno.args[0]) || 0;
const END_DELTA = Number(Deno.args[1]) || 0;
if (START_DELTA === 0 && END_DELTA === 0) {
  throw new Error('START_DELTA === END_DELTA');
}

const client = new TogglAPIClient({
  apiKey: config.toggl.api.apiKey,
  endpoint: config.toggl.api.endpoint,
});
const usecase = new TogglDuplicateEntriesUsecase(client);
await usecase.run(START_DELTA, END_DELTA);
