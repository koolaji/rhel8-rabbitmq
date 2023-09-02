docker build --network host -t koolaji/rabbitmq:rhel-8-0.1 .
docker rm -f  rabbitmq
docker run  --privileged --name rabbitmq  -d koolaji/rabbitmq:rhel-8-0.1
sleep 5
docker ps -a
docker logs -f rabbitmq
#docker exec -ti docker-sshd passwd
