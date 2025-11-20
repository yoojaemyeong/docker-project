#!/usr/bin/bash
# set 옵션: -e (error), -u (undefined variable) -o pipefail 발생시 즉시 종료
set -euo pipefail
# 필요시: dos2unix 설치
# sudo dnf -y install dos2unix

# 데이터 디렉토리 생성
if [[ ! -d /home/vagrant/data ]]; then
  mkdir -p /home/vagrant/data
fi

# Fedora에서 Docker CE 설치
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker 서비스 활성화
sudo systemctl enable --now docker

# vagrant 사용자를 docker 그룹에 추가 (다음 로그인부터 반영)
sudo usermod -aG docker vagrant
sudo setfacl -m user:vagrant:rw /var/run/docker.sock

