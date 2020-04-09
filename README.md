# geth_madt

1. Download and start MADT
```
cd ~
git clone --recursive https://github.com/dltcspbu/madt/
mkdir ~/madt/labs && export MADT_LABS_DIR=$HOME/madt/labs
mkdir ~/madt/sockets && export MADT_LABS_SOCKETS_DIR=$HOME/madt/sockets

cd madt
sudo pip3 install -r ./requirements.txt
sudo make && sudo make install

sudo -HE env PYTHONPATH=$HOME/madt:$PYTHONPATH SSH_PWD=demo python3 madt_ui/main.py 80  
```

2. Build images and start the lab
```
#open new terminal window
export PYTHONPATH=$HOME/madt:$PYTHONPATH
docker build -t eth .
python3 ./lab.py
```

3. Open 127.0.0.1:80
4. login as `demo:demo`, Open lab "eth" and press restart
5. check container with 
```
docker logs -f MADT_eth_eth2
```
if you see generating DAG, everything is okey

6. Connect all nodes and check peers and blockNumber
```
docker exec -it MADT_eth_eth2 ./distr/connect.sh 4
docker exec -it MADT_eth_eth2 ./distr/check.sh
```

if you see json with info and block number are same, or increased with time, everything is okey
