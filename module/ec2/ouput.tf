output "private_key_pem" {
  value = tls_private_key.demo_key.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value = tls_private_key.demo_key.public_key_openssh
}