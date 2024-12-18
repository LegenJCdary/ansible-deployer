#!/bin/bash -l


source ./tests/testing_lib.sh

echo -e "   ___  _                                                      _                          _                   _                _\n  / _ \/ |           __ _ _ __ __ _ _   _ _ __ ___   ___ _ __ | |_   _ __   __ _ _ __ ___(_)_ __   __ _   ___| |__   ___  _ __| |_\n | | | | |  _____   / _\` | '__/ _\` | | | | '_ \` _ \ / _ \ '_ \| __| | '_ \ / _\` | '__/ __| | '_ \ / _\` | / __| '_ \ / _ \| '__| __|\n | |_| | | |_____| | (_| | | | (_| | |_| | | | | | |  __/ | | | |_  | |_) | (_| | |  \__ \ | | | | (_| | \__ \ | | | (_) | |  | |_\n  \___/|_|          \__,_|_|  \__, |\__,_|_| |_| |_|\___|_| |_|\__| | .__/ \__,_|_|  |___/_|_| |_|\__, | |___/_| |_|\___/|_|   \__|\n                              |___/                                 |_|                           |___/\n                                                       _     _             _   _\n __      ___ __ ___  _ __   __ _    ___ ___  _ __ ___ | |__ (_)_ __   __ _| |_(_) ___  _ __  ___\n \ \ /\ / / '__/ _ \| '_ \ / _\` |  / __/ _ \| '_ \` _ \| '_ \| | '_ \ / _\` | __| |/ _ \| '_ \/ __|\n  \ V  V /| | | (_) | | | | (_| | | (_| (_) | | | | | | |_) | | | | | (_| | |_| | (_) | | | \__ \ \n   \_/\_/ |_|  \___/|_| |_|\__, |  \___\___/|_| |_| |_|_.__/|_|_| |_|\__,_|\__|_|\___/|_| |_|___/\n                           |___/\n"
# Check wrong combinations
check_message_in_output "ansible-deployer" "\[CRITICAL\]: First positional argument (subcommand) is required! Available commands are: run, lock, unlock, verify, show."
check_message_in_output "ansible-deployer run" "\[ERROR\]: Option --task is required for run"
check_message_in_output "ansible-deployer verify" "\[ERROR\]: Option --task is required for verify"
check_message_in_output "ansible-deployer run" "\[ERROR\]: Option --infrastructure is required for run"
check_message_in_output "ansible-deployer verify" "\[ERROR\]: Option --infrastructure is required for verify"
check_message_in_output "ansible-deployer run" "\[ERROR\]: Option --stage is required for run"
check_message_in_output "ansible-deployer verify" "\[ERROR\]: Option --stage is required for verify"
check_message_in_output "ansible-deployer run -t task_exec_bin_true" "\[ERROR\]: Option --stage is required for run"
check_message_in_output "ansible-deployer verify -t task_exec_bin_true" "\[ERROR\]: Option --stage is required for verify"
check_message_in_output "ansible-deployer run -t task_exec_bin_true" "\[ERROR\]: Option --infrastructure is required for run"
check_message_in_output "ansible-deployer verify -t task_exec_bin_true" "\[ERROR\]: Option --infrastructure is required for verify"
check_message_in_output "ansible-deployer run -t task_exec_bin_true -i testInfra" "stage is required for run"
check_message_in_output "ansible-deployer verify -t task_exec_bin_true -i testInfra" "stage is required for verify"

check_message_in_output "ansible-deployer -t task_exec_bin_true -i testInfra" "\[CRITICAL\]: First positional argument (subcommand) is required! Available commands are: run, lock, unlock, verify, show."

check_message_in_output "ansible-deployer verify -t task_exec_bin_true -i testInfra -s prod -c testCommit" "Option --commit is not supported by verify"
check_message_in_output "ansible-deployer verify -t task_exec_bin_true -i testInfra -s prod -C" "Option --check-mode is not supported by verify"
check_message_in_output "ansible-deployer verify -t task_exec_bin_true -i testInfra -s prod -D" "Option --dry-mode is not supported by verify"
check_message_in_output "ansible-deployer lock -t task_exec_bin_true -i testInfra" "\[ERROR\]: Option --task is not supported by lock"
check_message_in_output "ansible-deployer lock -t task_exec_bin_true -i testInfra -s prod" "\[ERROR\]: Option --task is not supported by lock"
check_message_in_output "ansible-deployer lock -t task_exec_bin_true -s prod" "\[ERROR\]: Option --infrastructure is required for lock"
check_message_in_output "ansible-deployer lock -t task_exec_bin_true -s prod -c X" "\[ERROR\]: Option --commit is not supported by lock"
check_message_in_output "ansible-deployer lock -i testInfra -s prod --keep-locked" "\[ERROR\]: Option --keep-locked is not supported by lock"
check_message_in_output "ansible-deployer lock -t task_exec_bin_true -l test_hosts_1" "\[ERROR\]: Option --limit is not supported by lock"
check_message_in_output "ansible-deployer lock -i testInfra -s prod --raw-runner-output" "\[ERROR\]: Option --raw-runner-output is not supported by lock"
check_message_in_output "ansible-deployer lock -i testInfra -s prod --self-setup ." "\[ERROR\]: Option --self-setup is not supported by lock"
check_message_in_output "ansible-deployer lock -i testInfra -s prod -C" "\[ERROR\]: Option --check-mode is not supported by lock"
check_message_in_output "ansible-deployer lock -i testInfra -s prod -D" "\[ERROR\]: Option --dry-mode is not supported by lock"

check_message_in_output "ansible-deployer unlock -t task_exec_bin_true -i testInfra" "\[ERROR\]: Option --task is not supported by unlock"
check_message_in_output "ansible-deployer unlock -t task_exec_bin_true -i testInfra -s prod" "\[ERROR\]: Option --task is not supported by unlock"
check_message_in_output "ansible-deployer unlock -t task_exec_bin_true -s test" "\[ERROR\]: Option --infrastructure is required for unlock"
check_message_in_output "ansible-deployer unlock -t task_exec_bin_true -s prod -c X" "\[ERROR\]: Option --commit is not supported by unlock"
check_message_in_output "ansible-deployer unlock -i testInfra -s prod --keep-locked" "\[ERROR\]: Option --keep-locked is not supported by unlock"
check_message_in_output "ansible-deployer unlock -t task_exec_bin_true -l test_hosts_1" "\[ERROR\]: Option --limit is not supported by unlock"
check_message_in_output "ansible-deployer unlock -i testInfra -s prod --raw-runner-output" "\[ERROR\]: Option --raw-runner-output is not supported by unlock"
check_message_in_output "ansible-deployer unlock -i testInfra -s prod --self-setup ." "\[ERROR\]: Option --self-setup is not supported by unlock"
check_message_in_output "ansible-deployer unlock -i testInfra -s prod -C" "\[ERROR\]: Option --check-mode is not supported by unlock"
check_message_in_output "ansible-deployer unlock -i testInfra -s prod -D" "\[ERROR\]: Option --dry-mode is not supported by unlock"

check_message_in_output "ansible-deployer run test" "\[CRITICAL\]: Too many positional arguments! Only subcommand \"show\" can accept following arguments: all, task, infra."
check_message_in_output "ansible-deployer verify test" "\[CRITICAL\]: Too many positional arguments! Only subcommand \"show\" can accept following arguments: all, task, infra."
check_message_in_output "ansible-deployer lock test" "\[CRITICAL\]: Too many positional arguments! Only subcommand \"show\" can accept following arguments: all, task, infra."
check_message_in_output "ansible-deployer unlock test" "\[CRITICAL\]: Too many positional arguments! Only subcommand \"show\" can accept following arguments: all, task, infra."
check_message_in_output "ansible-deployer show test" "\[CRITICAL\]: Invalid argument test! Subcommand \"show\" can accept only following arguments: all, task, infra."
check_message_in_output "ansible-deployer show -c task_exec_bin_true" "\[ERROR\]: Option --commit is not supported by show"
check_message_in_output "ansible-deployer show -l test_hosts_1" "\[ERROR\]: Option --limit is not supported by show"
check_message_in_output "ansible-deployer show -t task_exec_bin_true" "\[ERROR\]: Option --task is not supported by show"
check_message_in_output "ansible-deployer show -i testInfra" "\[ERROR\]: Option --infrastructure is not supported by show"
check_message_in_output "ansible-deployer show -s prod" "\[ERROR\]: Option --stage is not supported by show"
check_message_in_output "ansible-deployer show --conf-validation" "\[ERROR\]: Option --conf-validation is not supported by show"
check_message_in_output "ansible-deployer show --keep-locked" "\[ERROR\]: Option --keep-locked is not supported by show"
check_message_in_output "ansible-deployer show --syslog" "\[ERROR\]: Option --syslog is not supported by show"
check_message_in_output "ansible-deployer show --raw-runner-output" "\[ERROR\]: Option --raw-runner-output is not supported by show"
check_message_in_output "ansible-deployer show --self-setup ." "\[ERROR\]: Option --self-setup is not supported by show"
check_message_in_output "ansible-deployer show -C" "\[ERROR\]: Option --check-mode is not supported by show"
check_message_in_output "ansible-deployer show -D" "\[ERROR\]: Option --dry-mode is not supported by show"

echo -e "   ___  _                                                      _                          _                   _                _\n  / _ \/ |           __ _ _ __ __ _ _   _ _ __ ___   ___ _ __ | |_   _ __   __ _ _ __ ___(_)_ __   __ _   ___| |__   ___  _ __| |_\n | | | | |  _____   / _\` | '__/ _\` | | | | '_ \` _ \ / _ \ '_ \| __| | '_ \ / _\` | '__/ __| | '_ \ / _\` | / __| '_ \ / _ \| '__| __|\n | |_| | | |_____| | (_| | | | (_| | |_| | | | | | |  __/ | | | |_  | |_) | (_| | |  \__ \ | | | | (_| | \__ \ | | | (_) | |  | |_\n  \___/|_|          \__,_|_|  \__, |\__,_|_| |_| |_|\___|_| |_|\__| | .__/ \__,_|_|  |___/_|_| |_|\__, | |___/_| |_|\___/|_|   \__|\n                              |___/                                 |_|                           |___/\n                               _                         _     _             _   _\n   ___ ___  _ __ _ __ ___  ___| |_    ___ ___  _ __ ___ | |__ (_)_ __   __ _| |_(_) ___  _ __  ___\n  / __/ _ \| '__| '__/ _ \/ __| __|  / __/ _ \| '_ \` _ \| '_ \| | '_ \ / _\` | __| |/ _ \| '_ \/ __|\n | (_| (_) | |  | | |  __/ (__| |_  | (_| (_) | | | | | | |_) | | | | | (_| | |_| | (_) | | | \__ \ \n  \___\___/|_|  |_|  \___|\___|\__|  \___\___/|_| |_| |_|_.__/|_|_| |_|\__,_|\__|_|\___/|_| |_|___/\n"
# Check if correct combinations are accepted
check_run_ok "ansible-deployer run --conf-validation -t task_exec_bin_true -s prod -i testInfra"
check_run_ok "ansible-deployer verify --conf-validation -t task_exec_bin_true -s prod -i testInfra"
check_run_ok "ansible-deployer run --conf-validation -t task_with_limit -s testing -i testInfra -l testHost1"
check_run_ok "ansible-deployer verify --conf-validation -t task_with_limit -s testing -i testInfra -l testHost1"
check_run_ok "ansible-deployer run --conf-validation -t task_exec_bin_true -s prod -i testInfra -c test_version"
check_run_ok "ansible-deployer run -C -t task_exec_bin_true -s prod -i testInfra"
check_run_ok "ansible-deployer run -D -t task_exec_bin_true -s prod -i testInfra"
check_run_ok "ansible-deployer lock --conf-validation -s prod -i testInfra"
check_run_ok "ansible-deployer unlock --conf-validation -s prod -i testInfra"
check_run_ok "ansible-deployer show"
check_run_ok "ansible-deployer show infra"

echo -e "   ___  _                                                      _                          _                   _                _\n  / _ \/ |           __ _ _ __ __ _ _   _ _ __ ___   ___ _ __ | |_   _ __   __ _ _ __ ___(_)_ __   __ _   ___| |__   ___  _ __| |_\n | | | | |  _____   / _\` | '__/ _\` | | | | '_ \` _ \ / _ \ '_ \| __| | '_ \ / _\` | '__/ __| | '_ \ / _\` | / __| '_ \ / _ \| '__| __|\n | |_| | | |_____| | (_| | | | (_| | |_| | | | | | |  __/ | | | |_  | |_) | (_| | |  \__ \ | | | | (_| | \__ \ | | | (_) | |  | |_\n  \___/|_|          \__,_|_|  \__, |\__,_|_| |_| |_|\___|_| |_|\__| | .__/ \__,_|_|  |___/_|_| |_|\__, | |___/_| |_|\___/|_|   \__|\n                              |___/                                 |_|                           |___/\n                                                    __ _\n __      ___ __ ___  _ __   __ _    ___ ___  _ __  / _(_) __ _\n \ \ /\ / / '__/ _ \| '_ \ / _\` |  / __/ _ \| '_ \| |_| |/ _\` |\n  \ V  V /| | | (_) | | | | (_| | | (_| (_) | | | |  _| | (_| |\n   \_/\_/ |_|  \___/|_| |_|\__, |  \___\___/|_| |_|_| |_|\__, |\n                           |___/                         |___/\n"
# Check if wrong config is rejected
check_message_in_output "ansible-deployer run --conf-validation -t task_exec_bin_true -i nonExistingInfra -s prod" "\[CRITICAL\]: nonExistingInfra not found in configuration file"
