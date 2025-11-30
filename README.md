# Stock Reparadores

O Stock-Reparadores é um aplicativo computacional de gerenciamento de peças voltadas para oficinas que realizam o reparo de módulos.

**OBS.: No momento, o aplicativo é um sistema unificado, projetado para realizar o gerenciamento de componentes de apenas uma empresa.**

### Banco de Dados

O banco de dados criado para atender ao aplicativo tem como host online o serviço [Supabase](https://supabase.com/), que permite o armazenamento do banco de dados de forma gratuita e robusta.

Os arquivos que constroem o banco de dados, com todas as suas tabelas e dados, estão dentro o diretório [`database`](database), onde [`DDL.sql`](database/DDL.sql) constrói as tabelas e [`InsertFile.sql`](database/InsertFile.sql) popula o banco de dados.

### Interface

Todas as janelas do aplicativo foram construídas em Python 3.13.5, utilizando-se da biblioteca [Streamlit](https://streamlit.io/) em sua versão 1.51.0. Todas as janelas, exceto a de Login, estão presentes no diretório [`dashboards`](dashboards/). A janela de login, sendo a primeira janela a aparecer na interface, se encontra no arquivo [`main.py`](main.py).
Todas as autenticações e conexões feitas pelo aplicativo são realizadas pelas funções presentes no arquivo [`auth.py`](auth/auth.py).
Visando a compatibilidade com os mais variados sistemas operacionais, o arquivo [`__init__.py`](__init__.py) define os caminhos de cada arquivo necessário para o funcionamento do aplicativo de forma dinâmica.

## Teste Online

Para testar o Stock Reparadores de forma online, você pode acessar o link ativo pelo Streamlit Community Cloud do [Stock Reparadores]().

## Teste Local

Para testar o Stock Reparadores de forma local, primeiramente você deve instalar as bibliotecas contidas no arquivo [`requirements.txt`](requirements.txt). Recomendamos que seja utilizado um ambiente virtual, utilizando - por exemplo - o módulo [venv](https://docs.python.org/3/library/venv.html), e instalar os pré-requisitos utilizando o seguinte comando:

```bash
pip install -r requirements.txt
```

Terminado esses passos, o user deve criar um banco de dados [PostgreSQL](https://www.postgresql.org/), local ou online, utilizando os arquivos presentes no diretório [`database`](database).
Tendo o banco de dados criado, deve-se criar um arquivo chamado "secrets.toml" dentro do diretório [`.streamlit`](.streamlit/) e, dentro do arquivo, salvar a Connection String do banco de dados criado anteriormente no lugar da string _minha-connection-string_, assim como mostra o exemplo abaixo:

```toml
[database]
connection_string = "minha-connection-string"
```

**Dica: A Connection String do PostgreSQL geralmente começa com _postgresql://_ .**
