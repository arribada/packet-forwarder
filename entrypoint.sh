#!/bin/sh

if [ -n "$CONCENTRATOR_CONFIG" ] ; then
    echo "Replacing the default global conf with a user defined config from the CONCENTRATOR_CONFIG env"
    echo  "$CONCENTRATOR_CONFIG" > ./global_conf.json
fi

echo "Starting the CONCENTRATOR by reseting pin $CONCENTRATOR_RESET_PIN" 
./reset_lgw.sh start $CONCENTRATOR_RESET_PIN

if [ -n "$GW_ID" ] ; then
    if [ ${#GW_ID} -e 16 ] ; then
        echo "GW_ID variable present but it is not 16 chars long so not using it."
    else
        echo "Replacing the gateway id from the GW_ID env var: $GW_ID"
        sed -i 's/"gateway_ID".*/"gateway_ID": "'$GW_ID'",/g' global_conf.json
    fi
fi

sleep 3 # Give some time to the CONCENTRATOR to start.

exec "$@"