#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"
echo "  - input: Choose A Repository"
echo "    key: 'check'"
echo "    fields:"
echo "      - select: 'Repository'"
echo "        key: \"repocheck\""
echo "        options:"

# add a new command step to run the tests in each test directory
repos=$(curl -s -u $GH_USER:$GH_TOKEN https://api.github.com/orgs/highvolteej/repos | jq '.[].name')

for repo in $repos; do
  repo=$( echo $repo | sed 's/\"//g')
  echo "        - label: ${repo}"
  echo "          value: ${repo}"
done

#repocheck=$(buildkite-agent meta-data get "repocheck")
#echo "  - wait"
#echo "  - command: \"echo "${repocheck}"\""
#echo "    depends_on: check"
