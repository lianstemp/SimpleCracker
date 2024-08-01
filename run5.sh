#!/bin/sh
#curl --unix-socket /tmp/firecracker.sock -i \
#    -X PUT 'http://localhost/actions'       \
#    -H  'Accept: application/json'          \
#    -H  'Content-Type: application/json'    \
#    -d '{
#        "action_type": "InstanceHalt"
#     }'
ps aux | grep -ie firecracker | awk '{print $2}' | xargs kill -9
