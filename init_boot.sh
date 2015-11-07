#!/bin/bash

log_file_name='ping_res.log'

cd $(dirname $0)

sleep 10

rm $log_file_name

for i in $(seq 60)
do
    ping -c1 8.8.8.8 > null
    echo -e "$(date)\t$?" >> $log_file_name
    if [ $? -eq 0 ]; then
        /usr/bin/thunderbird &
        /usr/share/slack/slack &
        break
    fi
    sleep 1
done
