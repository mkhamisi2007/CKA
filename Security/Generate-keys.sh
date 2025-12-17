------------------------ssh---------------------------
ssh-keygen
ls /root/.ssh/id* -l
-rw------- 1 root root 411 dc.  17 08:40 /root/.ssh/id_ed25519     #---> private key
-rw-r--r-- 1 root root  97 dc.  17 08:40 /root/.ssh/id_ed25519.pub #---> public key
----------------------TLS Certification---------------
openssl genrsa -out private.key 1024
openssl rsa -in private.key -pubout > public.pem
ls -l
-rw------- 1 root root 912 dc.  17 08:53 private.key #---> private key
-rw-r--r-- 1 root root 272 dc.  17 08:54 public.pem  #---> public key
------------------------kubernetes certification path ---------------------------
ls /etc/kubernetes/pki/ -l
    -rw-r--r-- 1 root root 1285 nov.  28 07:32 apiserver.crt
    -rw-r--r-- 1 root root 1123 nov.  28 07:32 apiserver-etcd-client.crt
    -rw------- 1 root root 1675 nov.  28 07:32 apiserver-etcd-client.key
    -rw------- 1 root root 1675 nov.  28 07:32 apiserver.key
    -rw-r--r-- 1 root root 1176 nov.  28 07:32 apiserver-kubelet-client.crt
    -rw------- 1 root root 1675 nov.  28 07:32 apiserver-kubelet-client.key
    -rw-r--r-- 1 root root 1107 nov.  28 07:32 ca.crt
    -rw------- 1 root root 1675 nov.  28 07:32 ca.key
    drwxr-xr-x 2 root root 4096 nov.  28 07:32 etcd
    -rw-r--r-- 1 root root 1123 nov.  28 07:32 front-proxy-ca.crt
    -rw------- 1 root root 1679 nov.  28 07:32 front-proxy-ca.key
    -rw-r--r-- 1 root root 1119 nov.  28 07:32 front-proxy-client.crt
    -rw------- 1 root root 1679 nov.  28 07:32 front-proxy-client.key
    -rw------- 1 root root 1675 nov.  28 07:32 sa.key
    -rw------- 1 root root  451 nov.  28 07:32 sa.pub
ls /etc/kubernetes/pki/etcd/ -l
    -rw-r--r-- 1 root root 1094 nov.  28 07:32 ca.crt
    -rw------- 1 root root 1679 nov.  28 07:32 ca.key
    -rw-r--r-- 1 root root 1123 nov.  28 07:32 healthcheck-client.crt
    -rw------- 1 root root 1675 nov.  28 07:32 healthcheck-client.key
    -rw-r--r-- 1 root root 1204 nov.  28 07:32 peer.crt
    -rw------- 1 root root 1679 nov.  28 07:32 peer.key
    -rw-r--r-- 1 root root 1204 nov.  28 07:32 server.crt
    -rw------- 1 root root 1675 nov.  28 07:32 server.key
