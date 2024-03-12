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

* `AWS_ENDPOINT_URL`: URL at which the `boto3` client can reach LocalStack, e.g. `http://localhost.localstack.cloud:4566` (default: `http://localhost:4566`)
* `EDGE_PORT`: **Deprecated** Port number under which the LocalStack edge service is available (default: `4566`)
* `LOCALSTACK_HOSTNAME`: **Deprecated** Host under which the LocalStack edge service is available (default: `localhost`)

## Change Log

* v1.69.0: Fix repo related cli options and add support to Lambdas with `Image` type
* v1.68.0: Support `AWS_ENDPOINT_URL` for configuring the `boto3.client` endpoint
* v1.67.0: Patch underlying `boto3.Session.client` instead of `boto3.client`
* v1.55.0: Fix s3 URl detection when using a nested template
* v1.53.1: Fix logic around local URLs for ECR image repositories
* v1.1.0.1: Minor fix, release initial version of `samlocal` command
* v1.1.0: Initial version

## License

This software library is released under the Apache License, Version 2.0.
