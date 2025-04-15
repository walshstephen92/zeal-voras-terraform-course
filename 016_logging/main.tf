/*
Terraform's logging is not enabled by default.
It needs to be explicitly enabled using the `TF_LOG` environment variable.
The log level can be set to one of the following values, from most to least verbose:
  TRACE
  DEBUG
  INFO
  WARN
  ERROR

The `TF_LOG` environment variable can be set using the `export` command in the terminal on Unix-based systems, e.g.
  `export TF_LOG=DEBUG`
or in the command line on Windows, e.g.
  `set TF_LOG=DEBUG`

The log output can be directed to a file using the `TF_LOG_PATH` environment variable, e.g.
  `export TF_LOG_PATH=terraform.log`
*/

resource "local_file" "foo" {
  filename = "foo.txt"
  content  = "foo!"
}