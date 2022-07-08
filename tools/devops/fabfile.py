import fabric
from _fabfile import HOSTS, at_prod_hosts, task
from disk_free import disk_free
from get_os import get_os
from get_remote_dumps_and_attachments import (
    get_remote_dumps_and_attachments,
    get_remote_prod_backups,
)
from sirha_monthly_tasks import sirha_monthly_tasks


@task
def test(c, hostname):
    print(c, hostname)


@fabric.task
def putfile(c, filepath=None):
    import os

    # fab putfile --filepath=/tmp/whatever.txt
    filename = os.path.basename(filepath)
    fabric.SerialGroup(*HOSTS).put(filepath, f"/tmp/{filename}")


@task
def ejemplo(c, hostname=None, bar=None):
    print(c)
    print(hostname)
    print(bar)
