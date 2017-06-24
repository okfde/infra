# etherpad-lite in an own virtual machine

Ansible Playbook to install etherpad-lite (Node6, MYSQL), Outgoing Mail via Gmail-SMTP and restore a previous pad installation.

WARNING: This assumes that nothing except etherpad-lite will run in the VM.
Create unique ssh deploy keys, so ansible cannot connect accidentally to another server and screw it up.

## DO NOT RUN ON A SERVER WITH EXISTING OTHER SERVICES/APPS

Needed:
* Ubuntu Server (ubuntu-server-16.04.1) in a Virtual Machine (2GB RAM, min. 20GB HD)
* Ansible 2.2.1.0
* Gmail SMTP user for outgoing mail sending (no incoming mail is configured)



## Preparation

### install ubuntu

you must use `etherpad` as your main user name, password as you choose

create an empty file in `/root/`

`touch /root/etherpad`


### add files to ansible "files" folder

add ssh keys

`files/id_rsa_etherpad`
`files/id_rsa_etherpad.pub`

add a mysqldump exported from previous installation

`files/etherpad.sql.bz2`

You can create such a dump in your old installation with

`$ mysqldump -u root -p --databases etherpad | bzip2 > etherpad.sql.bz2` 

### create file "hosts" in "1_access"

```
[etherpad]
YOUR_IP ansible_port=YOUR_PORT
```

### create file "hosts" in "2_setup"

```
[etherpad]
YOUR_IP ansible_port=YOUR_PORT ansible_ssh_private_key_file=../files/id_rsa_etherpad
```

replace YOUR_IP with your server ip 

replace YOUR_PORT with your server ssh port (beware, if it's virtual machine, it's most likely NOT on port 22) 

### copy "2_setup/group_vars/all.yml.dist" to "2_setup/group_vars/all.yml" and fill in your settings into all UPPERCASED VARIABLES

```
mysql:
   admin_pass: "YOUR_MYSQL_ADMIN_PASSWORD"
…
mail:
  user: "YOUR_GMAIL_EMAIL_ADDRESS"
  pass: "YOUR_GMAIL_EMAIL_PASSWORD"
  rootmailalias: "YOUR_ROOT_ALIAS_EMAIL_ADDRESS"
…
etherpad:
   admin_pass: 'YOUR_PAD_ADMIN_PASSWORD'
   database_pass: 'YOUR_PAD_DATABASE_USER_PASSWORD'
…
```


## RUN

First, on a fresh Ubuntu Installation, it will copy the public ssh key and enable root ssh access.

execute "run.sh" in "1_access" & enter the server user password

Second, connection will be made with this key and the password login will be disabled.

Then Node, MYSQL, POSTFIX and etherpad-lite will be downloaded and installed with specialized settings.

The mysql dump will be uploaded and restored. (This includes your old pads)

execute "run.sh" in "2_setup"

Restart the VM and etherpad-lite will be available on port 9001 (or depending on your settings) of your Virtual Machine.

