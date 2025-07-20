import { getDirname, reverse } from "library-packaged";
import assert from "node:assert";
import test from "node:test";

// an e2e test ~:-)
test("reverse e2e", () => {
  const actual = reverse("1234");
  const expected = "4321";
  assert.equal(actual, expected);
});

// this should come from the library-packaged module
test("dirname e2e", () => {
  const actual = import.meta.resolve(getDirname())
  const expected = import.meta.resolve("../../../artifacts/library/package/transpiled");
  assert.equal(actual, expected);
});
