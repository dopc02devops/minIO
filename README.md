# minIO
MinIO is a high-performance, S3-compatible object storage solution designed for cloud-native applications

## install minio client ##
- brew install minio/stable/mc

## mini-kube ##
- minikube start
- kubectl config use-context minikube
- kubectl get nodes

# Generate the certificate (for testing purposes, use self-signed certificates)
- openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout \
   private.key -out public.crt -subj "/CN=localhost"

## Create name-space ##
- kubectl create namespace ops

## Create secrets ssl ##
- kubectl create secret tls minio-certs \
  --cert=./public.crt \
  --key=./private.key -n ops
- kubectl get secret minio-certs -n ops
- kubectl get secret minio-certs -o yaml -n ops

## Create secrets login ##
- kubectl create secret generic minio-secret \
  --from-literal=rootUser=admin \
  --from-literal=rootPassword=admin246 -n ops

## Configure hashiCorp ##
hashiCorp.md

## Configure chart ##
- helm repo add minio https://operator.min.io/
- helm repo update
- helm search repo minio
- helm show values minio/minio > ./values-tls.yaml

## Configure minio with tls ##
- helm install minio minio/minio -f ./values-tls.yaml -n ops
- kubectl get pods -n ops
- helm uninstall minio -n ops

## Access from local host ##
- kubectl get service -n ops
- kubectl port-forward -n ops svc/minio-console 9001:9001
- kubectl port-forward -n ops svc/minio 9000:9000
- https://localhost:9001

## Set up client ##
- mc alias set local https://localhost:9000 admin admin246 --insecure

## Get secret ##
- kubectl get secret minio-secret -n ops -o yaml
- kubectl get secret minio-secret \
  -n ops -o jsonpath="{.data.rootUser}" | base64 --decode && echo
- kubectl get secret minio-secret \
  -n ops -o jsonpath="{.data.rootPassword}" | base64 --decode && echo

## Create delete bucket using Alias ##
- mc mb local/sse-bucket --insecure
- mc ls local --insecure
- mc rb local/sse-bucket --insecure

## Create User ##
- mc admin user list local --insecure
- mc admin user add local minio-user password --insecure
- mc alias set minio-user http://localhost:9000 minio-user password --insecure
- mc admin policy attach local --user minio-user consoleAdmin --insecure

## Delete all ## 
kubectl delete secret --all -n ops
kubectl delete secret --all -n ops
kubectl delete configmap --all -n ops
kubectl delete pvc --all -n ops

