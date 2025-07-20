# test-npm-package

Testing the generated package code.

Just run

```
just test-all
```

And Bob's your uncle!

## What kind of magic is this?

An npm dependency an also be a project folder. So this it what we use in the tester project. Then we run tests against that dependency. This dependency is an extract of the tgz package that would be pushed to the registry, so the tests are run on something that is very close the the thing that our users will use.

Another option would be to use the package, the .tgz file as a dependency. This works, but! In CI a clean install fails when this package is missing and this package can sometimes be missing as it needs to be build first. Also, npm pack does not seems to be deterministic. The tgz packages that are created locally are different from the ones created in CI. The contents is exactly the same but the hashes of the packages are different. This might because of the order of files in the tar or something similar. This makes a clean install break because the hashes do not match.

When running npm install without the referenced folder being present, we get no error! This is kind of a surprise, because you'd expect a dependency to break when it is not present. This is something that needs investigation. I can imagine that this would work because the lockfile holds all necessary information to build the dependency tree so checking if the folder exists would not be necessary during install. The build does break when this dependency is missing, as expected.

## Beware of the lockfile

If the library package is updated then this will result in a fresh `library` artifact. This now has a new hash! So you need to update the lockfile. A simple way to do this is `npm install`

The lockfile needs to be updated before every `npm clean-install`, this is mostly done in CI, but also by `just test-all`. So, before testing or deploying update the lockfile!
