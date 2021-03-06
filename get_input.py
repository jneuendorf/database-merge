import math
import yaml

from Input import Input


def get_input(cli_args):
    script_name = cli_args[0]
    cli_args = cli_args[1:]
    if len(cli_args) > 0 and cli_args[0].startswith("--settings-file="):
        file = open(cli_args[0][16:])
        settings = yaml.safe_load(file)
        file.close()
        if len(settings["db_urls"]) < 2:
            raise ValueError("Hey, merging less than 2 databases is too easy. Bye!")
        return Input(**settings)
    else:
        raise ValueError(
            "No --settings-file argument given. "
            f"Usage: {script_name} --settings-file=path/to/file.yml"
        )
