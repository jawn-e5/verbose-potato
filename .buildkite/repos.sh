#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
#set -eu

SRC=$(buildkite-agent meta-data get srcorg)
DEST=$(buildkiate-agent meta-data get destorg)

# begin
echo "steps:"
#echo "  - input: Choose A Repository"
#echo "    key: 'check'"
#echo "    fields:"
#echo "      - select: 'Repository'"
#echo "        key: \"repocheck\""
#echo "        options:"

# add a new command step to run the tests in each test directory
#repos=$(curl -s -u $GH_USER:$GH_TOKEN https://api.github.com/orgs/highvolteej/repos | jq '.[].name')

#for repo in $repos; do
#  repo=$( echo $repo | sed 's/\"//g')
#  echo "        - label: ${repo}"
#  echo "          value: ${repo}"
#done

#echo "  - wait"
#echo "  - command: .buildkite/script.sh"
echo "  - command: \"echo "${SRC}"\"" 
