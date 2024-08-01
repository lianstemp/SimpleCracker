#!/bin/sh
curl --unix-socket /tmp/firecracker.sock -i  \
    -X PUT "http://localhost/machine-config" \
    -H "Accept: application/json"            \
    -H "Content-Type: application/json"      \
    -d "{
        \"vcpu_count\": 2,
        \"mem_size_mib\": 256,
	\"ht_enabled\": false
    }"
