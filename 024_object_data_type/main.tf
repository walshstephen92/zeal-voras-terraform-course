/*
The `object` data type is similar to a map but with a fixed set of keys and types.
*/
variable "person" {
  type = object({
    name    = string
    age     = number
    hobbies = list(string)
  })

  default = {
    name    = "Stephen"
    age     = 32
    hobbies = ["football", "gym", "coding"]
  }
}

output "person_-_all_details" {
  value = var.person
}

output "person_-_name" {
  value = var.person.name
}