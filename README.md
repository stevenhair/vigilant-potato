# vigilant-potato

[![Build Status](https://travis-ci.org/stevenhair/vigilant-potato.svg?branch=master)](https://travis-ci.org/stevenhair/vigilant-potato)

Test for Invoke with CI

The sole purpose of this repository is the try and reproduce
[Invoke bug #377](https://github.com/pyinvoke/invoke/issues/377) based on
what I've seen in out automated Jenkins builds.

## Running the repro

If you want to run this without Travis, I don't blame you. Install docker-compose,
and then in this directory, run:

```sh
docker-compose build
docker-compose run potato inv test
```
