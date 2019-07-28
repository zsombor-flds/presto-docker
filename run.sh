sudo docker build -t zsfoldesi/presto:0.1 . &&
sudo docker run -it --network=host \
-v /home/pseu/PROJEKT/presto_test/presto_docker/presto/etc/:/opt/presto-server-0.221/etc/ \
zsfoldesi/presto:0.1 bash presto_init.sh