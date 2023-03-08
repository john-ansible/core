core=main
debug=false
hosts=all
localonly=false

ROLES=\
certbot \
cryptstart \
cron \
dhcpd \
dns \
dokuwiki \
fail2ban \
gitlab \
gitlab_runner \
glpi \
init \
ipsec \
iptables \
iscsi \
mongodb \
mysql \
nginx \
openvpn \
pbs \
pg \
php \
pve \
rocketchat \
ssh_keys \
quagga \
wikidocs \
windows_server \
zbx \
zmail \

all:
ifeq ($(debug), true)
	ansible-playbook main.yml -i main.conf --limit $(hosts) -vvv
else
	ansible-playbook main.yml -i main.conf --limit $(hosts)
endif

$(ROLES):
ifeq ($(debug), true)
	ansible-playbook main.yml -i main.conf --limit $(hosts) -vvv --tags $@
else
	ansible-playbook main.yml -i main.conf --limit $(hosts) --tags $@
endif

local:
### Run tasks
ifeq ($(debug), true)
	ansible-playbook -vvv local.yml -i main.conf --limit $(hosts)
else
	ansible-playbook local.yml -i main.conf --limit $(hosts)
endif

info:
	ansible -m setup -i main.conf $(hosts)

up:
ifeq ($(localonly), true)
ifneq (,$(wildcard requirements_local.yml))
	ansible-galaxy install -r requirements_local.yml --force
endif
else
	cd core; git pull origin $(core)
	ansible-galaxy install -r requirements.yml --force
ifneq (,$(wildcard requirements_local.yml))
	ansible-galaxy install -r requirements_local.yml --force
endif
endif
