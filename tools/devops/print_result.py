def print_result(result):
    print(result)
    #  print(result.stdout)
    print(f"OK: {result.ok}. Exit Code: {result.exited}")
    print(result.command)
    print(result.connection)
