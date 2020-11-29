/**
 * @example
 * $ pbpaste | deno run deno/report.ts | pbcopy
 */
const input = (await read()) ?? '';
const tasks = split(input)
  .filter(not(isEmpty))
  .filter(isWork)
  // .map(simplifyMarkdownLink)
  // .map(extractTitleFromMarkdownLink)
  // .map(simplifyURL)
  .map(parseTask)
  .filter(isNotNull)
  .map(getProjectTask)
  .filter(isNotNull)
  .filter(hasText)
  .filter(isVisible)
  .sort(compareTask);
const output = groupByProject(tasks)
  .map(({ project, tasks }) => {
    return [
      `## ${project}`,
      tasks
        .map(
          (task) =>
            `- [${task.done ? 'x' : ' '}] ${
              task.subProject ? task.subProject + ': ' : ''
            }${task.text}`
        )
        .join('\n'),
    ].join('\n');
  })
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

function compareTask(a: ProjectTask, b: ProjectTask): number {
  const project = a.project.localeCompare(b.project);
  if (project) return project;
  const done = a.done !== b.done;
  if (done) return b.done ? 1 : -1;
  const sub = a.subProject.localeCompare(b.subProject);
  if (sub) return sub;
  return a.text.localeCompare(b.text);
}

function isWork(text: string): boolean {
  return text.includes('/work/');
}

function isNotNull<T>(v: T | null): v is T {
  return v !== null;
}

function isVisible(task: ProjectTask): boolean {
  return (
    !task.subProject.includes('評価') &&
    (task.taskLevel === null || !task.taskLevel.includes('/chore'))
  );
}

function hasText(task: ProjectTask): boolean {
  return !!task.text;
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

type Task = {
  text: string;
  done: boolean;
  tags: string[];
  indent: number;
};

function parseTask(input: string): Task | null {
  const match = /- {{\[\[(TODO|DONE)]]}}\s+(.*?)\s*(\[\[.*]])$/g.exec(
    input.trim()
  );
  if (!match) {
    return null;
  }
  const [_, status = 'TODO', text = '', tagsString = ''] = match;
  const tags =
    tagsString.match(/(\[\[(.*?)]])/g)?.map((v) => v.replace(/[\[\]]/g, '')) ??
    [];
  const done = status === 'DONE';
  const indent = input.match(/  /g)?.length ?? 0;
  return { text: extractTitleFromMarkdownLink(text), done, tags, indent };
}

type ProjectTask = {
  text: string;
  done: boolean;
  project: string;
  subProject: string;
  taskLevel: string | null;
};

function getProjectTask(task: Task): ProjectTask | null {
  const tag = task.tags.find((tag) => tag.includes('/project/'));
  if (!tag) {
    return null;
  }

  const path = tag.split('/').pop() ?? '';
  const [project, ...subProjectPath] = path.split('.');
  const taskLevel = task.tags.find((tag) => tag.startsWith('task/')) ?? null;

  return {
    text: task.text,
    done: task.done,
    project,
    taskLevel,
    subProject: subProjectPath.join('.'),
  };
}

function groupByProject(
  tasks: ProjectTask[]
): { project: string; tasks: ProjectTask[] }[] {
  const result: Record<string, ProjectTask[]> = {};
  tasks.forEach((task) => {
    const tasks = result[task.project] || [];
    tasks.push(task);
    result[task.project] = tasks;
  });

  return Object.entries(result).map(([project, tasks]) => ({ project, tasks }));
}
