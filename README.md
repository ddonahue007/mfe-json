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
    ./scripts/deploy.sh 
     2020-08-06 17:03:46 [INFO]  uploading file: importmap.json
     a importmap.json
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
