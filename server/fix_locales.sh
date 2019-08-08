#!/bin/bash

sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config
sed -e '/AcceptEnv/ s/^#*/#/' -i /etc/ssh/sshd_config

locale-gen
update-locale --reset LANG="en_US.utf8" LC_CTYPE="en_US.utf8"

export LANG="en_US.utf8"
export LC_TYPE="en_US.utf8"

# http://serverfault.com/questions/362903/how-do-you-set-a-locale-non-interactively-on-debian-ubuntu

# dpkg-reconfigure -f noninteractive locales

# Check our system locale -- make sure it is set to UTF-8
# This also means we need to run 'dpkg-reconfigure' to avoid "unable to re-open stdin" errors (see http://serverfault.com/a/500778)
# For now, we have a hardcoded locale of "en_US.UTF-8"
# locale = "en_US.UTF-8"
# config.vm.provision :shell, :inline => "echo 'Setting locale to UTF-8 (#{locale})...' && locale | grep 'LANG=#{locale}' > /dev/null || update-locale --reset LANG=#{locale} && dpkg-reconfigure -f noninteractive locales"

# /Workaround
