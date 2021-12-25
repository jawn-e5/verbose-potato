#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"
echo "  - input: Choose A org"
echo "    key: 'orgcheck'"
echo "    fields:"
echo "      - select: 'org'"
echo "        key: org"
echo "        options:"
echo "        - label: wee"
echo "          value: wee"
echo "  - wait"
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

echo "  - wait"
echo "  - command: .buildkite/script.sh"
