# Ссылки
- [Jetbrains Clion local](https://www.jetbrains.com/help/clion/clion-toolchains-in-docker.html)
- [VS Code local](https://code.visualstudio.com/docs/devcontainers/containers)
- [Jetbrains Clion remote](https://www.jetbrains.com/help/clion/clion-toolchains-in-docker.html#sample-dockerfile-remote)
- [VS Code remote](https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host)

# Команды из примера
```bash
docker build --network host --force-rm -t remote_dev_image_base . -f docker/remote_dev_base.Dockerfile
docker build --network host --force-rm -t remote_dev_image . -f docker/remote_dev.Dockerfile
docker save remote_dev_image:latest | gzip > ./remote_dev_image.tar.gz
scp remote_dev_image.tar.gz <user>@<ip_address>:/home/admin
```
```bash 
ssh <user>@<ip_address>
docker load --input remote_dev_image.tar.gz
docker run -itd -e "TZ=$(cat /etc/timezone)" --cap-add=NET_RAW --cap-add sys_ptrace --network host --name remote_dev remote_dev_image:latest
```
