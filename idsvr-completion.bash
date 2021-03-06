#!/bin/bash
# Copyright 2018 Curity AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

_idsvr()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="--admin \
        --config-service-host \
        --dump-config \
        --force-reload \
        --help \
        --hsm-pin \
        --config-keystore \
        --load-config \
        --debug-hsm \
        --no-admin \
        --config-service-port \
        --reload \
        --server-id \
        --version \
        -a \
        -c \
        -d \
        -f \
        -h \
        -i \
        -k \
        -l \
        -m \
        -n \
        -p \
        -r \
        -s \
        -v \
    "

    case "${prev}" in
        # Complete files
        -l|--load-config|-k|--config-keystore)
            COMPREPLY=( $(compgen -f ${cur}) )
            return 0
            ;;
        # Complete hostnames
        -c|--config-service-host)
            COMPREPLY=( $(compgen -A hostname ${cur}) )
            return 0
            ;;
        # Do not complete anything after arguments that require a value
        -s|--server-id|-i|--hsm-pin)
            COMPREPLY=( )
            return 0
            ;;
        *)
        ;;
    esac

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}
complete -F _idsvr idsvr
