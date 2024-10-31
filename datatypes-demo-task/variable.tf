variable "demo_string" {
  type        = string
  description = "A simple string variable"
}

variable "demo_number" {
  type        = number
  description = "A simple number variable"
}


variable "demo_bool" {
  type        = bool
  description = "A simple boolean variable"
}

variable "demo_list" {
  type        = list(string)
  description = "A list of strings"
}

variable "demo_map" {
  type        = map(string)
  description = "A map with string keys and values"
}

variable "demo_set" {
  type        = set(string)
  description = "A set of unique strings"
}

variable "demo_object" {
  type = object({
    name = string
    age  = number
  })
  description = "An object with name and age"
}

variable "demo_tuple" {
  type        = tuple([string, number, bool])
  description = "A tuple containing a string, a number, and a boolean"
}
