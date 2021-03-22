#!/bin/bash

echo What should the version be?
read VERSION

docker build -t mrgregf/industy:$VERSION .
docker push mrgregf/industy:$VERSION
ssh root@srv08.mikr.us -p10253 "docker pull mrgregf/industy:$VERSION && docker tag mrgregf/industy:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"