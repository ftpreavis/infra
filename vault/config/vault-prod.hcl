storage "sqlite" {
  path = "/vault/data/vault_prod.db"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 0 # Enable TLS for prod if possible
}

ui = true
disable_mlock = true
