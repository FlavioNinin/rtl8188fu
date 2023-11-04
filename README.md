Sequências de comandos para configurar o dispositivo USB WiFi Realtek Semicondutor Corp. RTL8188FTV 802.11b no Linux Ubuntu ou distro derivada.

Antes de executar qualquer comando, atualize seu repositório via terminal:

sudo su

apt-get upgrade && apt-get update

Após isso, com o dispostivo usb conectado verifique se o Linux o reconhece com o seguinte comando:

lsusb

Em alguma das portas deverá aparecer um resultado semelhante a este:

Bus 000 DEVICE 000: ID 0BDA:0158 Realtek Semiconductor Corp. USB. 2.0 multicard reader

Após isso, ainda logado com o super usuario, execute os comandos em sequência:

sudo apt-get install build-essential git dkms linux-headers-$(uname -r)

git clone https://github.com/FlavioNinin/rtl8188fu

sudo dkms add ./rtl8188fu

sudo dkms build rtl8188fu/1.0

sudo dkms install rtl8188fu/1.0

sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/

sudo mkdir -p /etc/modprobe.d/

sudo touch /etc/modprobe.d/rtl8188fu.conf

echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf

sudo mkdir -p /etc/NetworkManager/conf.d/

sudo touch /etc/NetworkManager/conf.d/disable-random-mac.conf

echo -e "[device]\nwifi.scan-rand-mac-address=no" | sudo tee /etc/NetworkManager/conf.d/disable-random-mac.conf

echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf


Caso queria executar via shell script, dentro desta pasta possui o arquivo: realtek.sh

Boa sorte

Flavio Ninin

