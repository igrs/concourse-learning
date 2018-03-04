#!/bin/bash

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${DIR}

if [ -d ${DIR}/keys/web -a -d ${DIR}keys/worker ]; then
    echo "already exist directories."
else
    mkdir -p keys/web keys/worker
fi

ssh-keygen -t rsa -f ${DIR}/keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ${DIR}/keys/web/session_signing_key -N ''
ssh-keygen -t rsa -f ${DIR}/keys/worker/worker_key -N ''

cp ${DIR}/keys/worker/worker_key.pub ${DIR}/keys/web/authorized_worker_keys
cp ${DIR}/keys/web/tsa_host_key.pub  ${DIR}/keys/worker
