/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { fromUint8Array } from 'https://denopkg.com/chiefbiiko/base64/mod.ts';

const API_KEY = Deno.env.get('TOGGL_TRACK_API_KEY');
const API_ENDPOINT = 'https://api.track.toggl.com/api/v8';

if (!API_KEY) {
  throw new Error('API_KEY required');
}

const timeEntries = await fetchTogglTimeEntries();
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

type TogglTimeEntry = {
  id: number;
  wid: number;
  pid: number;
  start?: string;
  stop?: string;
  duration?: number;
  description?: string;
  tags?: string[];
  at?: string;
};

async function fetchTogglTimeEntries(): Promise<TogglTimeEntry[]> {
  // curl -v -u 1971800d4d82861d8f2c1651fea4d212:api_token \
  // -X GET "https://api.track.toggl.com/api/v8/time_entries?start_date=2013-03-10T15%3A42%3A46%2B02%3A00&end_date=2013-03-12T15%3A42%3A46%2B02%3A00"
  const date = new Date();
  const startDate = startOfDate(date).toISOString();
  const endDate = endOfDate(date).toISOString();

  const url = `${API_ENDPOINT}/time_entries?start_date=${encodeURIComponent(
    startDate
  )}&end_date=${encodeURIComponent(endDate)}`;
  const encoded = fromUint8Array(
    new TextEncoder().encode(`${API_KEY}:api_token`)
  );
  const headers = new Headers({ Authorization: `Basic ${encoded}` });
  const data = await fetch(url, { headers });
  if (data.status !== 200) {
    throw new Error(`Failed to fetch data: ${data.statusText}`);
  }

  return data.json();
}

function startOfDate(date: Date): Date {
  const y = date.getFullYear();
  const m = date.getMonth();
  const d = date.getDate();
  return new Date(y, m, d);
}

function endOfDate(date: Date): Date {
  const result = startOfDate(new Date(date));
  result.setDate(result.getDate() + 1);
  return result;
}

function getHHMM(date: Date): string {
  const h = date.getHours();
  const m = date.getMinutes();
  return `${pad2(h)}:${pad2(m)}`;
}

function pad2(input: number): string {
  return input < 10 ? `0${input}` : `${input}`;
}
