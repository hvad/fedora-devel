# Container fedora-devel

## How to build :
`$ podman build -t fedora-devel .`

## How to run :
`$ podman run --rm --privileged=true -v ~/tmp:/var/tmp -it fedora-devel /bin/bash`
