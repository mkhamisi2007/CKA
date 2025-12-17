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
---------------------------------see cerificate informations --------------------------------
openssl x509 -in /etc/kubernetes/pki/ca.crt -text -noout
    Certificate:
        Data:
            Version: 3 (0x2)
            Serial Number: 4698003399550140403 (0x4132a93367c37ff3)
            Signature Algorithm: sha256WithRSAEncryption
            Issuer: CN = kubernetes
            Validity
                Not Before: Nov 28 06:26:58 2025 GMT
                Not After : Nov 26 06:31:58 2035 GMT
            Subject: CN = kubernetes
            Subject Public Key Info:
                Public Key Algorithm: rsaEncryption
                    Public-Key: (2048 bit)
                    Modulus:
                        00:ca:4b:0f:df:7a:68:ce:21:b7:ba:9d:dd:e0:06:
                        22:ce:57:83:0b:23:81:9e:2b:de:eb:5f:07:e9:a6:
                        62:e5:70:13:e8:39:24:be:2c:b4:aa:f4:c4:1d:eb:
                        40:52:36:49:0d:3f:7c:7b:28:e4:4f:8e:2e:43:3d:
                        02:b2:ec:2b:61:5b:9f:50:f9:3e:80:e0:b6:df:fb:
                        3a:86:28:e7:fb:a5:3a:38:88:28:2c:09:a4:7c:cb
