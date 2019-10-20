#!/usr/bin/env bash
echo -e "请输入服务器的主IP地址（公网）"
		stty erase '^H' && read -p "(such as 8.8.8.8):" main_ip
		[[ -z "${main_ip}" ]] && echo -e "cancel..." && exit 1
echo -e "请输入需要使用多少个/24  IP地址, 最大：5。"
		stty erase '^H' && read -p "(such as 1):" user_ip_num
		[[ -z "${user_ip_num}" ]] && echo -e "cancel..." && exit 1
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to ${main_ip}
user_ip_head="10.0."
for (( c = 1; c <= ${user_ip_num}; c++ ));do
	for (( d = 1; d <= 255; d++ ));do
		user_ip=${user_ip_head}${c}"."${d}
		if (("$d" < 10)); then
			ssh_port="6"${c}"00"${d}
			user_port_first="100"${d}"0"
			user_port_last="100"${d}"9"
		elif (("$d" < 100)); then
			ssh_port="6"${c}"0"${d}
			user_port_first="10"${d}"0"
			user_port_last="10"${d}"9"
		else
			ssh_port="6"${c}${d}
			user_port_first="1"${d}"0"
			user_port_last="1"${d}"9"
		fi
		iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport ${ssh_port} -j DNAT --to-destination ${user_ip}:22
		iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport ${user_port_first}:${user_port_last} -j DNAT --to-destination ${user_ip}
		iptables -t nat -A PREROUTING -i eth1 -p udp -m udp --dport ${user_port_first}:${user_port_last} -j DNAT --to-destination ${user_ip}	
	done
done
service iptables save
service iptables restart
echo -e "吖？好像已经好了耶！"

