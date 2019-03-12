# :package: debpack

[![Build Status](https://travis-ci.org/hoffa/debpack.svg?branch=master)](https://travis-ci.org/hoffa/debpack)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8904076ca8ad4882a5a2052620a6dc2f)](https://app.codacy.com/app/hoffa/debpack?utm_source=github.com&utm_medium=referral&utm_content=hoffa/debpack&utm_campaign=Badge_Grade_Settings)

Super simple Debian packages.

Adheres to the [Debian Policy Manual](https://www.debian.org/doc/debian-policy/) where reasonable, without bogging you down with needless ceremony.

## Installation

```shell
curl -Lo /usr/local/bin/debpack https://raw.githubusercontent.com/hoffa/debpack/master/debpack
chmod +x /usr/local/bin/debpack
```

You'll also need `dpkg-dev`:

```shell
apt-get install dpkg-dev
```

Or, if you want to build on macOS:

```shell
brew install dpkg fakeroot
```

## Usage

```shell
debpack
```

[Package control file fields](https://www.debian.org/doc/debian-policy/ch-controlfields.html) can be easily modified at build-time:

```shell
debpack Version:1.2.3
```

You can also use the [`hoffa/debpack`](https://hub.docker.com/r/hoffa/debpack) Docker image.

## Example

First, let's create a program called `hello` that outputs `world`:

```shell
echo 'echo world' > hello
chmod +x hello
```

The package will need some metadata. Debian packages keep their metadata in a [package control file](https://www.debian.org/doc/debian-policy/ch-controlfields.html#binary-package-control-files-debian-control), located in `debian/control`:

```shell
mkdir debian
cat > debian/control << EOF
Package: hello
Version: 1.0.0
Maintainer: Jane Doe <jane@doe.com>
Description: writes world to stdout
Architecture: all
EOF
```

> Note: you can also add [maintainer scripts](https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html) (such as `postinst`, which will execute after installation) to the `debian` directory.

We then create a `Debpackfile` that specifies where to copy the files when installing the package:

```shell
echo -e 'hello\t/usr/bin/' > Debpackfile
```

Finally, build the package:

```shell
debpack
```

## Debpackfile format

- Each line has a source and destination path, separated by a tab character
- Wildcards are allowed in the source path
- Lines that start with `#` are ignored
- Empty lines are ignored
