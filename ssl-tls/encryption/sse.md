
## SSE ##
- SSE AES-256 encryption is by default or u can create a key
- Create a 256-bit AES key file (32 bytes)
  - dd if=/dev/urandom of=minio-secret.key bs=32 count=1

## Set up client ##
- mc alias set local https://localhost:9000 admin admin123 --insecure

## Create bucket ##
- mc mb local/sse-bucket --insecure

mc encryption enable sse-s3 local/sse-bucket --insecure

mc encrypt set sse-s3 ./ssl-tls/encryption/minio-secret.key local/sse-bucket --insecure 

mc encrypt set sse-s3 local/sse-bucket --insecure 

## Upload an object with encryption ##
- mc cp ./ssl-tls/encryption/test_file.pdf local/sse-bucket/ --enc-s3=AES256 --insecure

## Upload an object without encryption ##
mc cp ./ssl-tls/encryption/test_file.pdf local/sse-bucket/ --insecure

When you start MinIO, it automatically encrypts the data using AES-256 if you don't provide custom keys. If you want to use custom keys, you can provide them through environment variables.

Using Custom Encryption Keys:

Set environment variables to provide your encryption keys. For example, create a MINIO_KMS_SECRET_KEY: