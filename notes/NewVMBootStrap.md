# New Virtual Server Bootstrap

All this needs to be moved to an aviary module, so eventually this file will 
become just:

## install aviary and apply 
TBD (see https://git.turnsys.com/TSGTechops/ConfigMgmt)

(soon to be legacy content follows...)

## setup k3s (we won’t have any virtual machines that aren’t k3s servers or agents) 

### server
curl -sfL https://get.k3s.io | sh -s - server --datastore-endpoint=<load balanced mysql url>/k3s" --no-deploy servicelb --no-deploy traefik

### agent 
(obtain from your local friendly k3s server)

## setup basics 

### ssh pub key pull 


### basic package bits

apt update ; apt -y full-upgrade 
apt-get --purge -y remove nano snapd lvm2 
apt-get -y install logwatch molly-guard tuned snmpd
apt update ; apt -y full-upgrade 

### root mail
(setup /etc/aliases to email <someone@.who.cares)

### netdata

bash <(curl -Ss https://my-netdata.io/kickstart.sh) 
(add stream.conf as appropriate and restart netdata) 

### password-less sudo

(We build all virtual machines with a dedicated localuser account)

/etc/sudoers.d/localuser
localuser ALL=(ALL) NOPASSWD: ALL

### webmin



