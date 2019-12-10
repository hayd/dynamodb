#!/usr/bin/env bash

set -Eeo pipefail

URL="https://s3.eu-central-1.amazonaws.com/dynamodb-local-frankfurt/dynamodb_local_latest.tar.gz"
DIR="./dynamodb_local_latest"

if [[ ! -d $DIR ]]; then
  deno eval 'Deno.mkdir("$DIR")';
  curl --progress-bar $URL -o 'dynamodb_local_latest.tar.gz';
  tar -z -x -v -f 'dynamodb_local_latest.tar.gz' --directory="$DIR"
fi

java -D"java.library.path=$DIR/DynamoDBLocal_lib" -jar "$DIR/DynamoDBLocal.jar" -sharedDb &
