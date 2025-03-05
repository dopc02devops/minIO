
MinIO provides Lifecycle Management to automatically manage the expiration and transition of objects. This is useful for optimizing storage by deleting old or infrequently accessed objects or transitioning them to different storage tiers.

## Create a Bucket ##
- mc alias set local-lifecyle http://localhost:9000 admin admin123
  mc mb local-lifecyle/lifecycle-bucket

## Create user ##
- mc admin user add local-lifecyle Dona password
- mc admin user enable local-lifecyle Dona

## Import configuration ##
- mc ilm import local-lifecyle/lifecycle-bucket < ./lifecycle-management/lifecycle.json

## Verify Lifecycle Policy ##
- mc ilm export local-lifecyle/lifecycle-bucket

## Test Object Expiration ##
- mc cp ./lifecycle-management/example.txt local-lifecyle/lifecycle-bucket/

## Enable versioning ##
- mc version enable local-lifecyle/lifecycle-bucket

## Upload a new version of a file ##
- mc cp ./lifecycle-management/example.txt local-lifecyle/lifecycle-bucket/

## List versions ##
- mc ls --versions local-lifecyle/lifecycle-bucket

## Test Version Expiration ##
- Older versions will be deleted after 1 days according to the lifecycle rule

