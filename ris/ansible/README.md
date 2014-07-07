Ansible scripts for RIS servers
===============================

## Usage example

    ansible-playbook basic.yml -i hosts -e "user=<your_user_name>" --ask-sudo-pass
    ansible-playbook firewall.yml -i hosts -e "user=<your_user_name>" --ask-sudo-pass
    ansible-playbook services.yml -i hosts -e "user=<your_user_name>" --ask-sudo-pass

## Playbooks

### basic.yml

Installes and updates basic requirements

### firewall.yml

Sets up firewall settings

### services.yml

Sets up the actual services related to the RIS infrastructure
