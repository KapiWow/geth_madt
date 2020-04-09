from madt_lib.network import Network


def main():
    net = Network('16.0.0.0/8')
    node_count = 3
    eths = []
    for i in range(node_count):
        num = str(i+2)
        #create docker image for i-node
        eth = net.create_node('eth'+num, image='eth', entrypoint='sh -c "distr/setup_account.sh ' + num + '"')
        eths.append(eth)
    #create subnet
    net.create_subnet('net', eths)
    # distribute IP addresses
    net.configure(verbose=True)
    # save lab
    net.render('../../labs/eth', verbose=True)


if __name__ == "__main__":
    main()
