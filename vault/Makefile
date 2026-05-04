
.EXPORT_ALL_VARIABLES:
VAULT_WRAPPER=docker exec -it vault

.PHONY: vault-start vault-init vault-unseal vault-status vault-connect

default:
	vault-status

vault-start:
	docker compose up -d

vault-init:
	${VAULT_WRAPPER} vault operator init -key-shares=1 -key-threshold=1 -format=json > unseal.json

vault-unseal:
	@${VAULT_WRAPPER} vault operator unseal $(shell jq -r '.unseal_keys_b64[0]' unseal.json)

vault-status:
	@${VAULT_WRAPPER} vault status

vault-connect:
	@${VAULT_WRAPPER} /bin/sh -c 'export VAULT_TOKEN='$(shell cat unseal.json | jq -r '.root_token')' && /bin/sh'

