## Desigualdade Social no Transporte Urbano

A cidade de São Paulo é marcada por uma profunda disparidade territorial, onde o CEP de um cidadão determina diretamente o tempo que lhe resta no dia. Enquanto os moradores das regiões centrais usufruem de deslocamentos rápidos, as populações periféricas enfrentam rotinas exaustivas no transporte público, um fenômeno conhecido como "pobreza de tempo" que limita o acesso a oportunidades, estudo e lazer. Para formular soluções que combatam essa segregação urbana, o planejamento público não pode se basear em suposições; ele precisa ser fundamentado em evidências concretas e na organização inteligente de informações sobre o território.

## Proposta
Este projeto propõe a criação e estruturação de um banco de dados relacional utilizando dados da [Pesquisa Origem e Destino 2023 do Metro SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/). O principal objetivo é mostrar como a Engenharia de Dados e a linguagem SQL podem apoiar a tomada de decisão na gestão da mobilidade urbana, produzindo informações que auxiliem na compreensão da desigualdade social no transporte urbano. 

## Status 
Em desenvolvimento. 

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

#### 3. Extração, Transformação e Carregamento (ETL)

Preparação, limpeza e transformação dos dados, adequando as informações à estrutura definida no modelo de banco de dados.

#### 4. Ingestão dos Dados

Importação dos arquivos **csv tratados** para suas respectivas tabelas no banco de dados PostgreSQL, tornando os dados disponíveis para consulta.


## Documentação do Banco de Dados
### Visão geral das entidades existentes

| Tabela | Representa | Descrição |
| :--- | :--- | :--- |
| **zonas** | Zonas territoriais | Dados demográficos, domicílios, empregos e tempos médios de deslocamento |
| **renda** | Renda por zona | Indicadores socioeconômicos de renda per capita e familiar por zona e ano |
| **faixa_de_renda** | Classificação de renda | Categorias e estratos de faixas de renda |
| **pessoas_por_renda** | Distribuição de pessoas por faixa | Quantidade de pessoas em cada faixa de renda por zona |
| **viagem** | Matriz origem-destino de viagens | Fluxos de viagens diárias realizadas entre as zonas de origem e destino |
| **categoria_tipo** | Tipos de viagem | Classificação das categorias/tipos de viagem |
| **quantidade_tipo** | Agregado de viagens por tipo | Totais de viagens produzidas e atraídas agrupadas por tipo e zona |
| **categoria_modo** | Modos de transporte | Modais de transporte utilizados nos deslocamentos (ex.: coletivo, individual, a pé) |
| **quantidade_modo** | Agregado de viagens por modal | Totais de viagens produzidas e atraídas agrupadas por modal de transporte e zona |
| **categoria_motivo** | Motivos de deslocamento | Finalidades das viagens realizadas (ex.: trabalho, estudo, saúde) |
| **quantidade_motivo** | Agregado de viagens por motivo | Totais de viagens produzidas e relação origem-destino por motivo e zona |

### Dicionário de Dados
#### Tabela: `zona`
| Atributo | Tipo | Descrição |
|-----------|------|-----------|
| **id_zona** | INT | Identificador único da zona |
| **nome_zona** | VARCHAR | Nome da zona |
| **domicilio_total** | INT | Quantidade de domicílios |
| **familia_total** | INT | Quantidade de famílias |
| **populacao_total** | INT | População estimada |
| **empregos_internos** | INT | Empregos localizados na zona |
| **automoveis_particulares** | INT | Frota em posse das famílias |
| **emprego_total** | INT | Empregos totais localizados na zona |

#### Tabela: `renda`
| Atributo | Tipo | Descrição |
|-----------|------|-----------|
| **id_renda** | INT | Identificador único da renda |
| **ano** | INT | Ano da pesquisa |
| **renda_per_capita** | DECIMAL | Média de renda por pessoa na zona |
| **renda_mediana_familiar** | DECIMAL | Valor central da renda familiar na zona |
| **renda_media_familiar** | DECIMAL | Média da renda familiar na zona |
| **percentual_baixa_renda** | DECIMAL | Percentual da população em situação de baixa renda na zona |
| **percentual_alta_renda** | DECIMAL | Percentual da população em situação de alta renda na zona |

#### Tabela: `viagem`
| Atributo | Tipo | Descrição |
|-----------|------|-----------|
| **id_indicador_viagem** | INT | Identificador único do indicador de viagem |
| **ano** | INT | Ano da pesquisa |
| **total_viagens_produzidas** | INT | Quantidade total de viagens com origem na zona |
| **total_viagens_atraidas** | INT | Quantidade total de viagens com destino na zona |
| **tempo_medio_coletivo** | TIME | Tempo médio das viagens realizadas por transporte coletivo na zona de origem |
| **tempo_medio_individual** | TIME | Tempo médio das viagens realizadas por transporte individual na zona de origem |
| **modo_viagem** | VARCHAR | Tipo de transporte utilizado na viagem |

## Como Instalar e Rodar o Projeto
Pré-requisitos:

Para executar o projeto, é necessário:
#### 1. Instalar o PostgreSQL
Instale o [PostgreSQL](https://www.postgresql.org/download/), que será responsável pelo armazenamento e gerenciamento do banco de dados.


## Estrutura de Pastas do Repositório
Uma árvore simples mostrando onde estão os dados brutos, os scripts de ETL, as queries SQL e os relatórios/gráficos gerados.

## Equipe    
- [bariany](https://github.com/bariany) 
- [gaby001100](https://github.com/gaby001100)
- [lfsantosnunescomercial-Cremo](https://github.com/lfsantosnunescomercial-Cremo)

## Referências
- [Pesquisa Origem e Destino 2023 do Metro SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/)
- [Documentação oficial do PostgreSQL]( https://www.postgresql.org/docs/)

## Licença  
Este projeto foi desenvolvido para fins acadêmicos e educacionais.  
 
