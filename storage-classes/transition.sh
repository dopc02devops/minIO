#!/bin/bash

# Define your MinIO alias and buckets
MINIO_ALIAS="myminio"
SOURCE_BUCKET="mybucket"
DEST_BUCKET_GLACIER="mybucket-glacier"
DEST_BUCKET_REDUCED="mybucket-reduced"

# Loop through objects in the bucket
for object in $(mc ls ${MINIO_ALIAS}/${SOURCE_BUCKET}/); do
  # Get the last modified date of the object
  last_modified=$(mc stat ${MINIO_ALIAS}/${SOURCE_BUCKET}/${object} | grep "Last modified" | awk '{print $3 " " $4 " " $5}')

  # Calculate the time difference and decide if the object should be moved
  if [[ $(date -d "$last_modified" +%s) -lt $(date -d "10 days ago" +%s) ]]; then
    # Move to GLACIER storage class if object hasn't been accessed in 30 days
    mc cp ${MINIO_ALIAS}/${SOURCE_BUCKET}/${object} ${MINIO_ALIAS}/${DEST_BUCKET_GLACIER}/ --storage-class GLACIER
    mc rm ${MINIO_ALIAS}/${SOURCE_BUCKET}/${object}
  fi
done
