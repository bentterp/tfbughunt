
output "mymap_raw" {
  value = var.mymap
}
output "mymap_tomap" {
  value = tomap(var.mymap)
}
