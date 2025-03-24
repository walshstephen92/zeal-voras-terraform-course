# Terraform Variable Precedence

Terraform resolves variable values based on a specific order of precedence. When multiple sources define the same variable, Terraform uses the value from the source with the highest precedence.

Here's the order, from highest to lowest:

1.  **Command-line flags (`-var` and `-var-file`):**
    * Values passed directly via `-var="name=value"` or `-var-file="filename.tfvars"` on the command line override all other sources.
2.  **`terraform.tfvars` file:**
    * A file named `terraform.tfvars` in the current working directory.
3.  **`*.auto.tfvars` files:**
    * Any files ending in `.auto.tfvars` in the current working directory, processed in alphabetical order.
4.  **Environment variables (`TF_VAR_name`):**
    * Environment variables prefixed with `TF_VAR_`, where `name` matches the Terraform variable name.
5.  **`variable` block `default` values:**
    * The `default` value specified within the `variable` block in your Terraform configuration.

**Key Points:**

* Higher precedence sources overwrite lower precedence sources.
* `-var` flags override `-var-file` contents if the same variable is defined in both.
* `*.auto.tfvars` files are processed alphabetically, so later files can override earlier ones.
* Using `-var` or environment variables is often preferred for sensitive data, avoiding storing it in version control.
* `default` values provide a fallback when no other value is specified.