/**
 * @example
 * $ pbpaste | deno run deno/report.ts | pbcopy
 */
const input = (await read()) ?? '';
const tasks = split(input)
  // .map(trim)
  // .filter(isTodo)
  // .filter(isPublic)
  // .filter(isWork)
  .filter(not(isEmpty))
  .filter(not(isHidden))
  .filter(isTask)
  // .map(removePublicSymbol)
  // .map(removeWorkSymbol)
  // .map(normalizeMarkdownItem)
  // .map(simplifyMarkdownLink)
  // .map(extractTitleFromMarkdownLink)
  // .map(simplifyURL)
  .map(parseTask);
const output = tasks
  .map(({ text, done, indent }) =>
    indent === 0
      ? `\n## ${text}`
      : `${indentText(indent - 1)}- [${done ? 'x' : ' '}] ${text}`
  )
  .join('\n')
  .trim();
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

function indentText(indent: number): string {
  return [...Array.from({ length: indent + 1 })].join('  ');
}

function isEmpty(text: string): boolean {
  return text === '';
}

function isHidden(text: string): boolean {
  return text.includes('Hidden');
}

function isTodo(text: string): boolean {
  return /- \[.\]/.test(text);
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

function isPublic(text: string): boolean {
  return text.endsWith(' *');
}

function isTask(text: string): boolean {
  return /^\s*- /.test(text);
}

function removePublicSymbol(text: string): string {
  return text.replace(/ \*$/, '');
}

function isWork(text: string): boolean {
  return text.includes('💼');
}

function removeWorkSymbol(text: string): string {
  return text.replace(/💼\s*/g, '');
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

type Task = {
  text: string;
  done: boolean;
  indent: number;
};

function parseTask(input: string): Task {
  const text = input
    .replace(/^\s*/g, '')
    .replace(/^-\s+/, '')
    .replace(/@[-_a-zA-Z0-9]+\([^)]+\)/g, '')
    .trim();
  const done = input.includes('@done');
  const indent = input.match(/\t/g)?.length ?? 0;
  return { text, done, indent };
}
