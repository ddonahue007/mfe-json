mfe-json (Micro Front End)
==================

This repository contains a json file with import references

Deploy To OpenShift
--------------------------------------
Clone this repository
@TODO: Automated push to openshift app using pipelines

Manual push from local repository
 ```
> tar cvf - importmap.json | my-oc rsh nginx-2-x5kw5 tar xofC - /usr/share/nginx/html
 ```

Note: after you validate the changes have been pushed up to open shift make sire to push the changes to github

# you can confirm the file was uploaded by doing either step.
  1. open in browser: http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
  2. use curl:
  ```
  > curl -o /tmp/importmap.json http://nginx-<namespace>.apps.ocp4.patternfly.org/importmap.json
  ```
