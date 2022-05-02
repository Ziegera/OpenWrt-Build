#!/bin/bash

cat >$NETIP <<-EOF
uci set network.lan.ipaddr='10.10.10.252'                                    
uci set network.lan.netmask='255.255.255.0'                                 
uci set network.lan.gateway='10.10.10.253'                                                       
uci set network.lan.dns='10.10.10.253 223.5.5.5'  
uci set network.lan.delegate='0' 
uci set dhcp.@dnsmasq[0].filter_aaaa='1'                                                                                            
uci set dhcp.lan.ignore='1'                                                                                                         
uci set system.@system[0].hostname='OpenWrt'                           
EOF
    
sed -i "s/OpenWrt /OpenWrt-22.03 $(TZ=UTC-8 date "+%Y-%m-%d") /g" $ZZZ_PATH 
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ_PATH                                                    

cat >"$CLEAR_PATH" <<-EOF
packages
config.buildinfo
feeds.buildinfo
openwrt-x86-64-generic-kernel.bin
openwrt-x86-64-generic.manifest
openwrt-x86-64-generic-squashfs-rootfs.img.gz
sha256sums
version.buildinfo
EOF
