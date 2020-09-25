/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglAPIClient } from './api/ToggleAPIClient.ts';

const API_KEY = Deno.env.get('TOGGL_TRACK_API_KEY');
const API_ENDPOINT = 'https://api.track.toggl.com/api/v8';
const CLIENT_ID_1 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_1');
const CLIENT_ID_2 = Deno.env.get('TOGGL_TRACK_CLIENT_ID_2');
const WORKSPACE_ID = Deno.env.get('TOGGL_TRACK_WORKSPACE');

const CLIENT_ID = Deno.args[0] === '2' ? CLIENT_ID_2 : CLIENT_ID_1;

if (!API_KEY || !CLIENT_ID_1 || !CLIENT_ID_2 || !WORKSPACE_ID) {
  throw new Error('Required: API_KEY, CLIENT_ID_1, CLIENT_ID_2, WORKSPACE_ID');
}

const client = new TogglAPIClient({ apiKey: API_KEY, endpoint: API_ENDPOINT });

const timeEntries = await client.fetchDailyTimeEntries(new Date());
const input = timeEntries
  .filter((entry) => entry.tags?.includes('public'))
  .flatMap(({ start, description }) =>
    start ? `- [ ] 💼 ${getHHMM(new Date(start))}~ ${description} *` : []
  );

const lines = input
  .map(trim)
  .filter(not(isEmpty))
  // .map(removePublicSymbol)
  // .map(removeWorkSymbol)
  // .map(normalizeMarkdownItem)
  // .map(simplifyMarkdownLink)
  // .map(extractTitleFromMarkdownLink)
  // .map(simplifyURL)
  .sort(compareText);
const output = lines.join('\n');
write(output);

async function write(text: string): Promise<void> {
  const buf = new TextEncoder().encode(text);
  await Deno.stdout.write(buf);
}

function isEmpty(text: string): boolean {
  return text === '';
}

function compareText(a: string, b: string): number {
  return a.localeCompare(b);
}

function trim(text: string): string {
  return text.trim();
}

function not<T>(f: (v: T) => boolean): (v: T) => boolean {
  return (v: T) => !f(v);
}

function removePublicSymbol(text: string): string {
  return text.replace(/ \*$/, '');
}

function removeWorkSymbol(text: string): string {
  return text.replace(/💼\s*/g, '');
}

function extractTitleFromMarkdownLink(text: string): string {
  return text.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '$1').replace(/\\/g, '');
}

function simplifyURL(text: string): string {
  return text.replace(
    /(^|\s)(https?:\/\/[^\s]+)/g,
    (_, prefix, url) => `${prefix}${simplifyURLInner(url)}`
  );
}

function normalizeMarkdownItem(text: string): string {
  return text.replace(/(- \[.\])\s+/, '$1 ');
}

function simplifyURLInner(text: string): string {
  const simplifiedText = text.replace(/\?.*$/, '').replace(/#.*$/, '');

  const github = simplifiedText.replace(
    /^https?:\/\/github.com\/[^/]+\/([^/]+)\/(?:pull|issue)s?\/([0-9]+)$/,
    '$1 #$2'
  );
  if (github !== simplifiedText) {
    return github;
  }

  const [schema, , domain, ...rest] = simplifiedText.split('/');
  if (!schema || !domain) {
    return simplifiedText;
  }
  return [schema, '', domain, ...rest.slice(0, 2)].join('/');
}

function getHHMM(date: Date): string {
  const h = date.getHours();
  const m = date.getMinutes();
  return `${pad2(h)}:${pad2(m)}`;
}

function pad2(input: number): string {
  return input < 10 ? `0${input}` : `${input}`;
}
