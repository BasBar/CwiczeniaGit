#!/bin/bash

if [ "$1" == --date ] || [ "$1" == -d ]; then
	date
fi

if [ "$1" == "--logs" ] || [ "$1" == -l ]; then
	if [ -z "$2" ]; then
		files=100
	else
		files=$2
	fi

	for ((i=1; i<=$files; i++)); do
		filename="log$i.txt"
		echo "filename: $filename created by: $0 date: $(date)" > $filename
	done
fi

if [ "$1" == "--error" ] || [ "$1" == -e ]; then
	if [ -z "$2" ]; then
		dirname="error100"
		files=100
	else 
		dirname="error$2"
		files=$2
	fi

	mkdir -p "$dirname"
	cd "$dirname"
	
	for ((i=1; i<=$files; i++)); do
		filename="error$i.txt"
		echo "filename: $filename created by: $0 date: $(date)" > $filename
	done
fi

if [ "$1" == --help ] || [ "$1" == -h ]; then
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

if [ "$1" == "--init" ]; then
	git clone https://github.com/BasBar/CwiczeniaGit.git .

	export PATH="$PATH:$(pwd)/CwiczeniaGit"
	echo "Repository cloned to $(pwd)/repository and added to PATH."
	exit 0
fi
