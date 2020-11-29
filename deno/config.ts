export const config = {
  toggl: {
    api: {
      apiKey: expectNotUndefined(Deno.env.get('TOGGL_TRACK_API_KEY')),
      endpoint: 'https://api.track.toggl.com/api/v8',
    },
    workspaceId: Deno.env.get('TOGGL_TRACK_WORKSPACE_ID'),
  },
};

function expectNotUndefined<T>(value: T | undefined): T {
  if (value == null) {
    throw new Error('value should not be undefined');
  }
  return value;
}
