variable "names" {
  type = set(string)
  default = [ "Peter", "Paul" ]
}

locals {
  files = {for name in var.names: name => "This is ${name}'s file"}
}
resource "local_file" "varfilestest" {
  for_each = var.names
  content = each.value
  filename = "${path.root}/${lower(each.key)}.txt"
}
resource "local_file" "localfilestest" {
  for_each = tomap(local.files)
  content = each.value
  filename = "${path.root}/${lower(each.key)}.txt"
}
