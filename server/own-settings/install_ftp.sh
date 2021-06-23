#!/bin/bash

source variables.ini

apt remove -y --purge vsftpd* proftpd*
rm -rf /srv/ftp/

for user in aradata inamdata ingcdata araro inamro ingcro ftpuser; do
    userdel -r -f "${user}"
done

for group in arauser inamuser ingcuser aradata inamdata ingcdata araro inamro ingcro; do
    groupdel "${group}"
done

apt install -y vsftpd

cp "${SETTINGS}/own-settings/vsftpd.conf" /etc/vsftpd.conf
chown root:root /etc/vsftpd.conf
chmod 644 /etc/vsftpd.conf

cp -r "${SETTINGS}/own-settings/vsftpd" /etc/vsftpd
chown -R root:root /etc/vsftpd
chmod 644 /etc/vsftpd/allowed_users
chmod 755 /etc/vsftpd/

cp -r "${SETTINGS}/own-settings/pam.d/vsftpd" /etc/pam.d/vsftpd
chown -root:root /etc/pam.d/vsftpd
chmod 644 /etc/pam.d/vsftpd

for user in ara inam; do
    adduser "${user}data" --shell /bin/false --home /home/"${user}data"
    adduser "${user}ro" --ingroup "${user}data" --shell /bin/false --home /home/"${user}ro"
    rm /home/"${user}data"/{.bash_logout,.bashrc,.profile}
    rm /home/"${user}ro"/{.bash_logout,.bashrc,.profile}
done

systemctrl restart vsftpd

old_way() {
    mkdir -p /srv/ftp/gealog/
    for user in aradata inamdata ingcdata; do
        adduser "${user}" --shell /bin/false --home /srv/ftp/gealog/"${user}"
        # introducir clave
        rm /srv/ftp/gealog/"${user}"/{.bash_logout,.bashrc,.profile}

        # Poner como grupo principal de aradata, inamdata e ingcdata "ftpuser"
        chown :ftpuser "${user}"
        chmod 1775 /srv/ftp/gealog/"${user}"
    done

    for user in ara inam ingc; do
        adduser "${user}ro" --shell /bin/false --home /srv/ftp/gealog/"${user}data"
        # introducir clave
    done
}
