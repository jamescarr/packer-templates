#!/bin/sh -x
echo "Cleaning up dhcp leases..."
rm /var/lib/dhcp/*

echo "Cleaning up udev rules..."
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

#Remove oh-my-zsh git repo histories to save space; keep the current code checkout. We want oh-my-zsh but not the whole git repo's history
echo "Removing oh-my-zsh git repos..."
rm -rf /home/vagrant/.oh-my-zsh/.git
rm -rf /root/.oh-my-zsh/.git

#Remove rbenv git repo histories to save space; keep the current code checkout. We want rbenv but not the whole git repo's history
echo "Removing rbenv git repos..."
rm -rf /home/vagrant/.rbenv/.git
rm -rf /root/.rbenv/.git

#apt cleanup
echo "Running apt-get remove kernel headers..."
apt-get -y remove linux-headers-$(uname -r)
echo "Running remove older kernel headers"
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
echo "Running apt-get clean..."
apt-get -y clean
echo "Running apt-get autoclean..."
apt-get -y autoclean
echo "Running apt-get remove..."
apt-get -y remove
echo "Running apt-get auto-remove..."
apt-get -y autoremove

#Remove non-English locale files
echo "Removing non-English locale files"
sudo rm -rf /usr/share/locale/{af,am,ar,as,ast,az,bal,be,bg,bn,bn_IN,br,bs,byn,ca,cr,cs,csb,cy,da,de,de_AT,dz,el,en_AU,en_CA,eo,es,et,et_EE,eu,fa,fi,fo,fr,fur,ga,gez,gl,gu,haw,he,hi,hr,hu,hy,id,is,it,ja,ka,kk,km,kn,ko,kok,ku,ky,lg,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,nb,ne,nl,nn,no,nso,oc,or,pa,pl,ps,pt,pt_BR,qu,ro,ru,rw,si,sk,sl,so,sq,sr,sr*latin,sv,sw,ta,te,th,ti,tig,tk,tl,tr,tt,ur,urd,ve,vi,wa,wal,wo,xh,zh,zh_HK,zh_CN,zh_TW,zu}

echo "pre-up sleep 2" >> /etc/network/interfaces

#zero out disk space. Replacing free space with 0s makes the drive more easily compressed
echo "Zeroing out disk..."
cat /dev/zero > zero.fill;sync;sleep 1;sync;rm -f zero.fill

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
exit

