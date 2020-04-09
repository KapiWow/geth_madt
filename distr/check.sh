#!/bin/bash

geth --exec "admin.peers" attach http://16.0.0.2:8502

for i in $(seq 2 4)
do
	geth --exec eth.blockNumber attach http://16.0.0.${i}:850${i}
done
