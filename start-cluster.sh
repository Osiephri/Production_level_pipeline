#!/bin/bash
eksctl create cluster \
--name demoapp \
--version 1.20 \
--region eu-south-1 \
--nodegroup-name m5nodes \
--node-type m5.xlarge \
--nodes 2

sleep 1
eksctl utils write-kubeconfig --cluster demoapp