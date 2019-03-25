# Instalação de Cluster OKD no KVM

Este repositório disponibiliza um ansible playbook para a instalação de um cluster [OKD](https://www.okd.io/), utilizando o hypervisor KVM (libvirt) em sua máquina local.

![LibVirt KVM](https://iclickandhost.com/images/kvm_wide.png)

### Sistemas Suportados

* OpenShift Container Platform 3.11
* Fedora Workstation 29
* CentOS 7.6 para as VMs

### Fluxo de Operação do Playbook

* Instalação e Configuração do KVM
* Provisionar VM Base para o Cluster OKD
* Configuração da VM Base
* Clonar VMs para o Cluster OKD a partir da VM Base
* Disponibilizar docker storage para as novas VMs
* Configuração do DNSMasq adicionando as novas VMs
* Gerar o arquivo Hosts para instalação do Cluster
* Clonar o playbook oficial do OKD
* Realizar a instalação do OKD

## Bootstraping
---------------

### Configurações do playbook

Ajuste todas as variáveis em [playbooks/group_vars/all.yml](playbooks/group_vars/all.yml) ao seu gosto, definindo as Networks, Domínio, total de VMs e configurações específicas para o OKD:

### Instalação

Para iniciar a instalação do playbook em seu computador basta executar o comando a seguir:

```
make all
```

O playbook irá solicitar a sua senha de SUDO para continuar a instalação.


## Licença
----------

Este repositório é segue o licenciamento MIT. Para maiores detalhes veja [LICENÇA](LICENSE).
