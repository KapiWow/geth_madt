#!/bin/bash

num=$1
geth --password distr/password account new
geth --identity="eth${num}" --mine --minerthreads 1 --verbosity 3 --networkid 500 --rpc --rpcport=850${num} --rpcaddr 16.0.0.${num} --rpcapi="admin,eth,net,web3,personal" --nousb

