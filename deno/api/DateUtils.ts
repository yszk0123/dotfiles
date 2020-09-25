export function startOfDate(date: Date): Date {
  const y = date.getFullYear();
  const m = date.getMonth();
  const d = date.getDate();
  return new Date(y, m, d);
}

export function endOfDate(date: Date): Date {
  return addDate(startOfDate(new Date(date)), 1);
}

export function addDate(date: Date, delta: number): Date {
  const result = new Date(date);
  result.setDate(result.getDate() + delta);
  return result;
}
