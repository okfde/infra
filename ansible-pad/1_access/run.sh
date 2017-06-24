#!/bin/bash
ansible-playbook playbook.yml -i hosts --ask-pass --ask-become-pass --sudo -c paramiko