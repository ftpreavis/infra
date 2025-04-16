storage "sqlite" {
  path = "/vault/data/vault_dev.db"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

ui = true
disable_mlock = true
