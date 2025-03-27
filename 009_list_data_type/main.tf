/*
A list is an ordered collection of values.
If the values are of the same type, that type can be specified.
*/
variable "example_list" {
  type    = list(string)
  default = ["apple", "banana", "cherry"]
}

/*
Accessing the elements of a list is done using the square brackets notation.
Inside the brackets, the index of the element is specified.
*/
output "first_item" {
  value = var.example_list[0]
}

/*
The length function returns the number of elements in the list.
*/
output "list_length" {
  value = length(var.example_list)
}

/*
If the values are of different types, the type can be omitted.
*/
variable "list_of_mixed_types" {
  type    = list(any)
  default = [1, "two", true]
}

/*
As well as having multiple elements, a list can be empty...
*/
variable "empty_list" {
  type    = list(string)
  default = []
}

/*
... or contain a single element.
*/
variable "single_item_list" {
  type    = list(string)
  default = ["one"]
}