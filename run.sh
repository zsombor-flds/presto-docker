sudo docker run -it \
--name=presto_docker \
--network=host \
-v $PWD/presto/etc/:/opt/presto-server-0.221/etc/ \
foldesizsombor/presto_docker:01 \
bash presto_init.sh