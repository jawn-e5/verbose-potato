#!/bin/bash

RC=$(buildkite-agent meta-data get repocheck)


for i in $RC; do
	echo "Repo: ${i}"
done
