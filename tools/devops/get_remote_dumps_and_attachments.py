import datetime
import os

from _fabfile import task
from config import local_backup_folder, local_entregas_folder, remote_backup_folder

# from patchwork.transfers import rsync
from transfers import rsync


@task
def get_remote_dumps_and_attachments(c, hostname):
    """
    Downloads to local computer the dumps and attachments in the remote server for keep
    development and testing servers up to date.
    **Review the local folder where the data is downloaded**
    """
    rsync_opts = "--stats -hh --modify-window=240 -r -z"
    ssh_opts = ""
    delete = False
    remote_folder = remote_backup_folder.format(hostname=hostname)
    local_folder = os.path.abspath(local_backup_folder.format(hostname=hostname))
    if not os.path.isdir(local_folder):
        raise Exception(f"Folder not exits: {local_folder}")
    rsync(
        c,
        source=local_folder,
        target=remote_folder,
        delete=delete,
        strict_host_keys=True,
        rsync_opts=rsync_opts,
        ssh_opts=ssh_opts,
        remote_to_local=True,  # https://github.com/fabric/patchwork/issues/26
    )


@task
def get_remote_prod_backups(c, hostname):
    version = datetime.datetime.now().strftime("%y%m%d")
    rsync_opts = "--stats -hh --modify-window=240 -r -z"
    ssh_opts = ""
    delete = False
    remote_folder = (
        remote_backup_folder.format(hostname=hostname) + f"backup-entregas/{version}/"
    )
    local_folder = os.path.abspath(local_entregas_folder)
    if not os.path.isdir(local_folder):
        raise Exception(f"Folder not exits: {local_folder}")
    local_folder = os.path.join(local_folder, version)
    try:
        os.mkdir(local_folder)
    except FileExistsError:
        pass
    if not os.path.isdir(local_folder):
        raise Exception(f"Folder not exits: {local_folder}")

    rsync(
        c,
        source=local_folder,
        target=remote_folder,
        delete=delete,
        strict_host_keys=True,
        rsync_opts=rsync_opts,
        ssh_opts=ssh_opts,
        remote_to_local=True,  # https://github.com/fabric/patchwork/issues/26
    )
