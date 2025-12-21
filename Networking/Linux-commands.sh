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
