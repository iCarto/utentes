import os
import time
from subprocess import DEVNULL, PIPE, Popen


# TODO: Fix to use `with:`
def function_over(database, callback):
    """
    Executes a function that connects to a database over port-forwarding or directly
    """
    tunnel = database[1].get("tunnel")
    if tunnel:
        try:
            open_tunel(**tunnel)
            return callback(database)
        finally:
            close_tunel(tunnel["remote_ssh_host"])
    else:
        return callback(database)


def open_tunel(
    remote_ssh_host, local_app_host, local_app_port, remote_app_host, remote_app_port
):
    bin_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        # "bash_utils",
        "ssh_tunel.sh",
    )
    command = [
        bin_path,
        "open",
        remote_ssh_host,
        local_app_host,
        local_app_port,
        remote_app_host,
        remote_app_port,
    ]
    print(command)
    execute_quitely(command)
    # Hack. This execute_quitely implementation does not wait for the establishment of
    # tunnel, so right after it, it can not be used jet.
    time.sleep(4)


def close_tunel(remote_ssh_host):
    time.sleep(4)

    bin_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        # "bash_utils",
        "ssh_tunel.sh",
    )
    command = [
        bin_path,
        "close",
        remote_ssh_host,
    ]
    execute_quitely(command)


def execute_quitely(args, env=None):
    """
    Executes the command via subprocess. Popen without accepting input (stdin) or
    outputing anything (stdout, stderr)
    Returns the original exit status of the command used
    """
    # https://stackoverflow.com/questions/11269575/
    p = Popen(args, env=env, stdin=DEVNULL, stdout=DEVNULL, stderr=PIPE)
    # err = p.communicate()
    # communicate() returns a tuple (stdout, stderr) that are bytes, so we need to convert this bytes literals
    # to str to avoid errors with json.dumps
    # err_messages = list(
    #     map(lambda st: st.decode("utf-8") if st is not None else None, err)
    # )
    # return (p.returncode, err_messages)
