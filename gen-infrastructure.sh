#!/bin/bash

echo "===> Launching containers"
lxc launch ubuntu:14.04 pasteque-web
lxc launch ubuntu:14.04 pasteque-db

echo "===> Waiting for containers finished to start"
sleep 10

echo "===> Pushing public key"
lxc file push /home/syh/.ssh/id_rsa.pub pasteque-web/home/ubuntu/.ssh/authorized_keys
lxc file push /home/syh/.ssh/id_rsa.pub pasteque-db/home/ubuntu/.ssh/authorized_keys

echo "===> Retrieving IP"
pasteque_web_ip=$(lxc info pasteque-web | grep 'eth0:\sinet\s' | awk '{print $3}')
echo "pasteque-web IP: ${pasteque_web_ip}"
pasteque_db_ip=$(lxc info pasteque-db | grep 'eth0:\sinet\s' | awk '{print $3}')
echo "pasteque-db IP: ${pasteque_db_ip}"

echo "===> Building inventory"
cat << EOF > ansible/inventory.txt
[web]
pasteque-web ansible_host=${pasteque_web_ip} ansible_user=ubuntu ansible_ssh_port=22

[database]
pasteque-db ansible_host=${pasteque_db_ip} ansible_user=ubuntu ansible_ssh_port=22
EOF

cat << EOF
===> You can now provision servers with:
===> ssh ubuntu@${pasteque_db_ip} date && ssh ubuntu@${pasteque_web_ip} date
===> cd ansible && ansible-playbook -i inventory.txt init-pasteque.yml
===> Go to http://pasteque.escale-biere.com and select country to boostrap database
===> update database by runining the playbook a second time
EOF
