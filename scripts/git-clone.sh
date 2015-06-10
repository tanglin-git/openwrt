#!/bin/bash

OPENWRT_DIR=$(dirname `readlink -f $0`)/..
FEEDS_DIR=${OPENWRT_DIR}/feeds
cd ${FEEDS_DIR}
target=`grep -v '#' ${OPENWRT_DIR}/feeds.conf.default | cut -d' ' -f2-3`
i="0"
name=
for tmp in ${target};do
	if [ ${i} -eq "0" ]; then
		name=${tmp}
		i="1"
	else
		git clone ${tmp} ${name}
		i="0"
	fi
done
