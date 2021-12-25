#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "\
steps:
  - input: Choose A Repository
    fields:
      - text: Repository
        key: repo
	multiple: true
	options:	
"

# add a new command step to run the tests in each test directory
repos=$(curl -s -u $GH_USER:$GH_TOKEN https://api.github.com/orgs/highvolteej/repos | jq '.[].name')

for repo in $repos; do
  repo=$( echo $repo | sed 's/\"//g')
  echo "          - label: ${repo}"
  echo "          - key: ${repo}"
done
