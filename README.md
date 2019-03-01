# Instalação de Cluster OKD no KVM
Este ansible playbook pode ser utilizado para a instalação de um cluster OKD utilizando o hypervisor KVM (libvirt).

## Sistemas Suportados
- Fedora 29

## Fluxo de Operação do Playbook
- Instalação e Configuração do KVM
- Provisionar VM Base para o Cluster

## TODO
- Atualizar a VM Base
- Criar VMs para o Cluster a partir da VM Base
- Disponibilizar disco para as novas VMs
- Configurar o DNSMasq adicionando as novas VMs
- Gerar o arquivo Hosts para instalação do Cluster
- Clonar o playbook oficial do OKD
- Realizar a instalação do OKD