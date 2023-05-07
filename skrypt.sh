#!/bin/bash

if [ "$1" == --date ]; then
	date
fi

if [ "$1" == --logs ]; then

	for ((i=1; i<=100; i++)); do
		filename="log$i.txt"
		echo "filename: $filename created by: $0 date: $(date)" > $filename
	done
fi
