## Desigualdade Social no Transporte Urbano

Este projeto propõe a criação e estruturação de um banco de dados relacional utilizando dados da [Pesquisa Origem e Destino 2023 do Metro SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/). O principal objetivo é mostrar como a Engenharia de Dados e a linguagem SQL podem apoiar a tomada de decisão na gestão da mobilidade urbana, produzindo informações que auxiliem na compreensão da desigualdade social no transporte urbano. 

## Status do Projeto
Em desenvolvimento. 

## Documentação do Banco de Dados
### Visão geral das entidades existentes
| Tabela | Representa | Descrição |
|---------|------------|-----------|
| **zona** | Zonas de origem e destino | Zonas de origem e destino da pesquisa |
| **viagem** | Viagens feitas por zona | Registros das viagens entre as zonas de origem e destino |
| **renda** | Renda por zona | Informações de renda associadas às zonas |

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
| **Git** | Controle de versão do projeto |
| **GitHub** | Hospedagem do repositório, versionamento dos scripts SQL e documentação do projeto |

## Ciclo de Desenvolvimento
Partindo do seguinte questionamento: Trabalhadores de baixa renda gastam o dobro do tempo em deslocamento que os de alta renda em SP. Quais distritos têm os maiores tempos?
Iniciamos nosso processo da seguinte maneira:

1. Modelagem conceitual e logica
2. Modelagem fisica e implemetação
3. Extração, transformação e carregamento
4. Ingestão dos dados (importação em csv)


## Como Instalar e Rodar o Projeto
Pré-requisitos: 
Passo a passo de configuração:

## Estrutura de Pastas do Repositório
 Uma árvore simples mostrando onde estão os dados brutos, os scripts de ETL, as queries SQL e os relatórios/gráficos gerados.

## Equipe    
- [bariany](https://github.com/bariany) 
- [gaby001100](https://github.com/gaby001100)
- [lfsantosnunescomercial-Cremo](https://github.com/lfsantosnunescomercial-Cremo)

## Referências
- [Pesquisa Origem e Destino 2023 do Metro SP](https://www.metro.sp.gov.br/pt_BR/pesquisa-od/)
- [Documentação oficial]

## Licença  
Este projeto foi desenvolvido para fins acadêmicos e educacionais.  
 
