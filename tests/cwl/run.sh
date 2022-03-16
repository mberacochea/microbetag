#!/bin/bash

# We need the script "collapse_table.py" to be in the PATH
export PATH="tools/faprotax/:${PATH}"

cwltest --test tools-tests.yml "$@"
