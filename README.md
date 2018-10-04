## Overview
This repo contains a manifest file for deploying the following assets:
- A cloudant trigger for listening to cloudant changes, which will fire the sequence
- A sequence to contain the two actions below:
  - An action for reading the changes from the cloudant DB
  - An action for getting the classifiers from the visual recognition service of the contents at the imageURL

## Deploy
Look through the manifest.yaml file and provide the required environment variables.

Download wskdeploy from here [wskdeploy download](https://github.com/apache/incubator-openwhisk-wskdeploy/releases) and add `wskdeploy` to your PATH

Use `wskdeploy` to deploy using [`manifest.yml`](./manifest.yml).
```
pushd runtimes/nodejs/
wskdeploy
popd
```
