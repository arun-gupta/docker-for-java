docker-machine ssh manager1 \
        "docker swarm init \
        --listen-addr $(docker-machine ip manager1) \
        --advertise-addr $(docker-machine ip manager1)"
docker-machine ssh manager2 \
        "docker swarm join \
        --token `docker-machine ssh manager1 "docker swarm join-token manager -q"` \
        --listen-addr $(docker-machine ip manager2) \
        --advertise-addr $(docker-machine ip manager2) \
        $(docker-machine ip manager1)"
docker-machine ssh manager3 \
        "docker swarm join \
        --token `docker-machine ssh manager1 "docker swarm join-token manager -q"` \
        --listen-addr $(docker-machine ip manager3) \
        --advertise-addr $(docker-machine ip manager3) \
        $(docker-machine ip manager1)"
docker-machine ssh worker1 \
        "docker swarm join \
        --token `docker-machine ssh manager1 "docker swarm join-token worker -q"` \
        --listen-addr $(docker-machine ip worker1) \
        --advertise-addr $(docker-machine ip worker1) \
        $(docker-machine ip manager1)"
docker-machine ssh worker2 \
        "docker swarm join \
        --token `docker-machine ssh manager1 "docker swarm join-token worker -q"` \
        --listen-addr $(docker-machine ip worker2) \
        --advertise-addr $(docker-machine ip worker2) \
        $(docker-machine ip manager1)"
docker-machine ssh worker3 \
        "docker swarm join \
        --token `docker-machine ssh manager1 "docker swarm join-token worker -q"` \
        --listen-addr $(docker-machine ip worker3) \
        --advertise-addr $(docker-machine ip worker3) \
        $(docker-machine ip manager1)"
docker-machine ssh manager1 "docker node ls"
