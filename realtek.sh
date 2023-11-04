!/bin/bash
#
echo "Ola, tudo bem?"
echo "Sou o Flavio Ninin e vou configurar seu Wifi USB em sua distro baseada no UBUNTU"
echo "Para que este procedimento funcione corretamente seu repositorio deve estar atualizado."
echo "Outro detalhe importante, voce deve estar com o super usuario(ROOT)."
sleep1
echo "Caso o repositorio nao esteja atualizado ou esteja com um usuario normal pressione Ctrl+C para abortar antes dos 5 segundos"
sleep 5
echo "Bus 000 DEVICE 000: ID 0BDA:0158 Realtek Semiconductor Corp. USB. 2.0 multicard reader"
echo "Vai comecar a configuracao do seu drive USB WiFi Realtek Semicondutor Corp. RTL8188FTV 802.11b" 
sleep 1
echo "Este processo tera 13 etapas e comecara agora"
sudo apt-get install build-essential git dkms linux-headers-$(uname -r)
echo "Processo 1 de 13 Ok"
sleep 2
git clone https://github.com/FlavioNinin/rtl8188fu
echo "Processo 2 de 13 Ok"
sleep 2
sudo dkms add ./rtl8188fu
echo "Processo 3 de 13 Ok"
sleep 2
sudo dkms build rtl8188fu/1.0
echo "Processo 4 de 13 Ok"
sleep 2
sudo dkms install rtl8188fu/1.0
echo "Processo 5 de 13 Ok"
sleep 2
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
echo "Processo 6 de 13 Ok"
sleep 2
sudo mkdir -p /etc/modprobe.d/
echo "Processo 7 de 13 Ok"
sleep 2
sudo touch /etc/modprobe.d/rtl8188fu.conf
echo "Processo 8 de 13 Ok"
sleep 2
echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
echo "Processo 9 de 13 Ok"
sleep 2
sudo mkdir -p /etc/NetworkManager/conf.d/
echo "Processo 10 de 13 Ok"
sleep 2
sudo touch /etc/NetworkManager/conf.d/disable-random-mac.conf
echo "Processo 11 de 13 Ok"
sleep 2
echo -e "[device]\nwifi.scan-rand-mac-address=no" | sudo tee /etc/NetworkManager/conf.d/disable-random-mac.conf
echo "Processo 12 de 13 Ok"
sleep 2
echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf
echo "Processo 13 de 13 Ok"
sleep 
echo "Desplugue seu dispositivo USB WiFi Realtek Semicondutor Corp. RTL8188FTV 802.11b e plugue novamente."
echo "Caso não aparece a conexão WiFi, será necessario reiniciar seu computador"
echo "Obrigado"