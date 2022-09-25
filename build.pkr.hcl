source "arm-image" "raspberry-pi-os-lite" {
  iso_checksum    = "sha256:28582f75128e426215e2cda8d6be04c57c0d190d5bf2d4bef62201340d5e60cf"
  iso_url         = "https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2022-09-07/2022-09-06-raspios-bullseye-armhf-lite.img.xz"
  output_filename = "./build/xraspios-lite.img"
}

build {
  name = "xraspios-lite"
  sources = [
    "source.arm-image.raspberry-pi-os-lite"
  ]
  /*
  // https://docs.docker.com/engine/install/binaries/
  // /usr/bin/cp: error writing '/usr/bin/dockerd': No space left on device
  // /usr/bin/cp: error writing '/usr/bin/runc': No space left on device
  provisioner "shell" {
    inline = [
      "apt-get update",
      "cd /tmp",
      "wget -c https://download.docker.com/linux/static/stable/armhf/docker-20.10.9.tgz -O - | sudo tar -xz",
      "sudo cp docker/* /usr/bin/"
    ]
  }
  */
  /*
  provisioner "shell" {
    inline = [
      "lsblk",
    ]
  }
  
  provisioner "shell" {
    inline = [
      "apt-get update -y",
      "sudo apt-get install ca-certificates curl gnupg lsb-release",
      "curl -sSL https://get.docker.com | sh",
      "sudo usermod -aG docker pi"
    ]
  }

  provisioner "shell" {
    inline = [
      "lsblk",
    ]
  }

  provisioner "shell" {
    scripts = [
      "./scripts/install.sh",
      # "./scripts/docker.sh",
      # "./scripts/git.sh",
      # "./scripts/tmux.sh",
      # "./scripts/vim.sh"
    ]
  }
  */
  
  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
}
 