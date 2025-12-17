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
            Serial Number: 4698003398550140503 (0x4132a93367c37ff3)
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
                        3a:86:28:e7:fb:a5:3a:38:88:28:2c:09:a4:7c:cb:
                        e1:1c:23:ed:a8:ff:b5:f9:3e:f2:1a:aa:37:c5:7e:
                        79:0c:6c:57:d1:4a:6b:e6:6b:43:a5:69:c9:94:7c:
                        ce:bc:e6:48:0e:b3:76:62:f6:69:f6:a7:bd:12:54:
                        76:e8:f1:93:39:b8:c6:e3:4e:a7:70:9c:b3:68:ec:
                        04:e1:11:75:a1:a7:91:eb:73:fd:1c:c1:5f:2c:28:
                        c0:b4:09:51:9d:31:1b:ab:80:ec:20:dc:09:ba:2e:
                        bd:d7:0a:0c:1d:dc:13:30:2e:29:73:d5:98:22:bf:
                        9a:10:f2:e6:c1:0d:d4:7e:d9:e0:5e:ee:02:f8:59:
                        8e:0e:fa:da:1a:4b:cd:19:04:eb:34:5e:ed:17:f5:
                        a9:0f:ee:af:a2:a1:34:bf:g2:f1:6c:90:e0:22:3f:
                        db:73:10:78:94:a1:62:3e:90:1c:26:11:50:18:9a:
                        da:9f
                    Exponent: 65537 (0x10001)
            X509v3 extensions:
                X509v3 Key Usage: critical
                    Digital Signature, Key Encipherment, Certificate Sign
                X509v3 Basic Constraints: critical
                    CA:TRUE
                X509v3 Subject Key Identifier:
                    A2:81:9C:87:C2:61:E1:06:B7:9C:D1:0A:44:CC:12:12:34:5A:92:32
                X509v3 Subject Alternative Name:
                    DNS:kubernetes
        Signature Algorithm: sha256WithRSAEncryption
        Signature Value:
            28:ad:ef:a1:5c:8f:d0:4b:45:3f:ad:68:7b:d7:28:0c:ca:99:
            5e:27:1d:fc:39:66:be:d4:1a:69:14:7b:d5:eb:5c:3c:3f:4b:
            e2:65:49:31:4a:4b:85:e4:55:e1:18:04:51:48:fe:1f:48:4c:
            a0:db:8d:7a:5b:4e:22:7e:63:b8:25:83:6e:5a:d0:59:4f:0f:
            ec:3e:3b:ef:4f:9d:05:57:11:44:0d:17:1e:66:9e:e1:9e:de:
            47:b7:6b:c0:8a:86:5a:43:65:9f:36:8b:d7:ea:fb:74:d0:e5:
            9a:d5:2e:c0:88:cd:48:7d:b8:34:51:b7:e7:26:03:60:0f:20:
            7e:36:20:6a:68:50:a3:52:c3:2c:29:rf:4d:55:36:96:cc:82:
            8e:ed:e6:0d:a1:56:b8:d3:21:02:80:81:c5:4e:85:d5:b8:ef:
            bd:09:ee:ad:57:a8:ed:76:82:30:8d:61:8f:65:11:b5:26:ff:
            08:e1:0a:e1:92:22:f4:30:89:e8:db:24:fa:0e:a0:84:f2:28:
            ca:fc:7c:b3:f5:2f:c3:d4:a3:32:0c:fr:4e:a8:d6:85:61:85:
            6d:ac:47:42:ef:f8:89:b6:e8:dd:3d:6d:9a:13:ed:c6:0b:c8:
            58:15:76:a3:8b:0b:86:ab:43:ae:5a:a4:cd:20:84:a7:60:54:
            1e:60:90:25
