#!/bin/bash
nodes="node1 node2 node3"
echo >> /tmp/hosts
echo "### Cluster peers " >> /tmp/hosts
echo "# Added on `date`" >> /tmp/hosts
for node in $nodes
do
    getent hosts $node >> /tmp/hosts
    done
echo "### End of Cluster peers" >> /tmp/hosts
