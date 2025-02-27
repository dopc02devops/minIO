# minIO
MinIO is a high-performance, S3-compatible object storage solution designed for cloud-native applications

## mini-kube ##
- minikube start
- kubectl config use-context minikube
- kubectl get nodes

## Configure chart ##
- helm repo add minio https://operator.min.io/
- helm repo update
- helm search repo minio
- helm show values minio/minio > ./values-files/values.yaml
- kubectl create namespace minio-dev
- helm install minio minio/minio -f ./values-files/values.yaml -n minio-dev
- helm uninstall minio

## Access from local host ##
- kubectl get service -n minio-dev
- kubectl port-forward -n minio-dev svc/minio 9001:9001
- You can now access MinIO server on http://localhost:9001

## Get secret ##
- kubectl get secret --namespace minio-dev minio -o jsonpath="{.data.rootUser}" | base64 --decode
- kubectl get secret --namespace minio-dev minio -o jsonpath="{.data.rootPassword}" | base64 --decode

## Configure MinIO mc client MacOs ##
- brew update
- brew install minio/stable/mc

## Configure MinIO mc client Windows ##
- curl -o mc.exe https://dl.min.io/client/mc/release/windows-amd64/mc.exe
- Add to path

## Configure Alias ##
- kubectl port-forward -n minio-dev svc/minio 9000:9000
- mc --version
  mc alias set minio http://localhost:9000 admin admin123
  mc alias ls

## Create delete bucket using Alias ##
- mc mb minio/my-new-bucket-today
- mc ls minio
- mc rb minio/my-new-bucket-today

## Create User ##
- mc admin user list minio
- mc admin user add minio minio-user password
- mc alias set minio-user http://localhost:9000 minio-user password
- mc admin policy attach minio --user minio-user consoleAdmin

