/*
The zipmap function takes two lists and combines them into a map.
The first list is the keys and the second list is the values, i.e.

  zipmap(keys, values)

The list of keys and the list of values must be the same length.
The keys must be strings. The values can be any type.
The order of both lists is important because the first key will be paired with 
the first value, the second key with the second value, and so on.
*/

variable "fruits" {
  description = "List of fruits"
  type        = list(string)
  default     = ["apple", "banana", "kiwi"]
}

variable "colors" {
  description = "List of colors"
  type        = list(string)
  default     = ["red / green", "yellow", "brown & green"]
}

output "fruit_colors" {
  description = "Map of fruits and their colors"
  value = zipmap(var.fruits, var.colors)
}