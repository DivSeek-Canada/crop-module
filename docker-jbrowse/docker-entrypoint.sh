#!/bin/bash
echo "Running the 'docker-jbrowse/docker-entrypoint.sh' script"
export JBROWSE_SAMPLE_DATA=/jbrowse/sample_data/
export JBROWSE_DATA=/jbrowse/data/
export JBROWSE=/jbrowse/
export DATA_DIR=/data/
if [ -d "/data/" ];
then
    for f in /data/*.sh;
    do
        [ -f "$f" ] && . "$f"
    done
fi

mkdir -p $JBROWSE_DATA/json/

echo "Running the NGINX web browser now..."
exec nginx -g "daemon off;"
