#!/bin/bash 

echo "setting bmc for pxe boot..." 

export ISHP="$(dmidecode -t System|grep Manufacturer|grep HP -c)"
export ISDELL="$(dmidecode -t System|grep Manufacturer|grep Dell -c)"

#Set BMC to PXE

if [ $ISHP -eq 1 ]; then
    hpbootcfg -P 
fi

if [ $ISDELL -eq 1 ]; then
    ipmitool chassis bootparam set bootflag force_pxe
fi

#Reboot the system
echo "re-booting..."
    /sbin/reboot

