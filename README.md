# :package: debpack

[![Build Status](https://travis-ci.org/hoffa/debpack.svg?branch=master)](https://travis-ci.org/hoffa/debpack)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8904076ca8ad4882a5a2052620a6dc2f)](https://app.codacy.com/app/hoffa/debpack?utm_source=github.com&utm_medium=referral&utm_content=hoffa/debpack&utm_campaign=Badge_Grade_Settings)

Super simple internal Debian packages.

Adheres to the [Debian Policy Manual](https://www.debian.org/doc/debian-policy/) where reasonable, without bogging you down with useless fluff.

## Installation

```shell
curl -Lo /usr/local/bin/debpack https://raw.githubusercontent.com/hoffa/debpack/master/debpack
chmod +x /usr/local/bin/debpack
```

## Usage

```shell
debpack
```

You can easily overwrite the version at build-time:

[Control file fields](https://www.debian.org/doc/debian-policy/ch-controlfields.html) can be easily overwritten at build-time:

```shell
debpack Version:1.2.3 Architecture:i386
```

You can also use the [`hoffa/debpack`](https://hub.docker.com/r/hoffa/debpack) Docker image.

For example, in Drone CI you could do:

```yaml
- name: debpack
  image: hoffa/debpack
  commands:
    - debpack ${DRONE_TAG}
  when:
    event: tag
```

## Example

First, generate the boilerplate:

```shell
debpack --init
```

It'll create the following file structure:

```shell
├── .debpack
├── debian
│   └── control
└── hello-world
```

You can straight away build the package:

```shell
debpack
```

`.debpack` contains a list of tab-separated copy paths, for example:

```text
hello-world	/usr/bin/
hello-world.conf	/etc/init/
```

Package metadata is stored in the [`control` file](https://www.debian.org/doc/debian-policy/ch-controlfields.html) within the `debian` directory.

You can add [maintainer scripts](https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html) to `debian`.
