# centos-mirror-docker

## Downloading & updating

1. Setup your CentOS version and releases in run.sh

2. Start the centos_mirror container:

    ```bash
    docker-compose build
    docker-compose up centos_mirror
    ```
## Serving

1. Start the centos_websrv container:

    ```bash
    docker-compose up -d centos_websrv
    ```

    Server will run on http://localhost:8080

## Troubleshooting
1. Check your mirroring succeeded by running:
    ```bash
    du -sh /mnt/centos_mirror
    ```

## Client configuration

To point your CentOS clients to your mirror, create a `/etc/yum.repos.d/localmirror.repo` file as follow :

```conf
[localmirror-base]
name=My CentOS 7 local mirror for os packages
baseurl=http://localhost:8080/base/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[localmirror-extras]
name=My CentOS 7 local mirror for extras packages
baseurl=http://localhost:8080/extras/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[localmirror-updates]
name=My CentOS 7 local mirror for updates packages
baseurl=http://localhost:8080/updates/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[localmirror-centosplus]
name=My CentOS 7 local mirror for centosplus packages
baseurl=http://localhost:8080/centosplus/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1
```

**Forked from https://github.com/flavienbwk/centos-mirror-docker**
