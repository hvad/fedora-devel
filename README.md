# Container image fedora-devel

## How to build :
`podman build -t fedora-devel .`

## How to run :
`podman run --rm --privileged=true -v ~/.ssh/id_rsa:/home/dev/.ssh/id_rsa -v ~/.ssh/id_rsa.pub:/home/dev/.ssh/id_rsa.pub -v ~/tmp:/var/tmp -it fedora-devel /bin/bash`

## Kerberos authentication via keytab file :

### Create a keytab file :
```
$ mkdir -p ~/.keytab
$ ktutil 
ktutil:  addent -password -p <fas-username>@FEDORAPROJECT.ORG -k 1 -e des-cbc-md5
Password for <fas-username>@FEDORAPROJECT.ORG: 
ktutil:  wkt <fas-username>.keytab
ktutil:  quit
$ mv <fas-username>.keytab ~/.keytab
```

### Check that the Kerberos authentication works :
`$ kinit <fas-username>@FEDORAPROJECT.ORG -k -t ~/.keytab/<fas-username>.key`
