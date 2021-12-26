#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"
echo "  - input: Choose Source Organization"
echo "    key: 'srccheck'"
echo "    fields:"
echo "      - select: 'org'"
echo "        key: srcorg"
echo "        options:"
echo "        - label: highvolteej"
echo "          value: highvolteej"
echo "        - label: auerbecklabs"
echo "          value: auerbecklabs"
echo "  - wait"
echo "  - input: Choose Destination Organization"
echo "    key: 'destcheck'"
echo "    fields:"
echo "      - select: 'org'"
echo "        key: destorg"
echo "        options:"
echo "        - label: highvolteej"
echo "          value: highvolteej"
echo "        - label: auerbecklabs"
echo "          value: auerbecklabs"
echo "  - wait"
echo "  - command: .buildkite/list-repos.sh | buildkite-agent pipeline upload"
