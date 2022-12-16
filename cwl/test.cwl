cwlVersion: v1.2
class: CommandLineTool

baseCommand: echo

stdout: output.txt

inputs:
  datafile:
    type: File

steps:
  load_data:
    run: 
    class: Operation
    in:
        reads_file: datafile
    out: [data]
  describe_data:
    run:
    class: Operation
    in:
      ForwardReads: load_data/data
    out: [data_description]
outputs:
  out:
    type: string
    outputBinding:
      glob: output.txt
      loadContents: true
      outputEval: $(self[0].contents)
