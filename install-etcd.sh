wget https://github.com/etcd-io/etcd/releases/download/v3.5.15/etcd-v3.5.15-linux-amd64.tar.gz
tar xvf etcd-v3.5.15-linux-amd64.tar.gz
sudo mv etcd-v3.5.15-linux-amd64/etcd* /usr/local/bin/
etcd --version
etcd --data-dir /var/lib/etcd-restored
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
