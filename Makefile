SHELL  := /bin/bash
.DEFAULT_GOAL := help
RED    := \033[0;31m
GREEN  := \033[0;32m
YELLOW := \033[1;33m
CYAN   := \033[0;36m
NC     := \033[0m # No Color

help:
	@printf "Uso: make [opções]\n\n"
	@printf "$(YELLOW)Este ansible playbook pode ser utilizado para a instalação de um cluster OKD utilizando o hypervisor KVM (libvirt).$(NC)\n\n"
	@printf "opções:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-15s$(NC) %s$(NC)\n", $$1, $$2}'
	@printf "\n"

.PHONY:
all: install-all okd-prereqs okd-deploy ## Executa todas as opções disponiveis

install-all:
	@rm /tmp/okd-kvm/facts -rf && \
	rm /tmp/okd-install/facts -rf &&\
	ansible-playbook playbooks/install-cluster-okd-kvm.yml

install-kvm: ## Instalar o Hypervisor KVM (libvirt) no ambiente local
	@rm /tmp/okd-kvm/facts -rf && \
	ansible-playbook playbooks/install-cluster-okd-kvm.yml --tag='install'

deploy-vmbase: ## Criar a VM Base que será utilizada como template para o cluster
	@rm /tmp/okd-kvm/facts -rf && \
	ansible-playbook playbooks/install-cluster-okd-kvm.yml --tag='template'

deploy-clones: ## Clonar as VMs que serão utilizada pelo cluster OKD
	@rm /tmp/okd-kvm/facts -rf && \
	ansible-playbook playbooks/install-cluster-okd-kvm.yml --tag='deploy'

okd-prereqs: ## Executar o playbook de pré-requisitos do OKD
	@rm /tmp/okd-install/facts -rf && \
	cd /tmp/openshift-ansible/ && \
	ansible-playbook playbooks/prerequisites.yml

okd-deploy: ## Executar o playbook de deploy do OKD
	@rm /tmp/okd-install/facts -rf && \
	cd /tmp/openshift-ansible/ && \
	ansible-playbook playbooks/deploy_cluster.yml
