#!/bin/sh

if cat /run/secrets/url | grep "Not yet set." &> /dev/null
then
    echo "Credentials not yet set. Waiting until they are set."
    # It'll automatically reboot when the credentials are added.
    sleep 1000d
fi

/bin/nextcloud-exporter --url $(cat /run/secrets/url) --username $(cat /run/secrets/username) --password $(cat /run/secrets/password)
