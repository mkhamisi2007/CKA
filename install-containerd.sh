sudo apt update && sudo apt upgrade -y
sudo apt install -y containerd
sudo systemctl enable containerd
sudo systemctl start containerd
sudo systemctl status containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
=> SystemdCgroup = true
sudo systemctl restart containerd
-----
sudo ctr version
sudo ctr plugins ls

