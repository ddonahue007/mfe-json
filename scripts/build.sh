#!/usr/bin/env bash

DIR=$(dirname "$0")
source ${DIR}/common/logger.sh

IMPORT_FILENAME=importmap.json
VERSION=$(git rev-parse --short HEAD)
DIST_DIR=dist

USAGE="Usage: "`basename $0`" [clean|dist|deploy]"

if [ -z "${NAMESPACE}" ]; then
  log-err "You must set NAMESPACE in you environment!
  example:
          export NAMESPACE=foobar"
  exit 1
fi

# push the `importmap.json file up to given location
deploy() {
  sleep 60
  local _resource_host=$(oc --namespace ${NAMESPACE} get route --selector=app=nginx -o=jsonpath={.items..status.ingress..host})
  local _pod_name=$(oc --namespace ${NAMESPACE} get pods --selector=app=nginx --field-selector=status.phase=Running -o=jsonpath={.items..metadata.name})
  log-debug "POD NAME: ${_pod_name}"

  log-info "uploading file: ${VERSION}/${IMPORT_FILENAME}"
  log-debug "tar cvf - ${VERSION}/${IMPORT_FILENAME} | oc --namespace ${NAMESPACE} rsh ${_pod_name} tar xofC - /usr/share/nginx/html"
  cd ${DIST_DIR}
  tar cvf - ${VERSION} | oc --namespace ${NAMESPACE} rsh ${_pod_name} tar xofC - /usr/share/nginx/html
  log-info "NEW RESOURCE CRETATED: http://${_resource_host}/${VERSION}/${IMPORT_FILENAME}"
  cd ..
}

dist() {
  log-debug "mkdir -p ${DIST_DIR}/${VERSION}/"
  mkdir -p ${DIST_DIR}/${VERSION}/

  log-debug "cp ${IMPORT_FILENAME} ${DIST_DIR}/${VERSION}/"
  cp ${IMPORT_FILENAME} ${DIST_DIR}/${VERSION}
}

clean() {
  log-debug "rm -rf ${DIST_DIR}"
  rm -rf ${DIST_DIR}
}

# execute
case $1 in
  dist)
    dist
  ;;
  deploy)
    clean
    dist
    deploy
  ;;
  clean)
    clean
  ;;
  *)
    echo ${USAGE}
  ;;
esac