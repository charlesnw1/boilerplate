# New Virtual Server Bootstrap

All this needs to be moved to an aviary module, so eventually this file will 
become just:

## install aviary and apply 
TBD (see https://git.turnsys.com/TSGTechops/ConfigMgmt)



(soon to be legacy content follows...)

## setup basics 

### ssh pub key pull 

### basic package bits

apt update ; apt -y full-upgrade 
apt-get -y install logwatch molly-guard tuned snmpd
apt-get --purge -y remove nano snapd lvm2 mdadm multipath-tools
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

### install webmin


### join domain
univention-domain-join-cli --dc-ip 10.222.3.100 --username charles --password-file pw --skip-login-manager

