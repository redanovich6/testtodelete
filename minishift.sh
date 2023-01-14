sudo adduser reda
sudo usermod -aG sudo reda
id reda
su - reda
sudo apt update
sudo apt install qemu-kvm libvirt-daemon libvirt-daemon-system curl -y
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu14.04 -o /usr/local/bin/docker-machine-driver-kvm
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm
systemctl is-active libvirtd
sudo virsh net-list --all
sudo mkdir /minioc && sudo chmod 777 /minioc && cd /minioc
wget -qO- https://github.com/minishift/minishift/releases/download/v1.34.3/minishift-1.34.3-linux-amd64.tgz | tar xvz
export PATH=/minioc/minishift-1.34.3-linux-amd64:$PATH
minishift start
eval $(minishift oc-env)
oc login -u system:admin
oc create ns sostrades
oc project sostrades
oc adm policy add-cluster-role-to-user cluster-admin admin --as=system:admin
## access to console with admin user
oc login -u admin -p admin
docker login -u admin -p $(oc whoami -t) $(minishift openshift registry)
