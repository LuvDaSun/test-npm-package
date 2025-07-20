install-all: \

  npm clean-install


build-all: \
  build-library \
  build-tester \


build-library: \
  install-all \

  mkdir -p artifacts/

  npm --workspace library run transpile

  mv artifacts/$( npm pack \
    --workspace library \
    --pack-destination artifacts/ \
  ) artifacts/library.tgz


build-tester: \
  install-all \
  build-library \

  npm --workspace tester run transpile


test-all: \
  build-all \

  node --test ./packages/*/transpiled/**/*.test.js

