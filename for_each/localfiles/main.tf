variable "names" {
#  type = set(string)
  default = [ "Peter", "Paul" ]
}

locals {
  files = {for name in var.names: name => "This is ${name}'s file"}
}

resource "local_file" "test" {
  for_each = tomap(local.files)

  content = each.value
  filename = "${path.root}/${lower(each.key)}.txt"

}
