#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

# Tells CWL that we will be running this command in a container. We
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

