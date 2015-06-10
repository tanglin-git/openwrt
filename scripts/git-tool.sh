#!/bin/bash
#=======================================
# File  : git-tool.sh
# Brief : 统一操作多个git仓库
# Author: JakeYang <add358@gmail.com>
# Log   : 2015-03-04 create
#=======================================

# checkout  {{{1
checkout() {
	git checkout $1
}

# pull  {{{1
pull() {
	git checkout master
	git pull
}

# push  {{{1
push() {
	git checkout master
	git push oschina
}

# usage {{{1
usage()
{
	echo "Usage: `basename $0` [chk remote|pull|push] "
	exit
}

# main {{{1
remote=$1
operation=$2
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
