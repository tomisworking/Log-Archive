#!/bin/bash

if [ -z "$1" ]; then
     echo "Specify directory"
     exit 1
fi


if [ ! -d "$1" ]; then
	echo "Specified directory doesn't exist"
	exit 1
fi


ARCHIVE_DIR="$HOME/archive"

if [ ! -d "$ARCHIVE_DIR" ]; then
	mkdir -p "$ARCHIVE_DIR"
fi


TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

sudo tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$1" .

echo "Saved file $ARCHIVE_NAME to $ARCHIVE_DIR"


