output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "key_pair_name" {
  description = "Key pair name"
  value       = aws_key_pair.key_pair.key_name
}
