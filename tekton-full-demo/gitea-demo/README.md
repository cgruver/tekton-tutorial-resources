# Gitea Image for demos in CRC

```bash
podman login quay.io
podman build -t quay.io/cgruver0/gitea-demo:latest -f gitea.Dockerfile .
podman push quay.io/cgruver0/gitea-demo:latest 
```
