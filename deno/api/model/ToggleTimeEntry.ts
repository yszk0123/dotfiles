export type TogglTimeEntry = {
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

export type TogglTimeEntryPostRaw = {
  wid: number;
  pid: number;
  start: string;
  duration: number;
  description: string;
  tags: string[];
};

export type TogglTimeEntryPost = {
  wid: number;
  pid: number;
  start: Date;
  duration: number;
  description: string;
  tags: string[];
};

export function deserializeTogglTimeEntryPost(
  input: TogglTimeEntryPostRaw
): TogglTimeEntryPost {
  return { ...input, start: new Date(input.start) };
}

export function serializeTogglTimeEntryPost(
  input: TogglTimeEntryPost
): TogglTimeEntryPostRaw {
  return { ...input, start: input.start.toISOString() };
}
