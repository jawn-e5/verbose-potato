#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

SRC=$(buildkite-agent meta-data get srcorg)
DEST=$(buildkite-agent meta-data get destorg)

#if [ $SRC == $DEST ]; then
#	echo "steps:"
#	echo "  - command: \"echo 'Source and Destination Organization Are Equal. Exiting.\""
#	echo "Source and Destination Organization Are Equal. Exiting."
#	exit 1
#fi

# begin
echo "steps:"
echo "  - input: Choose A Repository"
echo "    key: 'check'"
echo "    fields:"
echo "      - select: 'Repository'"
echo "        key: \"repocheck\""
echo "        options:"

# add a new command step to run the tests in each test directory
REPOS=$(curl -s -u $GH_USER:$GH_TOKEN https://api.github.com/orgs/${SRC}/repos | jq '.[].name')

for repo in $REPOS; do
  repo=$( echo $repo | sed 's/\"//g')
  echo "        - label: ${repo}"
  echo "          value: ${repo}"
done

echo "  - wait"
#echo "  - command: .buildkite/script.sh"


RC=$(buildkite-agent meta-data get repocheck)

echo "  - command: \"echo "${RC}"\"" 
