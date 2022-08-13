#!/bin/bash

if ! command -v bazelisk &> /dev/null
then
  if ! command -v brew &> /dev/null
  then
    echo "Missing Homebrew -- please visit: https://brew.sh"
    exit
  fi

    echo "bazelisk could not be found -- installing..."
    brew install bazelisk
fi
