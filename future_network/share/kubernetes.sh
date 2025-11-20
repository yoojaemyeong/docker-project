# 1. 필요 도구 설치
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# 2. GPG 키 다운로드 및 키링에 저장
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg \
  https://packages.cloud.google.com/apt/doc/apt-key.gpg

# 3. APT 저장소 등록 (signed-by 방식 사용)
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] \
https://apt.kubernetes.io/ kubernetes-xenial main" | \
sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

# 4. 패키지 정보 갱신
sudo apt-get update

