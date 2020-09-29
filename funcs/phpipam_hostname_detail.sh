function phpipam_hostname_detail()
{
#Description: lookup network details from a hostname
#Arguments: hostname
#output: IP address, netmask, gw

    #Lookup TS hostname/IP in phpipam
    IP_XML=$(curl \
                --silent \
                -X GET \
                --user $UN:$PW \
                -H "Content-Type: application/xml" \
                -H "token:${API_TOKEN}" \
              $PHPIPAM_BASE_URL/api/$APP_ID/addresses/search_hostname/$1/ > /tmp/phpipam/$CURR_EX_VAR-ip.xml
    )

    PC_IP=$(while read_dom; do
        if [[ $ENTITY = "ip" ]]; then
            echo $CONTENT
        fi
    done < /tmp/phpipam/$CURR_EX_VAR-ip.xml)

    SUBNET_ID=$(while read_dom; do
        if [[ $ENTITY = "subnetId" ]]; then
            echo $CONTENT
        fi
    done < /tmp/phpipam/$CURR_EX_VAR-ip.xml)


   #Use subnet id to determine netmask and gateway
curl \
    --silent \
    -X GET \
    --user $UN:$PW \
    -H "Content-Type: application/xml" \
    -H "token:${API_TOKEN}" \
    $PHPIPAM_BASE_URL/api/$APP_ID/subnets/$SUBNET_ID/ > /tmp/phpipam/$CURR_EX_VAR-subnet.xml

    export PC_NETMASK=$(while read_dom; do
        if [[ $ENTITY = "Subnet_netmask" ]]; then
            echo $CONTENT
        fi
    done < /tmp/phpipam/$CURR_EX_VAR-subnet.xml)

    export PC_GATEWAY=$(while read_dom; do
        if [[ $ENTITY = "ip_addr" ]]; then
            echo $CONTENT
        fi
    done < /tmp/phpipam/$CURR_EX_VAR-subnet.xml)

}

