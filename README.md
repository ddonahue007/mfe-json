mfe-json (Micro Front End)
==================
This repository contains a json file with import references

Deploy To OpenShift
--------------------------------------
@TODO: Automated push to openshift app using pipelines

Manual push from local repository

1. set NAMESPACE environment variable
    ```
    export NAMESPACE=<namespace|project>
    ```

2. push the file
    ```
    > ./scripts/build.sh deploy
    2020-08-07 13:40:11 [INFO]  uploading file: cfd8209/importmap.json
    a cfd8209
    a cfd8209/importmap.json
    2020-08-07 13:40:11 [INFO]  NEW RESOURCE CRETATED: http://nginx-ddonahue.apps.ocp4.patternfly.org/cfd8209/importmap.json
    ```
   
confirm the file using one of the below
----------------------------------------
1. open in browser: 
    ```
    http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
    ```
2. use curl:
    ```
    curl -o /tmp/importmap.json http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
    ```
