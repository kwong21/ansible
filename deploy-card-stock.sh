#!/bin/bash

VER=$1

ansible-playbook -i production.ini card-stock.yml --extra-vars "version=$VER"