/**
 * @example
 * $ pbpaste | deno run deno/retrospective.ts | pbcopy
 */
const input = (await read()) ?? '';
const lines = split(input)
  .map(trimEnd)
  .filter(isHeadingOrTodo)
  .filter(not(isEmpty))
  .map(normalizeMarkdownItem)
const output = lines.join('\n');
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

function isHeadingOrTodo(text: string): boolean {
  return /^## |- \[.\]/.test(text);
}

function compareText(a: string, b: string): number {
  return a.localeCompare(b);
}

function split(text: string): string[] {
  return text.split(/\r?\n/);
}

function trimEnd(text: string): string {
  return text.trimEnd();
}

function not<T>(f: (v: T) => boolean): (v: T) => boolean {
  return (v: T) => !f(v);
}

function isPrivate(text: string): boolean {
  return text.includes('* ') || text.includes(' *');
}

function normalizeMarkdownItem(text: string): string {
  return text.replace(/(- \[.\])\s+/, '$1 ');
}
