install-all: \
  install-library \
  install-tester \

install-library: \

  npm --workspace library clean-install

install-tester: \
  build-library \

  npm --workspace tester clean-install


build-all: \
  build-library \
  build-tester \

build-library: \
  install-library \

  mkdir -p artifacts/

  npm --workspace library run transpile

  mv artifacts/$( npm pack \
    --workspace library \
    --pack-destination artifacts/ \
  ) artifacts/library.tgz

build-tester: \
  install-tester \

  npm --workspace tester run transpile


test-all: \
  build-all \

  node --test ./packages/*/transpiled/**/*.test.js
