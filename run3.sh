#!/bin/sh
curl -fsS --unix-socket /tmp/firecracker.sock -i \
    -X PUT "http://localhost/logger" \
    -H  "accept: application/json" \
    -H  "Content-Type: application/json" \
    -d '{
           "log_fifo": "/dev/null",
           "metrics_fifo": "/dev/null",
           "level": "Error",
           "show_level": true,
           "show_log_origin": false
    }'
