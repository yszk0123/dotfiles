import { fromUint8Array } from 'https://denopkg.com/chiefbiiko/base64/mod.ts';

export type APIConfig = {
  endpoint: string;
  apiKey: string;
};

export async function fetchJSON<T>(
  path: string,
  query: { [key: string]: string },
  config: APIConfig
): Promise<T> {
  const encodedQuery = encodeQuery(query);
  const url = `${config.endpoint}${path}${
    encodedQuery ? '?' : ''
  }${encodedQuery}`;
  const headers = new Headers({
    Authorization: getAuthorizationHeader(config),
  });
  const data = await fetch(url, { headers });
  if (data.status !== 200) {
    throw new Error(`Failed to fetch data: ${data.statusText}`);
  }
  return data.json();
}

export async function postJSON<S, T>(
  path: string,
  query: { [key: string]: string },
  body: S,
  config: APIConfig
): Promise<T> {
  const encodedQuery = encodeQuery(query);
  const url = `${config.endpoint}${path}${
    encodedQuery ? '?' : ''
  }${encodedQuery}`;
  const headers = new Headers({
    Authorization: getAuthorizationHeader(config),
  });
  const data = await fetch(url, { headers, body: JSON.stringify(body) });
  if (data.status !== 200) {
    throw new Error(`Failed to fetch data: ${data.statusText}`);
  }
  return data.json();
}

function getAuthorizationHeader(config: APIConfig): string {
  const encoded = fromUint8Array(
    new TextEncoder().encode(`${config.apiKey}:api_token`)
  );
  return `Basic ${encoded}`;
}

function snakeCase(input: string): string {
  return input.replace(/([A-Z]\w*)/g, ($0, $1, $2) => `_${$1.toLowerCase()}`);
}

function encodeQuery(query: { [key: string]: string }): string {
  return Object.entries(query)
    .reduce((acc, [k, v]) => {
      return [...acc, `${snakeCase(k)}=${encodeURIComponent(v)}`];
    }, [] as string[])
    .join('&');
}
