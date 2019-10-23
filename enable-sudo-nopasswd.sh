#
USERNAME=`whoami`
echo "$USERNAME ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME
sudo chmod 0440 /etc/sudoers.d/$USERNAME

