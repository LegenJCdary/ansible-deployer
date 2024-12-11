"""
This module's intention is to aggregate larger (>3) or inconvenient-to-be-placed-in-code logging or
print statements into functions
"""
from logging import Logger
from os import sep as ossep


def log_exit_messages(logger: Logger, log_path: str, db_path: str) -> None:
    """Log info about logfile and db at the end of exec"""
    exe_id = log_path.rsplit(ossep, 2)[1]
    logger.info(f"More information on this execution (ID:    {exe_id}    ) can be acquired in:")
    logger.info(f"\tlogfile:\t\t\t{log_path}")
    logger.info(f"\tdatabase:\t\t\t{db_path}")
