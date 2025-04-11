/*
Tools built in to the Terraform language that allow you to transform and manipulate data.
They are used to create dynamic, reusable and maintainable configurations.
*/

/*
Numeric functions, such as:
  - `abs` - returns the absolute value of a number (i.e. its distance from 0 on the number line, therefore always positive regardless of whether the number is negative or positive).
  - `ceil` - rounds a number up to the nearest integer.
  - `floor` - rounds a number down to the nearest integer.
  - `max` - returns the maximum value from a list of numbers.
  - `min` - returns the minimum value from a list of numbers.
*/
output "absolute_value" {
  value = abs(-42)
}

/*
String functions, such as:
  - `join` - joins a list of strings into a single string with a specified separator.
  - `split` - splits a string into a list of strings based on a specified separator.
  - `upper` - converts a string to uppercase.
  - `lower` - converts a string to lowercase.
  - `replace` - replaces all occurrences of a substring in a string with another substring.
*/
output "fruits" {
  value = join(", ", ["apple", "orange", "banana"])
}

/*
Filesystem functions, such as:
  - `file` - reads the contents of a file and returns it as a string.
  - `filebase64` - encodes a file as a base64 string.
  - `templatefile` - renders a template file with variables.
  - `dirname` - returns the directory name of a file path.
  - `basename` - returns the base name of a file path.
*/
resource "aws_iam_user" "admin_user" {
  name = "admin"
}

resource "aws_iam_user_policy" "admin_user_policy" {
  name   = "admin-policy"
  user   = aws_iam_user.admin_user.name
  policy = file("admin_policy.json")
}

/*
Encoding functions, such as:
  - `base64encode` - encodes a string as a base64 string.
  - `base64decode` - decodes a base64 string into a string.
  - `jsonencode` - encodes a value as a JSON string.
  - `jsondecode` - decodes a JSON string into a value.
*/
resource "aws_iam_user" "s3_admin_user" {
  name = "s3-admin"
}

resource "aws_iam_user_policy" "s3_admin_user_policy" {
  name = "s3-admin-policy"
  user = aws_iam_user.s3_admin_user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:*"]
        Resource = "*"
      }
    ]
  })
}

/*
Collection functions, such as:
  - `length` - returns the length of a list or string.
  - `element` - returns the element at a specified index in a list.
  - `concat` - concatenates two or more lists into a single list.
  - `index` - returns the index of the first occurrence of a value in a list.
  - `slice` - returns a subset of a list or string based on specified indices.
*/
output "number_of_people" {
  value = length(["joe", "bob", "frank"])
}

/*
Type Conversion functions, such as:
  - `tostring` - converts a value to a string.
  - `tonumber` - converts a string to a number.
  - `tolist` - converts a value to a list.
  - `tomap` - converts a value to a map.
*/
output "string_to_number" {
  value = tonumber("42")
}