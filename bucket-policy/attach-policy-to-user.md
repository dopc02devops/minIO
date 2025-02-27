
## Create User ##
- mc alias set minio http://localhost:9000 admin admin123
- mc admin user add minio Hannah admin12345
- mc admin policy create minio bucket-access-only-policy ./bucket-policy/bucket-access.json
- mc admin policy attach minio bucket-access-only-policy --user Hannah
- mc admin policy attach minio bucket-access-only-policy --user Hannah

## Create bucket ##
- mc mb minio/learn-bucket-policies

## Bucket commands ##
mc ls minio/learn-bucket-policies
mc stat minio/learn-bucket-policies
mc location minio/learn-bucket-policies

## Set/Get bucket policy ##
- mc anonymous set public minio/learn-bucket-policies
- mc anonymous set private minio/learn-bucket-policies

- mc anonymous get-json minio/learn-bucket-policies
- mc anonymous get-json minio/learn-bucket-policies >> ./bucket-policy/policy.json
