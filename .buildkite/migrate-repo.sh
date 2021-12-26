#!/bin/bash

RC=$(buildkite-agent meta-data get repocheck)
SRC=$(buildkite-agent meta-data get srcorg)
DEST=$(buildkite-agent meta-data get destorg)



for i in $RC; do
	curl -s -u $GH_USER:$GH_TOKEN -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${SRC}/${i}/transfer -d "{\"new_owner\":\"${DEST}\"}"		
done
