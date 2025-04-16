ui = true

storage "file" {
  path = "/vault/data/prod"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "0"

  tls_cert_file = "/vault/certs/vault.crt"
  tls_key_file  = "/vault/certs/vault.key"
}

