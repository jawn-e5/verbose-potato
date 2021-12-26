#!/bin/bash

RC=$(buildkite-agent meta-data get repocheck)

echo ${RC}
