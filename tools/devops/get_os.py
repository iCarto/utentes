from _fabfile import DEBUG, task
from print_result import print_result


def _get_os(c):
    return c.run("lsb_release -sd", hide=True)


@task
def get_os(c, hostname):
    result = _get_os(c)
    _hostname = hostname or result.connection.host
    if result.ok:
        msg = f"On {_hostname}:{result.stdout.strip()}"
        print(msg.format(result))
    else:
        print(result.stderr)

    if DEBUG:
        print_result(result)

    return result.exited
