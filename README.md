# terraform-docker-swarm
Este projeto contem codigos docker-swarm no aws

## Depencias
* terraform
* ansible
* ansible-playbook
* docker
* docker-compose

### Modo de deploy da infra

Lembrando que da regia que voce estiver criando a infra deve trocar no varias ambientes a regian, cidrs, subnets, etc.

Esse codigo executa com o terraform 0.12.2

Execute o scrito de preferencia no linux ou MacOs: sh terraform/deploy.sh , por seguranca o script pedira a confimacao.

### Configurando o Cluster

Antes de tudo deve criar o Key Pairs no aws, que fica na sessao do EC2. E trocar de acordo com o nome do key criado na variaveis

Lembrando que o terraform tem output do ips publicos que serao manager e os ips privadores os nos

Edite o arquivo ansible/hosts substituido de acordo com o output do terraform

Feito isso Execute: ansible-playbook -i ansible/inventory/hosts playbook.yml

#### Stack deploy usando o compose

Para executar essa parte é necessario docker-compose instalado no host 

Se nao existi a image no docker hub, deve seguintes passos

* Build da imagem: Lembrando que para executar o comando, deve esta dentro do deretoria onde contem o Dockerfile
 <pre>
  docker build -t [nome-do-projeto]:tag  . 
</pre> 

* Login no docker hub, repositorio de images docker publico
<pre>
docker login
</pre>

* Enviando a imagem para o docker o repositorio
<pre>
docker pull [nome-do-projeto]:tag
</pre>

* Ja configurado o cluster, deploy da aplicacao no cluster

Lembrando, que no arquivo docker-compose.yml deve trocar por nome do projeto 
<pre>
docker stack deploy -c docker-compose.yml nginx
</pre>

#### Escalar o serviço
<pre>
docker service scale nginx_web-nginx=3
</pre>

### Deploy o ambiente de gerencia do docker swarm

## Stack para rodar o Docker Ucp
<pre>
docker stack deploy -c docler/stack/stack.yml ucp
</pre>

Acessando via navegador: 

usuario: admin
senha: admin1234



### Arquitetura no AWS
![docker-swarm](img/docker-swarm.png)