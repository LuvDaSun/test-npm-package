import assert from "node:assert";
import test from "node:test";
import { getDirname, reverse } from "./main.js";

// a unit test \o/
test("reverse unit", () => {
  const actual = reverse("1234");
  const expected = "4321";
  assert.equal(actual, expected);
});

// test file and implementation should be in the same folder
test("dirname unit", () => {
  const actual = getDirname();
  const expected = import.meta.dirname;
  assert.equal(actual, expected);
});
