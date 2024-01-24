#! /bin/bash

az group create \
    --name sprint-RG \
    --location koreacentral


az vm create \
    --resource-group sprint-RG \
    --name sprint-control-plane \
    --size Standard_D4s_v3 \
    --image Ubuntu2204 \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username sprint \
    --admin-password password2024! \
    --public-ip-sku Standard \
    --custom-data cloud-init.txt
	
az vm create \
    --resource-group sprint-RG \
    --name sprint-worker-01 \
    --size Standard_D4s_v3 \
    --image Ubuntu2204 \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username sprint \
    --admin-password password2024! \
    --public-ip-sku Standard \
    --custom-data cloud-init.txt
    
az vm create \
    --resource-group sprint-RG \
    --name sprint-worker-02 \
    --size Standard_D4s_v3 \
    --image Ubuntu2204 \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username sprint \
    --admin-password password2024! \
    --public-ip-sku Standard \
    --custom-data cloud-init.txt

## 방화벽 설정 sprint-control-plane
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 80 --priority 310
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 5000 --priority 320
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 2049 --priority 330
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 443 --priority 340
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 8080 --priority 350
az vm open-port --resource-group sprint-RG --name sprint-control-plane --port 30007 --priority 360

## 방화벽 설정 sprint-worker-01
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 80 --priority 310
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 5000 --priority 320
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 2049 --priority 330
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 443 --priority 340
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 8080 --priority 350
az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port 30007 --priority 360


## 방화벽 설정 sprint-worker-02
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 80 --priority 310
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 5000 --priority 320
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 2049 --priority 330
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 443 --priority 340
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 8080 --priority 350
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port 30007 --priority 360