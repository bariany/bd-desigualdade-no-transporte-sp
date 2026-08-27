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



## Dicionário de Dados
#### `zonas`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_zona` | `SERIAL` | Identificador único da zona |
| `nome_zona` | `VARCHAR` | Nome da zona |
| `domicilios_total` | `INT` | Total de domicílios |
| `familias_total` | `INT` | Total de famílias |
| `populacao_total` | `INT` | Total da população residente |
| `empregos_fora_da_residencia` | `INT` | Vagas ocupadas fora do domicílio |
| `empregos_na_residencia` | `INT` | Vagas ocupadas no próprio domicílio |
| `empregos_sem_endereco_fixo` | `INT` | Vagas sem endereço fixo |
| `tempo_medio_coletivo` | `INT` | Tempo médio de deslocamento coletivo (min) |
| `tempo_medio_individual` | `INT` | Tempo médio de deslocamento individual (min) |

#### `renda`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_renda` | `SERIAL` | Identificador único do registro de renda |
| `id_zona` | `INT` | Identificador da zona associada |
| `ano` | `INT` | Ano de referência dos dados |
| `renda_per_capita` | `INT` | Renda per capita média da zona |
| `renda_mediana_familiar` | `INT` | Renda mediana das famílias |
| `renda_media_familiar` | `INT` | Renda média das famílias |

#### `faixa_de_renda`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_faixa` | `SERIAL` | Identificador único da faixa de renda |
| `descricao` | `VARCHAR` | Descrição textual da faixa de renda |

#### `pessoas_por_renda`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_zona` | `INT` | Identificador da zona associada |
| `id_faixa` | `INT` | Identificador da faixa de renda |
| `quantidade_pessoas` | `INT` | Quantidade de indivíduos pertencentes à faixa na zona |

#### `categoria_tipo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_tipo` | `SERIAL` | Identificador único do tipo de viagem |
| `descricao` | `VARCHAR` | Descrição da categoria/tipo de viagem |

#### `categoria_modo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_modo` | `SERIAL` | Identificador único do modo de transporte |
| `descricao` | `VARCHAR` | Descrição do modal de transporte |

#### `categoria_motivo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_motivo` | `SERIAL` | Identificador único do motivo do deslocamento |
| `descricao` | `VARCHAR` | Descrição do motivo |

#### `viagem`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_viagem` | `SERIAL` | Identificador único da viagem |
| `id_origem` | `INT` | Identificador da zona de origem |
| `id_destino` | `INT` | Identificador da zona de destino |
| `quantidade_viagens_diarias` | `INT` | Volume diário de viagens entre origem e destino |
| `id_tipo` | `INT` | Identificador do tipo de viagem |

#### `quantidade_tipo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_zona` | `INT` | Identificador da zona |
| `id_tipo` | `INT` | Identificador do tipo de viagem |
| `quantidade_viagens_produzidas` | `INT` | Volume de viagens produzidas na zona |
| `quantidade_viagens_atraidas` | `INT` | Volume de viagens atraídas para a zona |

#### `quantidade_modo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_zona` | `INT` | Identificador da zona |
| `id_modo` | `INT` | Identificador do modo de transporte |
| `quantidade_viagens_produzidas` | `INT` | Volume de viagens produzidas na zona pelo modal |
| `quantidade_viagens_atraidas` | `INT` | Volume de viagens atraídas para a zona pelo modal |

#### `quantidade_motivo`
| Atributo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_zona` | `INT` | Identificador da zona |
| `id_motivo` | `INT` | Identificador do motivo do deslocamento |
| `quantidade_viagens_produzidas` | `INT` | Volume de viagens produzidas na zona |
| `quantidade_viagens_produzidas_motivo_no_destino` | `INT` | Viagens produzidas considerando motivo no destino |
| `quantidade_viagens_atraidas` | `INT` | Volume de viagens atraídas para a zona |
| `quantidade_viagens_atraidas_motivo_no_destino` | `INT` | Viagens atraídas considerando motivo no destino |

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
 
