#!/bin/bash
set -x
/opt/janusgraph-properties.sh
/opt/janusgraph/bin/gremlin-server.sh
