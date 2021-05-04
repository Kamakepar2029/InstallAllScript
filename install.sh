sudo apt install -y tightvncserver && echo "[+] Vnc Installed" || echo "[x] Vnc Not Installed"
sudo apt-get install xfonts-base -y && echo "[+] Addons Installed" || echo "[x] Addons not installed :-("
sudo apt-get install firefox -y && echo "[+] Browser Installed Successfully" || echo "[x] Browser not installed"
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
sudo systemctl enable tightvncserver.service && echo "[+] Service enabled" || echo "[-] Service not enabled"
echo "[Install Success ;-)]"
