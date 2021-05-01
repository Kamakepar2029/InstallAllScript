sudo apt install -y tightvncserver && echo "[+] Vnc Installed" || echo "[x] Vnc Not Installed"
echo "[!] Now you need to set password for vncserver"
tightvncserver
echo "[!] Starting installation VNC Service"
fii="/etc/systemd/system/tightvncserver.service"
echo "[Unit]">$fii
echo "Description=TightVNC remote desktop server">>$fii
echo "After=sshd.service">>$fii
echo " ">>$fii
echo "[Service]">>$fii
echo "Type=dbus">>$fii
echo "ExecStart=/usr/bin/tightvncserver :1">>$fii
echo "User=root">>$fii
echo "Type=forking">>$fii
echo " ">>$fii 
echo "[Install]">>$fii
echo "WantedBy=multi-user.target">>$fii
echo "[*] Setting user Permissions"
sudo chmod a=rwx /etc/systemd/system/tightvncserver.service && echo "[+] User Permission Successfully Set" || echo "[-] User Permissions were set Not Successfully"
sudo systemctl start tightvncserver.service && echo "[+] Service started" || echo "[-] Service not started"
sudo systemctl enable tightvncserver.service && echo "[+] Service enabled" || echo "[-] Service not enabled"
echo "[Install Success ;-)]"
