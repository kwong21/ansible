#!/bin/bash
set -e
set -u
set -o pipefail

VER=""
TAG=""

usage() {
    echo "Script usage: $(basename "$0") [-v version to deploy] [-c deploy container only]" >&2
    exit 1
}

while getopts ':v:c' OPTION; do
    case "${OPTION}" in
        v)
            VER="$OPTARG"
            ;;
        c)
            TAG="-t deploy_card_stock_container"
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

ansible-playbook -i production.ini card-stock.yml "$TAG" --extra-vars "version=$VER"