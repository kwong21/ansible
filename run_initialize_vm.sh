#!/bin/bash
set -e
set -u
set -o pipefail

HOSTNAME=""

usage() {
    echo "Script usage: $(basename "$0") [-h hostname to limit initialize to ]" >&2
    exit 1
}

while getopts ':h' OPTION; do
    case "${OPTION}" in
        h)
            HOSTNAME="$OPTARG"
            ;;
        ?)
            usage
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "${VER}" ]; then
    usage
fi

ansible-playbook -i production.ini --limit=$HOSTNAME