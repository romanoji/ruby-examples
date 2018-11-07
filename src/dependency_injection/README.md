≪ [back to contents](../../README.md)

## Dependency Injection examples

Simple DI examples based on
[`dry-container`](https://dry-rb.org/gems/dry-container/),
[`dry-auto_inject`](https://dry-rb.org/gems/dry-auto_inject/) &
[`dry-system`](https://dry-rb.org/gems/dry-system/) libs.

### What's inside?
- `intro.rb` file contains basic usage of the above libs.

- `example_1..3` dirs contain DI examples, which shows usage of the libs.

- `usage_1..2` dirs contain potential examples, where these DI libs could be used.

All classes inside `examples1..2` dirs are loaded and registered in the DI container
automatically via `dry-system`'s container, which is configured in `config/di_container.rb` file. 

### How to run it?

- `ruby intro.rb` - to run basic examples

- `EXAMPLE=1` OR `EXAMPLE=2 ruby run.rb` - to run examples from the respective directories.
