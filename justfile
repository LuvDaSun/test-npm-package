install-all: \

  npm clean-install


build-all: \
  build-library \
  build-tester \


build-library: \
  install-all \

  mkdir -p artifacts/

  npm --workspace library run transpile

  npm pack \
    --workspace library \
    --pack-destination artifacts/ \

build-tester: \
  install-all \
  build-library \

  npm --workspace tester run transpile


test-all: \
  build-all \

  node --test ./packages/*/transpiled/**/*.test.js

