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

You can also run Debpack using the `hoffa/debpack` Docker image.

In Drone CI, you could do:

```yaml
debpack:
  image: hoffa/debpack
  commands:
    - debpack ${DRONE_TAG}
  when:
    event: tag
```
