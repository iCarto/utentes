from _fabfile import task  # noqa: WPS436
from print_result import print_result


def _sirha_monthly_tasks(c):
    return c.run("/etc/cron.monthly/sirha_monthly_tasks")


@task
def sirha_monthly_tasks(c):
    print_result(_sirha_monthly_tasks(c))
