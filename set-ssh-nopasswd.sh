

if [[ $# -lt 1 ]]; then
    echo -e "Usage: $0 <username@hosts>... \nDistributes current user's SSH public key to username@host(s), and also enables passwordless sudo for targer user"; exit -1; fi

if [[ ! -f ~/.ssh/id_rsa ]]; then ssh-keygen; fi

for i in $@; do
    USERNAME=`echo $i | cut -d '@' -f 1`
    HOST=`echo $i | cut -d '@' -f 2`
    echo $USERNAME@$HOST
    ssh-copy-id $USERNAME@$HOST
    echo "$USERNAME ALL = (root) NOPASSWD:ALL" | ssh $USERNAME@$HOST -- "sudo tee /etc/sudoers.d/$USERNAME"
    ssh $USERNAME@$HOST -- "sudo chmod 0440 /etc/sudoers.d/$USERNAME"
done
