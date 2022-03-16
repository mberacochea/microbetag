# CWL testing with cwltest

CWL unit test example.

## Setup

To run this you need [cwltest](https://github.com/common-workflow-language/cwltest), [cwltool](https://github.com/common-workflow-language/cwltool), [cwl-runner](https://pypi.org/project/cwl_runner/) and docker.

```
$ cd tests/cwl
$ pip install -r requirements.txt
```

### Build the container for faprotax

At this stage it's named "faprotax:testing".

```
$ cd tools/faprotax
$ docker build -t faprotax:testing .
```

# Run the tests

```
$ cd tests/cwl
$ ./run.sh
```