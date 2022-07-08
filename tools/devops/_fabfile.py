import functools
import sys

import fabric


DEBUG = False

# This names should be configured in /etc/hosts and ~/.ssh/config
HOSTS = ("aranorte", "aracentro", "arasul")
hosts = None


@fabric.task
def at_prod_hosts(c):
    """
    Run the selected tasks over all the production hosts
    """
    global hosts
    hosts = HOSTS


def task(func, *args, **kwargs):
    @fabric.task
    @functools.wraps(func)
    def wrapper(c, *args, **kwargs):
        if not hasattr(c, "host"):
            if not hosts:
                print("Debe usar -H o una tarea xxx_hosts para indicar los hosts")
                sys.exit(1)
            # target_group = fabric.SerialGroup(*hosts)
            for hostname in hosts:
                func(fabric.Connection(hostname), hostname, *args, **kwargs)
        else:
            func(c, c.host, *args, **kwargs)

    return wrapper
