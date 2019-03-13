# Code Challenge - Backend - Bank Accounting

Criar um sistema que gerenciar contas bancárias de clientes, permitindo fazer transferências de um cliente para outro e expor o saldo atual da conta, sempre em reais.


## Requisitos não funcionais 

 1. O sistema deve expor uma API via HTTP 
 2. A API deve possuir algum mecanismo de autenticação para identificar o cliente que está fazendo as requisições 
 3.  Os dados devem ser armazenados em um banco PostgreSQL 
 4. Você deve usar Ruby ou Elixir para implementar este projeto
 5. O código deve ser versionado usando git 
 6. O repositório deve conter um README documentando como o sistema pode ser usado e como outra pessoa pode contribuir com o código, similar a um projeto Open Source

## Fluxos implementados
 - Transferir dinheiro 
-  Consultar saldo

#  Summary

Utilizado Ruby on Rails para implementação do desafio. Para a solução utilizamos dois modelos `User` e` BankAccount`.
Relacionamentos:
-  **user**  has_many **account**
-  **account** belongs_to **user** and has_many **account_entry**
-  **account_entry** belongs_to **account**

Basicamente permitindo que um usuário possua várias contas e que estas possuam diversas transações (entrada e saída)

## Init Database

Para este desafio foi utilizado o BD - Postegresql. Install PostgreSQL
First, update apt-get:

    sudo apt-get update
    
Then install PostgreSQL and its development libraries:

    sudo apt-get install postgresql postgresql-contrib libpq-dev

## Running the Tests

Instale a gem:

    bundle install

Crie as bases de dados para a aplicação - `development`  and  `test`:

    rails db:create

Run Migrate:

    rails db:migrate

Run tests:

    rspec

##  Runnig the Application

Instale a gem:

    bundle install

Crie as bases de dados para a aplicação - `development`  and  `test`:

    rails db:create

Run Migrate:

    rails db:migrate

Executar o comando para popular o banco

    rails db:seed
    
Run App:

    rails s

# Informações adicionais

- Para os teste utilizado o [rspec](https://github.com/rspec/rspec-rails)