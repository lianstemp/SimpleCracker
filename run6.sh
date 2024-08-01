#!/bin/sh
rm /tmp/firecracker.sock
firecracker --api-sock /tmp/firecracker.sock
