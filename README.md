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

Let's create a simple package.

Here's our main program, let's call it `hello`:

```python
#!/usr/bin/env python
print("Hello, Debpack!")
```

We want that file to be installed in `/usr/local/bin`, so we add an entry the `.debpack`:

```
hello	/usr/local/bin/
```

Package metadata is stored in the [control file](https://www.debian.org/doc/debian-policy/ch-controlfields.html). You can create one using:

```shell
debpack --init
```

Our package depends on Python, so open the `debian/control` file and add `python` to the [`Depends`](https://www.debian.org/doc/debian-policy/ch-relationships.html#binary-dependencies-depends-recommends-suggests-enhances-pre-depends) field.

And finally, build the package:

```shell
debpack
```
