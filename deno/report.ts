/**
 * @example
 * $ pbpaste | deno run deno/report.ts | pbcopy
 */
const input = (await read()) ?? '';
const lines = split(input)
  .map(trim)
  .filter(isTodo)
  .filter(not(isPrivate))
  .filter(not(isEmpty))
  .map(normalizeMarkdownItem)
  // .map(simplifyMarkdownLink)
  .map(extractTitleFromMarkdownLink)
  .map(simplifyURL)
  .sort(compareText);
const output = groupByTag(lines).join('\n');
write(output);

async function read(): Promise<string | null> {
  const buf = new Uint8Array(2 ** 16);
  const n = await Deno.stdin.read(buf);
  if (n === null) return null;
  const text = new TextDecoder().decode(buf.subarray(0, n));
  return text;
}

async function write(text: string): Promise<void> {
  const buf = new TextEncoder().encode(text);
  await Deno.stdout.write(buf);
}

function isEmpty(text: string): boolean {
  return text === '';
}

function isTodo(text: string): boolean {
  return /- \[.\]/.test(text);
}

function groupByTag(lines: string[]): string[] {
  const schedule: string[] = [];
  const other: string[] = [];
  const groups: Record<string, string[]> = {};
  lines.forEach((line) => {
    const date = /^(-(?: \[.\])?)\s+(\d{2}:\d{2}~?(?:\d{2}:\d{2})?)\s+(.*)$/.exec(
      line
    );
    if (date) {
      const [_all, _pre, time, post] = date;
      schedule.push(`${time} ${post}`);
      return;
    }

    const match = /^(- \[.\])\s+(\S+):\s+(.*)$/.exec(line);
    if (match) {
      const [_all, pre, tag, post] = match;
      const newLine = `${pre} ${post}`;
      if (tag === 'その他') {
        other.push(newLine);
      } else {
        const group = groups[tag] || [];
        group.push(newLine);
        groups[tag] = group;
      }
    } else {
      other.push(line);
    }
  });

  schedule.sort(compareText);
  const tasks: string[] = [];
  Object.entries(groups).forEach(([tag, lines]) => {
    tasks.push(`## ${tag}`);
    tasks.push(...lines);
  });
  return [
    ...tasks,
    ...(other.length ? ['## その他', ...other] : []),
    '',
    ...schedule,
  ];
}

function compareText(a: string, b: string): number {
  return a.localeCompare(b);
}

function split(text: string): string[] {
  return text.split(/\r?\n/);
}

function trim(text: string): string {
  return text.trim();
}

function not<T>(f: (v: T) => boolean): (v: T) => boolean {
  return (v: T) => !f(v);
}

function isPrivate(text: string): boolean {
  return text.includes('* ') || text.includes(' *');
}

function simplifyMarkdownLink(text: string): string {
  return text.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '$1 $2').replace(/\\/g, '');
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
