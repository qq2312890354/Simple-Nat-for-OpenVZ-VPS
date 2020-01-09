--addnat.sh Is a simple shell script for nat on your server.

--The basic rule: 

SSH port:10.0.1.XX The SSH port is 610XX (the number of digits is 0 in front. For example, 10.0.0.2, the SSH port is 61002)

Available port：10.0.1.XX The available port is 10XX1 - 10XX9 (the number is preceded by 0. For example, 10.0.0.2, the available port is 10021 - 10029)

[Note: NIC settingds]: 
Change "eth1" to the actual NIC on lines 9, 27, 28 and 29

--Instructions: 

Upload addnat.sh to your server and run"bash addnat.sh" or "sh addnat.sh"
