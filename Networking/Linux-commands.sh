--------------------------------------General----------------------------------
# نمایش اینترفیس‌های شبکه
ip link

# نمایش IP آدرس‌ها
ip addr

# تنظیم IP روی eth0 (موقتی)
ip addr add 192.168.1.10/24 dev eth0

# نمایش جدول روتینگ
ip route

# (دستور قدیمی – اختیاری)
route

# اضافه کردن مسیر به یک شبکه از طریق Gateway
ip route add 192.168.1.0/24 via 192.168.2.1

# بررسی فعال بودن IP Forwarding
cat /proc/sys/net/ipv4/ip_forward
---------------------------------------DNS-----------------------------------
# local DNS (first priority)
echo "192.168.1.115 db" >> /etc/hosts

# Set DNS Server (second priority)
echo "nameserver 192.168.1.120" >> /etc/resolv.conf  #---> local DNS server
echo "nameserver 8.8.8.8" >> /etc/resolv.conf  #---> internet DNS server

# we can change priority in /etc/nsswitch.conf
1) hosts:  files dns 
2) hosts:  dns files 

# search in /etc/resolv.conf
echo "search dev.example.com example.com" >> /etc/resolv.conf
ping api #---> ping api.dev.example.com , ping api.example.com

# opthion in /etc/resolv.conf
options edns0 trust-ad
# edns0 ===> Use modern DNS
# trust-ad ===> trust the response if it is verified by DNSSEC

# give more information 
nslookup www.google.com
    Server:         127.0.0.53
    Address:        127.0.0.53#53
    
    Non-authoritative answer:
    Name:   www.google.com
    Address: 142.250.179.100
    Name:   www.google.com
    Address: 2a00:1450:4007:818::2004
dig www.google.com
    ; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> www.google.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44812
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
    
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 65494
    ;; QUESTION SECTION:
    ;www.google.com.                        IN      A
    
    ;; ANSWER SECTION:
    www.google.com.         213     IN      A       142.250.179.100
    
    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
    ;; WHEN: Mon Dec 22 07:11:45 CET 2025
    ;; MSG SIZE  rcvd: 59

---------------------------------CoreDNS------------------------------------------------------------
curl -LO https://github.com/coredns/coredns/releases/download/v1.12.4/coredns_1.12.4_linux_amd64.tgz
$ tar -zxf coredns_1.12.4_linux_amd64.tgz 
---------------------------------CoreDNS in Kubernetes----------------------------------------------
kubectl describe configmap coredns -n kube-system

# Service name: backend
# Namespace: default
# backend.default.svc.cluster.local
curl backend #---> in pod we just call service name




