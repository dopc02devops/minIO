## Configure chart ##
- helm repo add hashicorp https://helm.releases.hashicorp.com
- helm repo update
- kubectl create namespace vault
- helm install vault hashicorp/vault --namespace vault

## Initialize Vault ##
- kubectl exec -it vault-0 -n vault -- vault operator init

## Unseal Vault ##
- kubectl exec -it vault-0 -n vault -- vault \
  operator unseal LWObRQiNT8nlaDU6Z2SkMGO99NlIUWS/zNibwMdhQLVl
- kubectl exec -it vault-0 -n vault -- vault \
  operator unseal KgQcH2zwm5ZqueFqQAvyw1pGWuhQDjmFru0KnEW/hvWT
- kubectl exec -it vault-0 -n vault -- vault \
  operator unseal jTy2ltXkjl/LPT6Rb0WxGezJBIL+Yww3iN1iLWYlZPdX

## Access Vault ##
- kubectl port-forward vault-0 8200:8200 -n vault
- http://localhost:8200

## Create key on Vault ##
- Key: minio-key-kms

kubectl delete pods -n vault --all


Unseal Key 1: LWObRQiNT8nlaDU6Z2SkMGO99NlIUWS/zNibwMdhQLVl
Unseal Key 2: KgQcH2zwm5ZqueFqQAvyw1pGWuhQDjmFru0KnEW/hvWT
Unseal Key 3: jTy2ltXkjl/LPT6Rb0WxGezJBIL+Yww3iN1iLWYlZPdX
Unseal Key 4: 2HNMMi5rOSgAwZ6bMgZY47y0whM+2HJFonUToGzLX2vI
Unseal Key 5: OdgJbXn7c8+pC1aoWVmh4CF8gocdKHZHlkyBaPCoUvtU

Initial Root Token: hvs.hTb5IN3hTW8waZ4q1jhzOEUj