#!/bin/bash

# From http://redsymbol.net/articles/unofficial-bash-strict-mode/

reqfootContainerList=(

#TSYS Corporate IT
nikisweeting/archivebox

#TSYS Enteprise IT
docker.elastic.co/elasticsearch/elasticsearch-oss
bitwardenrs/server
tykio/tyk-pump-docker-pub
tykio/tyk-dashboard
tykio/tyk-gateway

#reqfoot apps
maxking/mailman-web
maxking/mailman-core
sipwise/mr8.4.2
lovasoa/wbo
pipech/erpnext-docker-debian
huginn/huginn
rundeck/rundeck
mikesplain/openvas
killbill/kaui
killbill/killbill
wazuh/wazuh-kibana
wazuh/wazuh
wazuh/wazuh-nginx
ducatel/reviewboard
oxidized/oxidized
librenms/librenms
jordan/rundeck

#Support infra
redis
univention/ucs-master-amd64
univention/ucs-generic-amd64
rabbitmq
memcached
cfssl/cfssl
osixia/cfssl-multirootca
redis
nats-streaming

#TSYS IT apps
rroemhild/mailpile

#RackRental
openfaas/gateway
openfaas/queue-worker
openfaas/faas-swarm
openfaas/basic-auth-plugin
wordpress
)

IFS=$'\n\t'

for dockerImg in ${reqfootContainerList[@]}; do
sudo docker pull $dockerImg
done


