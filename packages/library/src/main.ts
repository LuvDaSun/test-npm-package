export function reverse(text: string) {
  const characters = text.split("");
  characters.reverse();
  return characters.join("");
}

export function getDirname() {
  return import.meta.dirname;
}
