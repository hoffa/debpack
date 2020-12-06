# 📦 debpack

[![Build Status](https://github.com/hoffa/debpack/workflows/.github/workflows/workflow.yml/badge.svg)](https://github.com/hoffa/debpack/actions)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/hoffa/debpack.svg)](https://hub.docker.com/r/hoffa/debpack)

Super simple Debian packages.

Aims to keep [Lintian](https://lintian.debian.org) happy and adhere to the [Debian Policy Manual](https://www.debian.org/doc/debian-policy/) where reasonable, without bogging you down with needless ceremony.

Only depends on Bash and `dpkg` tools.

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
Description: writes world to stdout
Maintainer: Jane Doe <jane@doe.com>
Architecture: all
Version: 1.0.0
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
- Empty lines and lines that start with `#` are ignored
