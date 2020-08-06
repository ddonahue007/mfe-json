#!/usr/bin/env bash

#
# push the `importmap.json file up to given location
#
DIR=$(dirname "$0")
source ${DIR}/common/logger.sh

if [ -z "${NAMESPACE}" ]; then
  log-err "You must set NAMESPACE in you environment!
  example:
          export NAMESPACE=foobar"
  exit 1
fi

export POD_NAME=$(oc --namespace ${NAMESPACE} get pods --selector=app=nginx --field-selector=status.phase=Running -o=jsonpath={.items..metadata.name})
log-debug "POD_NAME: ${POD_NAME}"

log-info "uploading file: importmap.json"
log-debug "tar cvf - importmap.json | oc --namespace ${NAMESPACE} rsh ${POD_NAME} tar xofC - /usr/share/nginx/html"
tar cvf - importmap.json | oc --namespace ${NAMESPACE} rsh ${POD_NAME} tar xofC - /usr/share/nginx/html
