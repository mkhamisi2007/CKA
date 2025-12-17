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
