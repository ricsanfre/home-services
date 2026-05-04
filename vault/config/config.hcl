cluster_addr  = "http://vault:8201"
api_addr      = "https://$VAULT_URL"
ui = true
plugin_directory = "/etc/vault/plugin"

log_requests_level = "debug"
log_level = "debug"

disable_mlock = true

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
 }

storage "raft" {
  path    = "/vault/data"
}

telemetry {
  disable_hostname = true
  prometheus_retention_time = "12h"
}