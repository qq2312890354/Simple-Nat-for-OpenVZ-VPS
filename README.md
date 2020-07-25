--addnat.sh is a simple shell script for setting up NAT VPS on the servers.(On KVM virtualization or dedicated servers).
--addnat.sh 是一个简单的shell脚本，用于在服务器上设置NAT VPS（在KVM虚拟化或独立服务器上）。





--The Basic Rule. 基本规则:

SSH port: Suppose the intranet IP is 10.0.1.XX, The SSH port is 610XX. (If XX is less than two digits, add 0 in the front. For example, 10.0.0.2, the SSH port is 61002).
SSH端口：假设内网IP是 10.0.1.XX，则SSH端口是 610XX。(XX不足两位数的，在前面添加0占位。例如 10.0.0.2，则SSH端口是 61002)。

Available port: Suppose the intranet IP is10.0.1.XX, The available port is 10XX1 - 10XX9. (If XX is less than two digits, add 0 in the front. For example, 10.0.0.2, the available port is 10021 - 10029).
可用端口：假设内网IP是 10.0.1.XX，则可用端口是 10XX1 至 10XX9。（XX不足两位数的，在前面添加0占位。例如 10.0.0.2，则可用端口是 10021 - 10029）。





[Please Attention: NIC settingds]. 请注意网卡设置:

Change "eth1" to the actual NIC on lines 9, 27, 28 and 29.
在第9、27、28和29行将“eth1”更改为实际的网卡。





--Instructions. 使用说明:

Upload addnat.sh to your server and run"bash addnat.sh" or "sh addnat.sh".
上传 addnat.sh 到服务器，然后运行“ bash addnat.sh ”或“ sh addnat.sh "。
