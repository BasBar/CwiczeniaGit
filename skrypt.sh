#!/bin/bash

if [ "$1" == --date ]; then
	date
fi

if [ "$1" == "--logs" ]; then
	if [ -z "$2" ]; then
		files=100
	else
		files=$2
	fi

	for ((i=1; i<=$files; i++)); do
		filename="log$i.txt"
		echo "filename: $filename created by: $0 date: $(date)" > $filename
	done
else
	echo "Invalid argument. Usage $0 [--logs [files]]"
fi

if [ "$1" == --help ]; then
	echo ""
	echo "You can use flags:"
	echo ""
	echo "--date to display current date"
	echo ""
	echo "--logs xxx where xxx is a number to create xxx number of "
	echo "log files with names, creation dates, and script name"
	echo ""
	echo "--help to see this message screen"
	exit 0
fi
