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

# Modify default IP
#sed -i 's/10.0.0.1/10.0.0.5/g' package/base-files/files/bin/config_generate

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
