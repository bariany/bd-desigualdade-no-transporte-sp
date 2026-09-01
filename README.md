## Desigualdade Social no Transporte Urbano

A cidade de São Paulo é marcada por uma profunda disparidade territorial, onde o CEP de um cidadão determina diretamente o tempo que lhe resta no dia. Enquanto os moradores das regiões centrais usufruem de deslocamentos rápidos, as populações periféricas enfrentam rotinas exaustivas no transporte público, um fenômeno conhecido como "pobreza de tempo" que limita o acesso a oportunidades, estudo e lazer. Para formular soluções que combatam essa segregação urbana, o planejamento público não pode se basear em suposições; ele precisa ser fundamentado em evidências concretas e na organização inteligente de informações sobre o território.

## Proposta
Este projeto propõe a criação e estruturação de um banco de dados relacional utilizando dados da [Pesquisa Origem e Destino 2023 do Metrô SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/). O principal objetivo é mostrar como a Engenharia de Dados e a linguagem SQL podem apoiar a tomada de decisão na gestão da mobilidade urbana, produzindo informações que auxiliem na compreensão da desigualdade social no transporte urbano. 

## Tecnologias Utilizadas
### Armazenamento e Modelagem de Dados
| Tecnologia | Finalidade |
|------------|------------|
| **PostgreSQL** | Sistema de gerenciamento de banco de dados relacional utilizado para armazenar e estruturar os dados |
| **pgAdmin 4** | Interface gráfica utilizada para administração do banco de dados e execução de consultas SQL |

### Processamento de Dados
| Tecnologia | Finalidade |
|------------|------------|
| **SQL** | Linguagem utilizada para criação do banco de dados, consultas, manipulação e transformação dos dados |
| **Microsoft Excel** | Utilizado para análise exploratória, organização e validação dos dados |
| **Power Query** | Ferramenta utilizada para extração, transformação e carregamento (ETL) dos dados para o Excel |

### Controle de Versão
| Tecnologia | Finalidade |
|------------|------------|
| **GitHub** | Hospedagem do repositório, versionamento dos scripts SQL e documentação do projeto |

## Ciclo de Desenvolvimento

O projeto foi desenvolvido a partir do seguinte questionamento:

> **Trabalhadores de baixa renda gastam o dobro do tempo em deslocamento que os de alta renda na cidade de São Paulo. Quais zonas apresentam os maiores tempos de deslocamento?**

Para responder a essa questão, estruturamos o desenvolvimento do projeto em quatro etapas principais:

#### 1. Modelagem Conceitual e Lógica

Definição das **entidades, atributos e relacionamentos** necessários para representar e organizar os dados da Pesquisa Origem e Destino.

#### 2. Modelagem Física e Implementação

Criação e estruturação das tabelas no **PostgreSQL**, incluindo a definição dos **tipos de dados, chaves primárias, chaves estrangeiras e relacionamentos** entre as tabelas.

Abaixo está o modelo entidade-relacionamento do banco de dados:  

![Modelo Entidade Relacionamento](Projeto%20Integrador%20-%20Garife/01-modelagem-er/engenharia-reversa-bd.png)

#### 3. Extração, Transformação e Carregamento (ETL)

Preparação, limpeza e transformação dos dados, adequando as informações à estrutura definida no modelo de banco de dados.

#### 4. Ingestão dos Dados

Importação dos arquivos **csv tratados** para suas respectivas tabelas no banco de dados PostgreSQL, tornando os dados disponíveis para consulta.


## Documentação do Banco de Dados
### Visão Geral das Tabelas
O banco de dados foi desenvolvido para armazenar e relacionar dados socioeconômicos e de mobilidade urbana da Região Metropolitana de São Paulo, permitindo a obtenção de informações sobre renda, população, viagens e padrões de deslocamento entre as zonas.

| Tabela                | Representa                 | Descrição                                                                                    |
| :-------------------- | :------------------------- | :------------------------------------------------------------------------------------------- |
| **zonas**             | Zonas territoriais         | Informações demográficas, domiciliares, de empregos e tempos médios de deslocamento por zona |
| **renda**             | Renda por zona             | Indicadores socioeconômicos de renda per capita e renda familiar por zona e ano              |
| **faixa_de_renda**    | Faixas de renda            | Categorias utilizadas para classificação das faixas de renda                                 |
| **pessoas_por_renda** | Pessoas por faixa de renda | Quantidade de pessoas pertencentes a cada faixa de renda por zona                            |
| **viagem**            | Viagens entre zonas        | Fluxos de viagens diárias entre zonas de origem e destino                                    |
| **categoria_tipo**    | Tipos de viagem            | Categorias utilizadas para classificar os tipos de viagem                                    |
| **quantidade_tipo**   | Viagens por tipo           | Quantidade de viagens produzidas e atraídas por zona e tipo de viagem                        |
| **categoria_modo**    | Modos de transporte        | Categorias dos modos de transporte utilizados nos deslocamentos                              |
| **quantidade_modo**   | Viagens por modo           | Quantidade de viagens produzidas e atraídas por zona e modo de transporte                    |
| **categoria_motivo**  | Motivos de viagem          | Categorias utilizadas para classificar os motivos dos deslocamentos                          |
| **quantidade_motivo** | Viagens por motivo         | Quantidade de viagens produzidas e atraídas por zona e motivo do deslocamento                |

---

## Dicionário de Dados

### `zonas`

| Atributo                      | Tipo      | Descrição                                                                |
| :---------------------------- | :-------- | :----------------------------------------------------------------------- |
| `id_zona`                     | `SERIAL`  | Identificador único da zona                                              |
| `nome_zona`                   | `VARCHAR` | Nome da zona                                                             |
| `domicilios_total`            | `INT`     | Total de domicílios existentes na zona                                   |
| `familias_total`              | `INT`     | Total de famílias residentes na zona                                     |
| `populacao_total`             | `INT`     | Total da população residente na zona                                     |
| `empregos_fora_da_residencia` | `INT`     | Quantidade de empregos localizados fora do domicílio                     |
| `empregos_na_residencia`      | `INT`     | Quantidade de empregos realizados no próprio domicílio                   |
| `empregos_sem_endereco_fixo`  | `INT`     | Quantidade de empregos sem endereço fixo                                 |
| `tempo_medio_coletivo`        | `INT`     | Tempo médio de deslocamento utilizando transporte coletivo, em minutos   |
| `tempo_medio_individual`      | `INT`     | Tempo médio de deslocamento utilizando transporte individual, em minutos |

### `renda`

| Atributo                 | Tipo     | Descrição                                |
| :----------------------- | :------- | :--------------------------------------- |
| `id_renda`               | `SERIAL` | Identificador único do registro de renda |
| `id_zona`                | `INT`    | Identificador da zona associada          |
| `ano`                    | `INT`    | Ano de referência dos dados              |
| `renda_per_capita`       | `INT`    | Renda per capita média da zona           |
| `renda_mediana_familiar` | `INT`    | Renda mediana das famílias da zona       |
| `renda_media_familiar`   | `INT`    | Renda média das famílias da zona         |

### `faixa_de_renda`

| Atributo    | Tipo      | Descrição                             |
| :---------- | :-------- | :------------------------------------ |
| `id_faixa`  | `SERIAL`  | Identificador único da faixa de renda |
| `descricao` | `VARCHAR` | Descrição da faixa de renda           |

### `pessoas_por_renda`

| Atributo             | Tipo  | Descrição                                                   |
| :------------------- | :---- | :---------------------------------------------------------- |
| `id_zona`            | `INT` | Identificador da zona associada                             |
| `id_faixa`           | `INT` | Identificador da faixa de renda                             |
| `quantidade_pessoas` | `INT` | Quantidade de pessoas pertencentes à faixa de renda na zona |

### `categoria_tipo`

| Atributo    | Tipo      | Descrição                                |
| :---------- | :-------- | :--------------------------------------- |
| `id_tipo`   | `SERIAL`  | Identificador único do tipo de viagem    |
| `descricao` | `VARCHAR` | Descrição do tipo ou categoria de viagem |

### `categoria_modo`

| Atributo    | Tipo      | Descrição                                 |
| :---------- | :-------- | :---------------------------------------- |
| `id_modo`   | `SERIAL`  | Identificador único do modo de transporte |
| `descricao` | `VARCHAR` | Descrição do modo de transporte utilizado |

### `categoria_motivo`

| Atributo    | Tipo      | Descrição                               |
| :---------- | :-------- | :-------------------------------------- |
| `id_motivo` | `SERIAL`  | Identificador único do motivo da viagem |
| `descricao` | `VARCHAR` | Descrição do motivo do deslocamento     |

### `viagem`

| Atributo                     | Tipo     | Descrição                                                                        |
| :--------------------------- | :------- | :------------------------------------------------------------------------------- |
| `id_viagem`                  | `SERIAL` | Identificador único do registro de viagem                                        |
| `id_origem`                  | `INT`    | Identificador da zona de origem                                                  |
| `id_destino`                 | `INT`    | Identificador da zona de destino                                                 |
| `quantidade_viagens_diarias` | `INT`    | Quantidade estimada de viagens realizadas diariamente entre a origem e o destino |
| `id_tipo`                    | `INT`    | Identificador do tipo de viagem                                                  |

### `quantidade_tipo`

| Atributo                        | Tipo  | Descrição                                                         |
| :------------------------------ | :---- | :---------------------------------------------------------------- |
| `id_zona`                       | `INT` | Identificador da zona                                             |
| `id_tipo`                       | `INT` | Identificador do tipo de viagem                                   |
| `quantidade_viagens_produzidas` | `INT` | Quantidade de viagens produzidas na zona para o tipo especificado |
| `quantidade_viagens_atraidas`   | `INT` | Quantidade de viagens atraídas pela zona para o tipo especificado |

### `quantidade_modo`

| Atributo                        | Tipo  | Descrição                                                       |
| :------------------------------ | :---- | :-------------------------------------------------------------- |
| `id_zona`                       | `INT` | Identificador da zona                                           |
| `id_modo`                       | `INT` | Identificador do modo de transporte                             |
| `quantidade_viagens_produzidas` | `INT` | Quantidade de viagens produzidas na zona pelo modo especificado |
| `quantidade_viagens_atraidas`   | `INT` | Quantidade de viagens atraídas pela zona pelo modo especificado |

### `quantidade_motivo`

| Atributo                                          | Tipo  | Descrição                                                                 |
| :------------------------------------------------ | :---- | :------------------------------------------------------------------------ |
| `id_zona`                                         | `INT` | Identificador da zona                                                     |
| `id_motivo`                                       | `INT` | Identificador do motivo do deslocamento                                   |
| `quantidade_viagens_produzidas`                   | `INT` | Quantidade de viagens produzidas na zona                                  |
| `quantidade_viagens_produzidas_motivo_no_destino` | `INT` | Quantidade de viagens produzidas na zona considerando o motivo no destino |
| `quantidade_viagens_atraidas`                     | `INT` | Quantidade de viagens atraídas pela zona                                  |
| `quantidade_viagens_atraidas_motivo_no_destino`   | `INT` | Quantidade de viagens atraídas pela zona considerando o motivo no destino |

----------------

## Como Instalar e Rodar o Projeto
### Pré-requisitos:

Para executar o projeto, é necessário:
#### 1. Instalar o PostgreSQL
Instale o [PostgreSQL](https://www.postgresql.org/download/), que será responsável pelo armazenamento e gerenciamento do banco de dados.

### 2. Clonar o repositório

Abra o terminal e execute:

```bash
git clone https://github.com/bariany/bd-desigualdade-no-transporte-spe.git
```

Depois, entre na pasta do projeto:

```bash
cd bd-desigualdade-no-transporte-spe
```

### 3. Criar o banco de dados

Abra o **pgAdmin 4** e conecte-se ao servidor PostgreSQL.

Crie um novo banco de dados para o projeto. Por exemplo:

```sql
CREATE DATABASE bd-desigualdade-no-transporte-sp;
```

Após a criação, conecte-se ao banco pelo pgAdmin 4.

### 4. Criar as tabelas

Execute os scripts SQL disponíveis no repositório para criar a estrutura do banco de dados.

Os scripts são responsáveis pela criação das tabelas, chaves e relacionamentos definidos durante a etapa de modelagem física.

> **Observação:** execute primeiro os scripts responsáveis pela criação das tabelas principais e, posteriormente, os scripts que dependem dessas estruturas.

### 5. Importar os dados

Após criar as tabelas, importe os arquivos **csv tratados** para suas respectivas tabelas no PostgreSQL.

Os dados utilizados no projeto passaram por uma etapa de **ETL**, envolvendo preparação, organização e transformação das informações antes da ingestão no banco.

A importação pode ser realizada pelo próprio **pgAdmin 4**, utilizando a opção de importação de dados da tabela.

### 6. Executar as consultas SQL

Com as tabelas criadas e os dados importados, as consultas SQL podem ser executadas pelo **Query Tool** do pgAdmin 4.

As consultas permitem analisar informações relacionadas a:

* renda;
* população;
* zonas territoriais;
* tempo médio de deslocamento;
* quantidade de viagens;
* modos de transporte;
* motivos das viagens;
* tipos de viagem.

### Fluxo de execução

O fluxo recomendado para executar o projeto é:

```text
PostgreSQL
    ↓
Criação do banco de dados
    ↓
Criação das tabelas
    ↓
Importação dos csv tratados
    ↓
Execução das consultas SQL
    ↓
Análise dos resultados
```

---

## Estrutura de Pastas do Repositório

A organização do repositório separa os arquivos utilizados nas diferentes etapas do projeto, facilitando a localização dos dados, scripts e documentação.

```text
bd-desigualdade-no-transporte-spe/
│
├── dados/
│   ├── brutos/
│   └── tratados/
│
├── etl/
│
├── sql/
│
├── README.md
│
└── ...
```

> A estrutura apresentada deve ser ajustada caso novas pastas ou arquivos sejam adicionados ao projeto.

## Equipe    
- [bariany](https://github.com/bariany) 
- [gaby001100](https://github.com/gaby001100)
- [lfsantosnunescomercial-Cremo](https://github.com/lfsantosnunescomercial-Cremo)

## Referências
- [Pesquisa Origem e Destino 2023 do Metro SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/)
- [Documentação oficial do PostgreSQL]( https://www.postgresql.org/docs/)

## Licença  
Este projeto foi desenvolvido para fins acadêmicos e educacionais.  
 
