#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

cat > package/base-files/files/etc/uci-defaults/99-custom-system <<-EOF
#!/bin/sh
generate_static_system() {
	uci -q batch <<-EOF
		delete system.@system[0]
		add system system
		set system.@system[-1].hostname='SchariacWrt'
		set system.@system[-1].timezone='CST-8'
		set system.@system[-1].ttylogin='0'
		set system.@system[-1].log_size='128'
		set system.@system[-1].urandom_seed='0'
	EOF
	uci commit system
}
generate_static_system
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-custom-system



# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Modify banner 
cat > package/base-files/files/etc/banner << EOF
 / ____|    | |              (_)           
| (___   ___| |__   __ _ _ __ _  __ _  ___ 
 \___ \ / __| '_ \ / _` | '__| |/ _` |/ __|
 ____) | (__| | | | (_| | |  | | (_| | (__ 
|_____/ \___|_| |_|\__,_|_|  |_|\__,_|\___|

 BE FREE AND UNAFRAID
 WIRELESS     FREEDOM
 -----------------------------------------------------
 %D %V, %C
 -----------------------------------------------------
EOF
