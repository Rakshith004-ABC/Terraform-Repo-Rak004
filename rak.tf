provider "local" {}

resource "local_file" "test" {
  filename = "rak.txt"
  content  = "this is the first terraform file"
}
