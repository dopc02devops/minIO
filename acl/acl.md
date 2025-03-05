
## Create bucket ##
- mc mb minio/acl-bucket

## Apply the policy ##
- mc admin policy create minio read-only-policy ./acl/read-only.json
- mc admin policy info minio read-only-policy

## Create user ##
- mc admin user add minio Rima password
- mc admin user enable minio Rima

## Attach the policy to the user ##
- mc admin policy attach minio read-only-policy --user=Rima

## Or group ##
- mc admin group add minio readers Rima
- mc admin group list minio
- mc admin group info minio readers
- mc admin policy attach minio read-only-policy --group=readers
- mc admin group add minio readers Hannah
- mc admin policy attach minio read-only-policy --group=Rima

## Make bucket private ##
- mc anonymous set private minio/acl-bucket

## Try to list objects in a bucket ##
- mc ls minio/acl-bucket

## login as new user Madris ##
- mc alias set local-madris http://localhost:9000 admin admin123
- mc admin user add minio Madris password
- mc admin user enable minio Madris
- mc ls local-madris/acl-bucket

## un-assign policy
- mc admin policy detach minio --user=Rima policy=read-only-policy
- mc admin policy detach minio --group=readers policy=read-only-policy

## Remove the policy ##
- mc admin policy remove minio read-only-policy