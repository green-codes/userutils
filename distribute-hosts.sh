

if [[ $# -lt 2 ]]; then echo -e "Usage: $0 <host file> <user@hosts>... \nDistributes the provided hosts file to all remote hosts"; exit -1; fi

for i in ${@:2}; do
    cat $1 | ssh $2 -- "sudo tee /etc/hosts > /dev/null"
done
