mfe-json (Micro Front End)
==================

This repository contains a json file with import references

Deploy To OpenShift
--------------------------------------
Clone this repository
@TODO: Automated push to openshift app using pipelines

Manual push from local repository
```
Get the nginx pod name (pod name is the first column of the command output)
> my-oc get pods |grep nginx
nginx-2-x5kw5                      1/1       Running   0          120m

> tar cvf - importmap.json | oc --namespace <namespace> rsh <POD_NAME> tar xofC - /usr/share/nginx/html
 ```

Note: after you validate the changes have been pushed up to open shift make sire to push the changes to github

# you can confirm the file was uploaded by doing either step.
  1. open in browser: http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
  2. use curl:
  ```
  > curl -o /tmp/importmap.json http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
  ```
