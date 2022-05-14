# Container Images for Tekton Tutorial

[https://upstreamwithoutapaddle.com/tutorials/tekton-intro/](https://upstreamwithoutapaddle.com/tutorials/tekton-intro/)

## Build Demo Images

export REGISTRY=quay.io/cgruver0
podman login ${REGISTRY}

### Gitea Image for demos in CRC

```bash
podman build -t ${REGISTRY}/gitea-demo:latest -f gitea.Dockerfile .
podman push ${REGISTRY}/gitea-demo:latest
```

### Gitea Tekton Interceptor Image

```bash
export KO_DOCKER_REPO=${REGISTRY}
podman login quay.io
cp ~/.config/containers/auth.json ~/.docker/config.json
git clone https://github.com/cgruver/gitea-interceptor.git
cd gitea-interceptor
ko resolve --platform=linux/amd64 --base-import-paths -t latest -f ./config > /tmp/gitea-interceptor.yaml
```

### Java Quarkus & Spring Boot Application Builder

```bash
podman build -t ${REGISTRY}/java-11-app-runner:latest -f java-11-app-runner.Dockerfile .
podman push ${REGISTRY}/java-11-app-runner:latest
```

### Java Application Runner

```bash
podman build -t ${REGISTRY}/java-11-builder:latest -f java-11-builder.Dockerfile .
podman push ${REGISTRY}/java-11-builder:latest
```
