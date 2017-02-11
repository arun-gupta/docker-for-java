#!/bin/bash

# Swarm mode using Docker Machine

managers=3
workers=3

# create manager machines
echo "======> Creating $managers manager machines ...";
for node in $(seq 1 $managers);
do
	echo "======> Creating manager$node machine ...";
	docker-machine create -d virtualbox manager$node;
done

# create worker machines
echo "======> Creating $workers worker machines ...";
for node in $(seq 1 $workers);
do
	echo "======> Creating worker$node machine ...";
	docker-machine create -d virtualbox worker$node;
done

# list all machines
docker-machine ls

