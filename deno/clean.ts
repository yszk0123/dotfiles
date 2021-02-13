/**
 * @example
 * $ pbpaste | deno run deno/report.ts | pbcopy
 */
const input = (await read()) ?? '';
const output = split(input)
  .filter(not(isEmpty))
  // .map(simplifyMarkdownLink)
  // .map(extractTitleFromMarkdownLink)
  // .map(simplifyURL)
  .map(mapTask)
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

function isNotNull<T>(v: T | null): v is T {
  return v !== null;
}

function split(text: string): string[] {
  return text.split(/\r?\n/);
}

function not<T>(f: (v: T) => boolean): (v: T) => boolean {
  return (v: T) => !f(v);
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

function mapTask(input: string): string {
  const text = input
    .replace('{{[[TODO]]}}', '[ ]')
    .replace('{{[[DONE]]}}', '[x]')
    .replace('- [[204/', '\n# ')
    .replace(/\[\[|\]\]/g, '')
    .replace(/    /g, '  ');
    // .replace(/\s+#\w+/g, '');
  return extractTitleFromMarkdownLink(text);
  // return simplifyURL(simplifyMarkdownLink(text))
}
