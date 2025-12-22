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




