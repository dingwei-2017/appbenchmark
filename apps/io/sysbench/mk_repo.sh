#!/bin/bash

CURDIR=$(cd `dirname $0`; pwd)

pushd ${CURDIR}/ansible > /dev/null

ansible-playbook -i hosts mk_repo.yml  --user=root --ask-sudo-pass --extra-vars "ansible_sudo_pass=root"

popd > /dev/null

