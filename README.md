# Dev-Nanny Tests [![Project Stage: Development]][Project Stage Page]


## Introduction

Some very basic integration tests for [Dev-Nanny](http://dev-nanny.github.io/)

## Usage

In the terminal, navigate to this repository folder and run the following
command to run all available tests:

    ./run-tests.sh

## Inner workings

- This script will run all of the files in the `tests/` directory who's name
starts with `test` and ends with `.sh`.
- If a file named `setup.sh` is present
in the `tests/` directory it will be run *before* each test.
- If a file named
`teardown.sh` is present in the `tests/` directory it will be run *after* each
test.
- If a test fails, the test runner will abort, rather than running all tests.

[Project Stage Page]: http://bl.ocks.org/potherca/raw/a2ae67caa3863a299ba0/
[Project Stage: Development]: http://img.shields.io/badge/Project%20Stage-Development-yellowgreen.svg
