##Change into Root User
Sudo su

###  Ansible Controller Environment (CentOS 7.4)
##Requires Python 2.6 or 2.7
#Install pip
yum -y install python-pip

#Install markupsafe
pip install markupsafe

#Install xmltodict
pip install xmltodict

#Install pywinrm (REQUIRED for WinRM)
pip install pywinrm

#Install nano
yum install nano

#Install tree
yum install tree

#Install Ansible
pip install ansible
ansible --version

#Update Packages
yum -y update


###  Ansible Tower Installation

#CentOS - Install Required Libraries
yum groupinstall 'Development Tools'
yum install openssl python-devel
yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#Ubuntu - Install Required Libraries
apt-get install build-essential libssl-dev libffi-dev python-dev

#Install Cryptography
pip install cryptography

#Download Ansible Tower from Git
wget http://releases.ansible.com/awx/setup/ansible-tower-setup-latest.tar.gz
#unzip
tar -xvf ansible-tower-setup-latest.tar.gz

#Setup Configuration
nano inventory
#Run Setup (within directory)
./setup.sh


###(Optional) Import Inventory
cd /var/lib/awx/project
#Copy Projects Folder Into New Inventory Folder (Created within Ansible Tower)
cp -R /home/vagrant/pluralsight/ DansNodes
#Remove not needed
cd DansNodes
rm group_vars/all.yml
#Import into Ansible Tower
tower-manage inventory_import --source=./inventory.yml --inventory-name="Dans Nodes"

