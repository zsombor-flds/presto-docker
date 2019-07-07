sudo docker run -it --network=elastic_esnet \
-v $PWD/presto/etc/:/opt/presto-server-0.221/etc/ \
zsfoldesi/presto:0.1 \
./presto-server-0.221/bin/launcher run 