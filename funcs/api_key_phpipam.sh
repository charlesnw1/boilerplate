function api_key_phpiahm()
{
#Description: obtain api key from phpipam for future operations
#Arguments: none
#Outputs: api key

    curl \
                --silent \
                -X POST \
                --user $UN:$PW \
                -H "Content-Type: application/xml" \
              $PHPIPAM_BASE_URL/user/ > /tmp/phpipam/$CURR_EX_VAR-token.xml

    export API_TOKEN=$(while read_dom; do
        if [[ $ENTITY = "token" ]]; then
            echo $CONTENT
        fi
    done < /tmp/phpipam/$CURR_EX_VAR-token.xml)
    rm -f /tmp/phpipam/$CURR_EX_VAR-token.xml
}

