FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install --yes geth
RUN apt-get update && apt-get install --yes iputils-ping
RUN apt-get update && apt-get install --yes iproute2

RUN mkdir eth

COPY distr /eth/distr

WORKDIR /eth
RUN geth --nousb init distr/genesis.json

