/**
 * @example
 * $ deno run --allow-env --allow-net deno/toggl.ts | pbcopy
 */
import { TogglAPIClient } from '../api/ToggleAPIClient.ts';
import { APIConfig } from '../api/APIUtils.ts';

export class TogglFetchDailyTimeEntriesUsecase {
  constructor(private client: TogglAPIClient) {}

  async run(): Promise<void> {

    const timeEntries = await this.client.fetchDailyTimeEntries(new Date());
    const input = [
      ...timeEntries
        .filter((entry) => entry.tags?.includes('public'))
        .flatMap(({ start, description }) =>
          start ? `- [ ] 💼 ${getHHMM(new Date(start))}~ ${description} *` : []
        ),
      ...timeEntries
        .filter((entry) => entry.tags?.includes('todo'))
        .flatMap(({ start, description }) =>
          start ? `- [ ] 💼 ${description} *` : []
        ),
    ];

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
  }
}

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
