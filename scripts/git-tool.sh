#!/bin/bash
#=======================================
# File  : git-tool.sh
# Brief : 统一操作多个git仓库
# Author: JakeYang <add358@gmail.com>
# Log   : 2015-03-04 create
#=======================================

# main {{{1
OPENWRT_DIR=$(dirname `readlink -f $0`)/..
LUCI_DIR=${OPENWRT_DIR}/feeds/luci
MANAGEMENT_DIR=${OPENWRT_DIR}/feeds/management
PACKAGE_DIR=${OPENWRT_DIR}/feeds/packages
ROUTING_DIR=${OPENWRT_DIR}/feeds/routing
TELEPHONY_DIR=${OPENWRT_DIR}/feeds/telephony
TARGETS_DIR=${OPENWRT_DIR}/feeds/targets

git_dirs="${OPENWRT_DIR} ${LUCI_DIR} ${MANAGEMENT_DIR} ${PACKAGE_DIR} ${ROUTING_DIR} ${TELEPHONY_DIR} ${TARGETS_DIR}"

for dir in ${git_dirs}; do
	cd ${dir}
	git $*
done
