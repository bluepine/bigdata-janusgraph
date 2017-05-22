#!/bin/bash

#set janusgraph properties
sed -i -e "s|^storage.backend=.*$|storage.backend=cassandra|" $JANUSGRAPH_HOME/conf/janusgraph-cassandra-es.properties
sed -i -e "s|^storage.hostname=.*$|storage_hostname=$CASSANDRA_HOSTNAME|" $JANUSGRAPH_HOME/conf/janusgraph-cassandra-es.properties
sed -i -e "s|^index.search.hostname=.*$|index.search.hostname= $ELASTICSEARCH_HOSTNAME|" $JANUSGRAPH_HOME/conf/janusgraph-cassandra-es.properties

echo "gremlin.graph=org.janusgraph.core.JanusGraphFactory" >> $JANUSGRAPH_HOME/conf/janusgraph-cassandra-es.properties

cp $JANUSGRAPH_HOME/conf/janusgraph-cassandra-es.properties $JANUSGRAPH_HOME/conf/gremlin-server/rest-janusgraph-cassandra-es.properties

sed -i -e "s|^host: .*$|host: 0.0.0.0|" $JANUSGRAPH_HOME/conf/gremlin-server/gremlin-server.yaml

cp $JANUSGRAPH_HOME/conf/gremlin-server/gremlin-server.yaml $JANUSGRAPH_HOME/conf/gremlin-server/rest-gremlin-server.yaml

sed -i -e "s|^channelizer: .*$|channelizer: org.apache.tinkerpop.gremlin.server.channel.HttpChannelizer|" $JANUSGRAPH_HOME/conf/gremlin-server/rest-gremlin-server.yaml
