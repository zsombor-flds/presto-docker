# presto_docker

*Custom Docker image for presto development currently only with Elasticsearch connector.*

## Setup

**Elasticsearch+Kibana:**
***
1. Start the Docker service:
    
        cd ./elasticserch
        docker-compose up

2. Create test index:
- Execute elastic_init/create_es_test_index.json at the Kibana web editor

- Change the params at elastic_init/elastic_bulk_insert.py
- Load the test data into the index

        python elastic_init/elastic_bulk_insert.py
        
**Presto**
***
0. Build the image

        bash ./build.sh

1. copy the **TransportService** address from the running Elasticsearch container:

        docker logs <elasticsearch_container_id> | grep publish_address

2. Paste previously copied *publish_address* to presto/etc/elasticsearch/kibana_sample_data_flights.json to the "host" parameter

3. Start the Presto server/Cli container

        bash run.sh
     
###  Useful Presto commands:
***
Show catalogs:

    show catalogs;

Select from test index:

        select * from elasticsearch.default.prestodebug;

Fixes:
    
https://stackoverflow.com/questions/20093854/jmx-agent-throws-java-net-malformedurlexception-when-host-name-is-set-to-all-num
