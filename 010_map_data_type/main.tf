/*
A map is a collection of key-value pairs.
The key must always be [1] unique, and [2] strings.
The values can be of any type, but must be of the same type in a given map.
*/
variable "tags" {
  type = map(string)
  default = {
    "name"        = "app-server"
    "environment" = "prod"
    "team"        = "payments"
  }
}

variable "users_ages" {
  type = map(number)
  default = {
    "alice"   = 30
    "bob"     = 25
    "charlie" = 35
  }
}

/*
Accessing the values of a map is done using the square brackets notation.
Inside the brackets, the key of the element is specified.
*/
output "name_tag" {
  value = var.tags["name"]
}

/*
The length function returns the number of elements in the map.
*/
output "number_of_users" {
  value = length(var.users_ages)
}

