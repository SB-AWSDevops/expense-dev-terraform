#!/bin/bash
#user data will get by default sudo access
dnf install ansible -y
cd /tmp
git clone https://github.com/SB-AWSDevops/expense-ansible-roles.git
cd expense-ansible-roles
ansible-playbook main.yml -e component=backend -e login_password=ExpenseApp1
ansible-playbook main.yml -e component=frontend 