#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool


# With Node.js, we can run shell commands and process their inputs and outputs using JavaScript
# Therefore, we can write most of these complex operations in JavaScript instead of the shell scripting language, potentially making the program easier to maintain.
baseCommand: node

inputs:
  src:
    type: File
    inputBinding:
      position: 1

outputs:
  example_out:
    type: stdout

stdout: output.txt

