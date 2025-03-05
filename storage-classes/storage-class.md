In MinIO, storage classes determine how data is stored and retrieved, helping optimize costs and performance for different use cases.

MinIO supports multiple storage classes, such as:

STANDARD: Default storage class. It is designed for high availability and performance, with minimal latency and redundancy.
REDUCED_REDUNDANCY: A storage class that provides lower redundancy compared to the standard class.
GLACIER: A storage class for infrequently accessed data that can tolerate retrieval latency (it maps to the Amazon S3 Glacier class).
INTELLIGENT_TIERING: Automatically moves data between different storage classes based on access patterns.

## Configure mc ##
- mc alias set myminio http://localhost:9000 admin admin123

## Create a Bucket with STANDARD Storage Class ## 
- mc mb myminio/standard-bucket

## Create a Bucket with REDUCED_REDUNDANCY Storage Class ## 
- mc mb myminio/redundancy-bucket

## Create a Bucket with GLACIER Storage Class ## 
- mc mb myminio/glacier-bucket

## Upload Objects with Different Storage Classes##
- mc cp ./lifecycle-management/example.txt myminio/standard-bucket/
- mc cp ./lifecycle-management/example.txt myminio/redundancy-bucket/
- mc cp ./lifecycle-management/example.txt myminio/glacier-bucket/

## Verifying the Storage Class of Objects ##
- mc stat myminio/standard-bucket/example.txt
- mc stat myminio/redundancy-bucket/example.txt
- mc stat myminio/glacier-bucket/example.txt

## Automatic transition ##
- craete a job that runs the script ./storage-classes/transition.sh