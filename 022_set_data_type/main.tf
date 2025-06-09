/*
The `set` data type is used to define an UNORDERED collection of UNIQUE values
of the SAME TYPE.
*/
variable "set_of_fruits" {
  type = set(string)
  default = ["apple", "banana", "cherry", "apple", "orange", "banana"]
}

output "unique_fruits" {
  value = var.set_of_fruits
}