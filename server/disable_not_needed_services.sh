#!/bin/bash

chmod -x /etc/cron.daily/mlocate

SERVICES=("cups" "cups-browsed" "bluetooth")

if lsb_release --codename | grep "precise" > /dev/null ; then
    for service in "${LIST[@]}" ; do
	[ -f "/etc/init.d/${service}" ] && update-rc.d "${service}" disable
    done
else
    for service in "${LIST[@]}" ; do
	systemctl disable "${service}"
    done
fi
