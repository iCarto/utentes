from _fabfile import task
from print_result import print_result


def _disk_free(c):
    uname = c.run("uname -s", hide=True)
    if "Linux" in uname.stdout:
        command = "df -h / | tail -n1 | awk '{print $5}'"
        return c.run(command, hide=True)
    err = "No idea how to get disk space on {}!".format(uname)
    raise Exception(err)


@task
def disk_free(c, hostname):
    result = _disk_free(c)
    print_result(result)
