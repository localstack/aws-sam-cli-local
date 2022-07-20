# AWS SAM CLI for LocalStack

This project provides the `samlocal` command line, a simple wrapper around the [AWS SAM CLI](https://github.com/aws/aws-sam-cli) for use with [LocalStack](https://github.com/localstack/localstack).

## Installation

Simply use `pip` to install `samlocal` as a Python library on your machine:

```
pip install aws-sam-cli-local
```

## Usage

The `samlocal` command has the exact same usage as the underlying `sam` command. The main difference is that for commands like `samlocal deploy` the operations will be executed against the LocalStack endpoints (`http://localhost:4566` by default) instead of real AWS endpoints.

```
samlocal --help
```

## Configuration

* `EDGE_PORT`: Port number under which the LocalStack edge service is available (default: `4566`)
* `LOCALSTACK_HOSTNAME`: Host under which the LocalStack edge service is available (default: `localhost`)

## Change Log

* v1.53.1: Fix logic around local URLs for ECR image repositories
* v1.1.0.1: Minor fix, release initial version of `samlocal` command
* v1.1.0: Initial version

## License

This software library is released under the Apache License, Version 2.0.
