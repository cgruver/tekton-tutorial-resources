# Gitea Image for demos in CRC

```bash
podman login quay.io
podman build -t quay.io/cgruver0/gitea-demo:latest -f gitea.Dockerfile .
podman push quay.io/cgruver0/gitea-demo:latest

git clone https://github.com/cgruver/gitea-interceptor.git
cd gitea-interceptor
export KO_DOCKER_REPO=quay.io/cgruver0
cp ~/.config/containers/auth.json ~/.docker/config.json
ko resolve --platform=linux/amd64 --base-import-paths -t latest -f ./config > /tmp/gitea-interceptor.yaml

```
