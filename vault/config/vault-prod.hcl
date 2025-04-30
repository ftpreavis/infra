# vault-prod.hcl
ui = true

storage "raft" {
  path    = "/vault/file"
  node_id = "node1"
}

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_disable   = false
  tls_cert_file = "/vault/certs/vault.crt"
  tls_key_file  = "/vault/certs/vault.key"
}

api_addr     = "https://vault-module:8200"
cluster_addr = "https://vault-module:8201"
