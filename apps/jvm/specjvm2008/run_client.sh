#!/bin/bash

#Define global APP_ROOT directory
if [ -z "${APP_ROOT}" ]; then
    # Default value
    APP_ROOT=$(cd `dirname $0` ; cd ../../../; pwd)
else
    # Re-declare so it can be used in this script
    APP_ROOT=$(echo $APP_ROOT)
fi
export APP_ROOT=${APP_ROOT}


source /etc/profile
SPEC_INSTALL_DIR="/usr/local/jvm/specjvm2008"

echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo 0 > /proc/sys/kernel/numa_balancing
echo 0 > /proc/sys/kernel/sched_autogroup_enabled

pushd ${SPEC_INSTALL_DIR} > /dev/null
./run-specjvm.sh -peak -pf props/specjvm.properties -ikv
popd > /dev/null

#Restore to default values
echo 1 > /proc/sys/kernel/numa_balancing
echo 1 > /proc/sys/kernel/numa_balancing
