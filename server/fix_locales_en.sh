#!/bin/bash

# Workaround
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"
export LANGUAGE="en_US.UTF-8"

# http://serverfault.com/questions/362903/how-do-you-set-a-locale-non-interactively-on-debian-ubuntu
# locale-gen es_ES.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure -f noninteractive locales

sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config
sed -e '/AcceptEnv/ s/^#*/#/' -i /etc/ssh/sshd_config


# Check our system locale -- make sure it is set to UTF-8
# This also means we need to run 'dpkg-reconfigure' to avoid "unable to re-open stdin" errors (see http://serverfault.com/a/500778)
# For now, we have a hardcoded locale of "en_US.UTF-8"
# locale = "en_US.UTF-8"
# config.vm.provision :shell, :inline => "echo 'Setting locale to UTF-8 (#{locale})...' && locale | grep 'LANG=#{locale}' > /dev/null || update-locale --reset LANG=#{locale} && dpkg-reconfigure -f noninteractive locales"

# /Workaround
