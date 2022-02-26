#!/bin/bash
set -e

for file in Dockerfile-*; do
	echo "==============================="
	echo "====== Building ${file}"
	echo "==============================="
	echo ""
	docker build - < ${file}
done
