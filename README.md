# test-npm-package

Testing the generated package code.

Just run

```
just test-all
```

And bob's your uncle!

## Beware of the lockfile

If the library package is updated then this will result in a fresh `library.tgz` artifact. This now has a new hash! So you need to update the lockfile. A simple way to do this is `npm install`

The lockfile needs to be updated before every `npm clean-install`, this is mostly done in CI, but also by `just test-all`. So, before testing or deploying update the lockfile!
