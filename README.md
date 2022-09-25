# Xraspios

Extended Raspberry Pi OS Lite Image based on Raspios and packaged with Packer.

This operating system is installed on my Raspberry Pi 4 and serve as a home lab
server. It mainly run IaaS and APIs with Docker.

## Features

- [ ] Docker
  - [ ] Portainer
- [ ] Git
- [ ] Tmux
- [ ] Vim
- [ ] Security
  - [ ] SSH
    - [x] User / Password
    - [ ] Key

## Requirements

- [Packer](https://www.packer.io) (1.8.x)

## Build Image

> The image is built from the [Raspios Lite Armhf 2022-09-07](https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2022-09-07/)

See `builder.pkr.hcl`

Initialize the project, update dependencies 

```bash
packer init config.pkr.hcl
```

Build the image

```bash
sudo packer build build.pkr.hcl
```

Once the build is finished, the image will be available in thes `build` folder
as `xraspios-lite.img`

### Docker

Build with the official Packer Docker [image](https://hub.docker.com/r/hashicorp/packer)

> Not tested !

Initialize

```bash
docker run \
    -v `pwd`:/workspace -w /workspace \
    -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins \
    hashicorp/packer:latest \
    init .
```

Build

```bash
docker run \
    -v `pwd`:/workspace -w /workspace \
    -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins \
    hashicorp/packer:latest \
    build .
```

## Write Image

Write the image to and SD card

### Raspberry Pi Imager

Use Raspberry Pi Imager to configure WiFi, users and more and write to image to
the card.

> Check how rpi-imager write config 

<https://github.com/raspberrypi/rpi-imager/blob/ce0b02b823a40ada3cd4a12a257da9506e46dda1/src/OptionsPopup.qml#L589>

### DD

> When rpi-imager no more needed to configure the wifi and user. TODO: Keys and no user?!

```bash
sudo dd bs=4M if=/dev/zero of=/dev/sdb oflag=sync
```

```bash
sudo dd bs=4M if=/path/to/image of=/dev/sdb oflag=sync
```

## References

- <https://www.packer.io>
- <https://www.packer.io/docs/builders/community-supported>
- <https://github.com/solo-io/packer-plugin-arm-image>
- <https://github.com/marketplace/actions/packer-github-actions>
- <https://downloads.raspberrypi.org>
