function obtain_centos_mac()
{

    DISTRO_TYPE="$(distro |awk '{print $1}'|tr '[:upper:]'  '[:lower:]')"
    DISTRO_VERSION=$(distro |awk '{print $2}'|awk -F '.' '{print $1}')

if [ $DISTRO_TYPE == "centos" ] && [ $DISTRO_VERSION == 6 ] ;
then
     /sbin/ifconfig eth0|grep HWadd| awk '{print $NF}'|tr '[:upper:]'  '[:lower:]'|sed 's/\:/-'/g
fi

if [ $DISTRO_TYPE == "centos" ] && [ $DISTRO_VERSION == 7 ] ;
then
     /sbin/ifconfig eth0|grep ether| awk '{print $2}'|tr '[:upper:]'  '[:lower:]'|sed 's/\:/-'/g
fi

}
