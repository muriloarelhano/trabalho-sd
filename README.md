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

## Comandos para execução executados

Terminal do sistema operacional:

> $ docker-compose up -d

> $ docker cp ./titanic.csv frosty_poincare:/home/hduser

> $ docker cp ./titanic-script.pig frosty_poincare:/home/hduser

> $ docker exec -it frosty_poincare bash

Terminal do container docker:

> $ hdfs dfs -mkdir -p /trabalho/dados

> $ hdfs dfs -put titanic.csv /trabalho/dados

> $ pig titanic-script.pig
