#!/bin/bash

NAME=""

until [ ${#NAME} -gt 0 ]
do
  REPO=$(buildkite-agent meta-data get repocheck)
  SRC=$(buildkite-agent meta-data get srccheck)
  DEST=$(buildkite-agent meta-data get destcheck)

  echo "We are working with $REPO in $SRC and moving it to $DEST"
done

