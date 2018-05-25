## Supported tags

* `bleeding`, daily bleeding edge version of Horizon Remote Poller 23 using OpenJDK latest
* `22.0.0-1`, `latest` is a reference to last stable release of Horizon Remote Poller using OpenJDK latest

## General Project Information

* CI/CD Status: [![CircleCI](https://circleci.com/gh/opennms-forge/docker-remote-poller.svg?style=svg)](https://circleci.com/gh/opennms-forge/docker-remote-poller)
* Container Image Info: [![](https://images.microbadger.com/badges/version/opennms/minion.svg)](https://microbadger.com/images/opennms/minion "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/opennms/minion.svg)](https://microbadger.com/images/opennms/minion "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/opennms/remote-poller.svg)](https://microbadger.com/images/opennms/remote-poller "Get your own license badge on microbadger.com")
* CI/CD System: [CircleCI]
* Docker Container Image Repository: [DockerHub]
* Issue- and Bug-Tracking: [GitHub issue]
* Source code: [GitHub]
* Chat: [IRC] or [Web Chat]
* Maintainer: ronny@opennms.org

## Remote Poller Docker files

This repository provides OpenNMS Remote Poller as docker images.

It is recommended to use `docker-compose` to build a service stack.

## Requirements

* docker 17.03+
* docker-compose 1.8.0+
* git
* optional on MacOSX, Docker environment, e.g. Kitematic, boot2docker or similar
* Installed `opennms-webapp-remoting` package which is not installed by default

## Usage

Create a user in the web application with `ROLE_REMOTING` and change the variables for `myLocation`, `myRemotingUser`, `myRemotingPass` accordingly.

Native Docker command

```
docker run --rm -e REMOTE_POLLER_URI=http://my-opennms:8980/opennms-remoting \
                -e REMOTE_POLLER_LOCATION=mylocation \
                -e REMOTE_POLLER_USERNAME=myRemotingUser \
                -e REMOTE_POLLER_PASSWORD=myRemotingPass \
                opennms/remote-poller:latest

```

With Docker compose

```
git clone https://github.com/opennms-forge/docker-remote-poller.git
cd docker-remote-poller
docker-compose up -d
```
