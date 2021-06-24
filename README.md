# Analise de dados do Titanic com Apache Hadoop e Pig

## Introdução

Este trabalho consiste em fazer análise de dados referentes à tragédia do Titanic, para fornecer um panorama geral sobre o ocorrido.

Vamos analisar a lista de passageiros presentes e separá-los em grupos por características para gerar informações sobre os grupos presentes no acidente.

Utilizaremos apenas do Apache Pig para analisar o arquivo armazenado em um cluster Hadoop, com o Pig rodando em modo MapReduce.

## Objetivo

A partir da separação dos grupos, gerar dados sobre quantidade de pessoas pertencentes aos grupos.

* Separar os passageiros por características em comum.
* Fornecer uma visão das informações dos grupos filtrados.

## Questões

* Quantos eram adultos, crianças ou idosos?
* Quantos passageiros eram do sexo masculino e feminino?
* Quantos passageiros sobreviveram e não sobreviveram?
* Qual casse teve a maior taxa de sobrevivência?

## Execução e andamento do trabalho

Primeiramente o ambiente foi criando utilizando de uma vm pronta da cloudera, que pode ser baixado em:

>  https://downloads.cloudera.com/demo_vm/virtualbox/cloudera-quickstart-vm-5.12.0-0-virtualbox.zip

Em seguida ao ser executada a vm já está toda configurada para ser usada com diversas ferramentas.

Acessando o IP da maquina virtual na porta 8888, temos uma interface gráfica web para visualizar algumas informações.

Foi a aplicação WinSCP para transferência de arquivos para a vm, já que ela conta com ssh e SFTP configurados, ambos com login: Usuário: root, Senha: cloudera.

Depois foi inserido ao hadoop o nosso dataset com o comando:

> hdfs dfs -put titanic.csv

Em seguida foi apenas executado o script titanic-script.pig para a consulta nos dados.