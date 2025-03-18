#!/bin/bash

echo "# HELP node_disk_type 1=SSD, 0=HDD"
echo "# TYPE node_disk_type gauge"

for disk in /sys/block/*/queue/rotational; do
    dev=$(basename $(dirname $(dirname $disk)))  # Extract device name (e.g., sda)
    type=$(cat $disk)  # Read 0 (SSD) or 1 (HDD)
    echo "node_disk_type{device=\"$dev\"} $type"
done
