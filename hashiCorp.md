

- helm repo add hashicorp https://helm.releases.hashicorp.com
- helm repo update
- kubectl create namespace vault
- helm install vault hashicorp/vault --namespace vault
## Initialize Vault ##
- kubectl exec -it vault-0 -n vault -- vault operator init
## Unseal Vault ##
- kubectl exec -it vault-0 -n vault -- vault operator unseal SYTDAz9qYGUmSmHK2T00u8MRaz4oBk2OGriayfsQ6Wrw
- kubectl exec -it vault-0 -n vault -- vault operator unseal YT8ZqBk3Y0Q7y2Y1nPmuLW6QKLirW2r8Td0ZgdK3P26J
- kubectl exec -it vault-0 -n vault -- vault operator unseal FMysS05rqtDoNPZ3Q6vW0PaYCVn8/Myic92IuOmtAF20
## Access Vault ##
- kubectl port-forward vault-0 8200:8200 -n vault
- http://localhost:8200
## Access Vault CLI ##
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=hvs.b8QDE5XwdWg5LQpVgLGm6mTM
## Create key on Vault ##
- Key: minio-key-kms

kubectl delete pods -n vault --all


Unseal Key 1: SYTDAz9qYGUmSmHK2T00u8MRaz4oBk2OGriayfsQ6Wrw
Unseal Key 2: YT8ZqBk3Y0Q7y2Y1nPmuLW6QKLirW2r8Td0ZgdK3P26J
Unseal Key 3: FMysS05rqtDoNPZ3Q6vW0PaYCVn8/Myic92IuOmtAF20
Unseal Key 4: MCF7vhX2GFvcEVp4TUvd+sr/R8mAgWufs5RruvXW8ddY
Unseal Key 5: iaN6QBJHAdMZMCMPHpEUMs5Ty3jRuGlvkLTlDfIIPhV7

Initial Root Token: hvs.b8QDE5XwdWg5LQpVgLGm6mTM

Vault initialized with 5 key shares and a key threshold of 3. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 3 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated root key. Without at least 3 keys to
reconstruct the root key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "vault operator rekey" for more information.