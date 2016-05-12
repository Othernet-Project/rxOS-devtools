#!/bin/bash

set -e

DEDUPE_SCRIPT="$BR2_EXTERNAL/scripts/dedupe.py"
DELETE_LIST="$BR2_EXTERNAL/configs/delete_list.txt"
ROOTFS_TARBALL="$BINARIES_DIR/rootfs.tar"
OUTPUT="$BINARIES_DIR/rootfs.squahsfs"
UNPACK_DIR="/tmp/overlay-$(date +%s)"

mkdir -p "$UNPACK_DIR"
tar -xvf "$ROOTFS_TARBALL" -C "$UNPACK_DIR"
$DEDUPE_SCRIPT "$UNPACK_DIR" --delete "$DELETE_LIST"
mksquashfs "$UNPACK_DIR" "$OUTPUT" -all-root -comp lz4 -Xhc
rm -rf "$UNPACK_DIR"
