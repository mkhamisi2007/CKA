sudo apt update && sudo apt upgrade -y
sudo apt install -y containerd
sudo systemctl enable containerd
sudo systemctl start containerd
sudo systemctl status containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
=> SystemdCgroup = true
sudo systemctl restart containerd
-----  ctr ---------------------
sudo ctr version
sudo ctr plugins ls
--
sudo ctr images ls
sudo ctr images pull docker.io/library/nginx:latest
sudo ctr images rm docker.io/library/nginx:latest
--
sudo ctr containers ls
sudo ctr tasks exec --tty --exec-id bash nginx-test /bin/bash
sudo ctr tasks kill nginx-test
sudo ctr containers rm nginx-test

------ nerdctl ------------
curl -LO https://github.com/containerd/nerdctl/releases/download/v2.2.0/nerdctl-2.2.0-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local nerdctl-2.2.0-linux-amd64.tar.gz
sudo systemctl restart containerd
sudo mv /usr/local/nerdctl /usr/local/bin/
--
sudo nerdctl run -d -p 80:80 nginx
sudo nerdctl ps
sudo nerdctl images

