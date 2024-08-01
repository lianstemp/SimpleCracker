#!/bin/sh
curl --unix-socket /tmp/firecracker.sock -i \
    -X PUT 'http://localhost/boot-source'   \
    -H 'Accept: application/json'           \
    -H 'Content-Type: application/json'     \
    -d '{
        "kernel_image_path": "./hello-vmlinux.bin",
        "boot_args": "console=ttyS0 reboot=k panic=1 pci=off"
    }'
curl --unix-socket /tmp/firecracker.sock -i \
    -X PUT 'http://localhost/drives/rootfs' \
    -H 'Accept: application/json'           \
    -H 'Content-Type: application/json'     \
    -d '{
        "drive_id": "rootfs",
        "path_on_host": "./hello-rootfs.ext4",
        "is_root_device": true,
        "is_read_only": false
    }'
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
