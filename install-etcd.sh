wget https://github.com/etcd-io/etcd/releases/download/v3.5.15/etcd-v3.5.15-linux-amd64.tar.gz
tar xvf etcd-v3.5.15-linux-amd64.tar.gz
mv etcd-v3.5.15-linux-amd64/etcd* /usr/local/bin/
etcd --version
etcd --data-dir /var/lib/etcd-restored
-------- or SystemD ---------------------------------------------------
sudo mkdir -p /var/lib/etcd
sudo chown -R $(whoami):$(whoami) /var/lib/etcd
ip addr show eth0 | grep inet
=> inet 172.22.208.1/20 brd 172.22.223.255 scope global eth0
nano /etc/systemd/system/etcd.service
[Unit]
Description=etcd key-value store
Documentation=https://etcd.io/docs/
After=network.target

[Service]
Type=notify
ExecStart=/usr/local/bin/etcd \
  --name default \
  --data-dir /var/lib/etcd \
  --listen-client-urls http://127.0.0.1:2379,http://[::1]:2379,http://172.22.208.1:2379 \
  --advertise-client-urls http://172.22.208.1:2379 \
  --listen-peer-urls http://172.22.208.1:2380 \
  --initial-advertise-peer-urls http://172.22.208.1:2380 \
  --initial-cluster default=http://172.22.208.1:2380 \
  --initial-cluster-state new \
  --logger=zap

Restart=on-failure
RestartSec=5
LimitNOFILE=40000

[Install]
WantedBy=multi-user.target
--
sudo systemctl daemon-reload
sudo systemctl enable etcd
sudo systemctl start etcd
sudo systemctl status etcd

--
etcdctl endpoint status --write-out=table
+----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
|    ENDPOINT    |        ID        | VERSION | DB SIZE | IS LEADER | IS LEARNER | RAFT TERM | RAFT INDEX | RAFT APPLIED INDEX | ERRORS |
+----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
| 127.0.0.1:2379 | 8e9e05c52174694d |  3.5.15 |   20 kB |      true |      false |         3 |          6 |                  6 |        |
+----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
etcdctl member list --write-out=table
+------------------+---------+---------+-----------------------+-----------------------+------------+
|        ID        | STATUS  |  NAME   |      PEER ADDRS       |     CLIENT ADDRS      | IS LEARNER |
+------------------+---------+---------+-----------------------+-----------------------+------------+
| 8e9e05c52174694d | started | default | http://localhost:2380 | http://localhost:2379 |      false |
+------------------+---------+---------+-----------------------+-----------------------+------------+
----------------------
export ETCDCTL_API=3
etcdctl put mykey "Hello etcd"
etcdctl get mykey
etcdctl del mykey
etcdctl get "" --prefix --keys-only
etcdctl get user --prefix
----
etcdctl snapshot save backup.db
etcdutl snapshot status backup.db
sudo pkill etcd 2>/dev/null || true
etcdutl snapshot restore backup.db --data-dir /var/lib/etcd-restored
-------------------- connect to exist etcd pod in our cluster ---------------------------
kubectl exec -it -n kube-system etcd-k8n-master -- sh
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/peer.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/peer.key
etcdctl get / --prefix --keys-only
etcdctl get /registry/secrets/default/my-secret
