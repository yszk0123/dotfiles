import { TogglAPIClient } from './api/ToggleAPIClient.ts';
/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { config } from './config.ts';
import { TogglFetchDailyTimeEntriesUsecase } from './usecase/TogglFetchDailyTimeEntriesUsecase.ts';

const client = new TogglAPIClient({
  apiKey: config.toggl.api.apiKey,
  endpoint: config.toggl.api.endpoint,
});
const usecase = new TogglFetchDailyTimeEntriesUsecase(client);

await usecase.run();
