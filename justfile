install-all: \

  npm clean-install


build-all: \
  build-library \
  build-tester \

build-library: \

  mkdir -p artifacts/
  mkdir -p artifacts/library

  npm --workspace library run transpile

  mv artifacts/$( npm pack \
    --workspace library \
    --pack-destination artifacts/ \
  ) artifacts/library.tgz \

  tar \
    -x \
    -f artifacts/library.tgz \
    -C artifacts/library/ \
    --strip-components 1 \
    package/ \

build-tester: \
  build-library \

  npm --workspace tester run transpile


test-all: \
  build-all \

  node --test ./packages/*/transpiled/**/*.test.js
