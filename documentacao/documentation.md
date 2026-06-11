# DOCUMENTAÇÃO TÉCNICA

# ONG VIDA PLENA – SISTEMA DE GESTÃO DE BENEFICIÁRIOS E EVENTOS

---

# 1. INTRODUÇÃO

## 1.1 Sobre a ONG Vida Plena

A ONG Vida Plena atua há mais de 10 anos em comunidades periféricas da Grande São Paulo, desenvolvendo iniciativas voltadas à inclusão social, capacitação profissional, promoção da saúde e inclusão digital.

Ao longo de sua trajetória, a organização realizou centenas de eventos, oficinas, cursos e campanhas, beneficiando milhares de pessoas em situação de vulnerabilidade social.

O crescimento contínuo das atividades trouxe novos desafios relacionados ao controle de informações, gestão dos participantes e acompanhamento dos resultados alcançados pelos projetos desenvolvidos pela instituição.

Com o objetivo de profissionalizar sua operação e aumentar sua capacidade de atendimento, a ONG Vida Plena obteve uma verba de apoio técnico destinada à modernização de seus processos internos por meio da implantação de uma solução digital de gestão.

---

## 1.2 Problema de Negócio

Antes da implantação deste sistema, grande parte dos processos da ONG era realizada manualmente através de:

* Planilhas eletrônicas;
* Formulários dispersos;
* Grupos de WhatsApp;
* Troca de mensagens entre colaboradores.

Essa abordagem ocasionava diversos problemas operacionais, entre eles:

* Cadastros duplicados de beneficiários;
* Perda de histórico de participação;
* Dificuldade para localizar informações;
* Falta de controle sobre vagas disponíveis em eventos;
* Ausência de indicadores gerenciais;
* Processos manuais suscetíveis a erros;
* Dependência excessiva da comunicação informal.

Além disso, a ONG não possuía profissionais especializados em desenvolvimento de software, tornando inviável a construção e manutenção de uma aplicação tradicional baseada em programação.

Diante desse cenário, optou-se pela construção de uma solução baseada em ferramentas No-Code e Low-Code, permitindo que a própria equipe administrativa consiga operar e evoluir o sistema sem necessidade de conhecimento técnico avançado.

---

# 2. OBJETIVOS DO PROJETO

O projeto tem como objetivo principal centralizar e organizar todas as informações relacionadas às atividades da ONG Vida Plena.

Entre os objetivos específicos estão:

* Centralizar o cadastro de beneficiários;
* Centralizar o cadastro de eventos;
* Controlar inscrições e participação em eventos;
* Eliminar cadastros duplicados;
* Automatizar processos operacionais;
* Reduzir erros manuais;
* Melhorar a rastreabilidade das informações;
* Facilitar a geração de relatórios e indicadores;
* Disponibilizar uma interface simples para utilização pelos colaboradores.

---

# 3. PROCESSO DE MODELAGEM

Durante o desenvolvimento da solução foram produzidos diversos artefatos de modelagem para garantir consistência entre regras de negócio, estrutura de dados e implementação.

---

## 3.1 Diagrama Conceitual

[INSERIR IMAGEM DO DIAGRAMA CONCEITUAL]

Descrição:

O diagrama conceitual apresenta as principais entidades envolvidas no domínio do problema e seus relacionamentos, sem preocupação com detalhes técnicos de implementação.

Principais entidades:

* Usuários
* Regiões
* Beneficiários
* Eventos
* Inscrições

---

## 3.2 Diagrama de Classes

[INSERIR IMAGEM DO DIAGRAMA DE CLASSES]

Descrição:

O diagrama de classes representa os objetos do sistema, seus atributos, relacionamentos e comportamentos previstos durante a fase de modelagem.

---

## 3.3 Modelo Entidade-Relacionamento (ER)

[INSERIR IMAGEM DO DIAGRAMA ER]

Descrição:

O modelo ER representa a estrutura lógica dos dados armazenados na solução, incluindo:

* Chaves primárias;
* Relacionamentos;
* Cardinalidades;
* Integridade referencial.

---

# 4. ARQUITETURA DA SOLUÇÃO

A solução foi construída utilizando uma arquitetura No-Code composta por múltiplas plataformas especializadas.

Fluxo geral:

Colaborador
↓
Softr
↓
Airtable
↓
Make
↓
Serviços Externos (Gmail)

---

# 5. TECNOLOGIAS UTILIZADAS

## 5.1 Airtable

### Finalidade

Banco de dados principal da aplicação.

### Motivos da escolha

* Interface amigável;
* Facilidade de modelagem;
* Relacionamentos entre tabelas;
* Baixa curva de aprendizado;
* Fácil manutenção pela equipe da ONG.

### Responsabilidades

* Armazenamento dos dados;
* Relacionamentos entre entidades;
* Controle de permissões;
* Algumas automações simples.

---

## 5.2 Softr

### Finalidade

Interface web da aplicação.

### Motivos da escolha

O sistema possui foco em gestão interna, sendo utilizado exclusivamente por colaboradores da ONG.

Por esse motivo era necessário possuir:

* Autenticação funcional;
* Interface amigável;
* Integração nativa com Airtable;
* Facilidade de manutenção.

O Softr atendeu esses requisitos com menor complexidade operacional.

### Responsabilidades

* Login de usuários;
* Navegação da aplicação;
* Formulários de cadastro;
* Listagens e consultas;
* Experiência do usuário.

---

## 5.3 Make

### Finalidade

Execução de automações avançadas.

### Motivos da escolha

Embora o Airtable possua automações nativas, algumas regras de negócio exigem maior capacidade de processamento e tomada de decisão.

O Make foi utilizado para implementar fluxos mais complexos.

### Exemplo

Validação automática de vagas em eventos.

Regra:

Se vagas disponíveis > 0
→ CONFIRMED

Caso contrário
→ WAITING_LIST

Essa lógica exige consultas adicionais e processamento que ultrapassam as capacidades das automações nativas do Airtable.

---

## 5.4 Gmail

### Finalidade

Envio de notificações aos beneficiários.

### Exemplos

* Confirmação de inscrição;
* Inclusão em lista de espera;
* Comunicações futuras.

---

# 6. MODELO DE DADOS

## Usuários

Responsáveis pela operação do sistema.

Perfis:

* ADMINISTRATOR
* COORDINATOR
* OPERATOR

Status:

* ACTIVE
* INACTIVE
* BLOCKED

---

## Regiões

Representam a divisão geográfica utilizada pela ONG.

Registros padrão:

* CENTRO-OESTE
* NORDESTE
* NORTE
* SUDESTE
* SUL

---

## Beneficiários

Representam as pessoas atendidas pela ONG.

Informações principais:

* Nome
* Data de nascimento
* Telefone
* E-mail
* Região
* Status

Status:

* ACTIVE
* INACTIVE
* BLOCKED

---

## Eventos

Representam atividades promovidas pela ONG.

Informações principais:

* Título
* Descrição
* Data e horário
* Local
* Capacidade
* Status

Status:

* DRAFT
* PLANNED
* PUBLISHED
* IN_PROGRESS
* FINISHED
* CANCELED
* ARCHIVED

---

## Inscrições

Representam a participação de beneficiários em eventos.

Status:

* WAITING_LIST
* CONFIRMED
* PRESENT
* CANCELED
* ABSENT

---

# 7. RESTRIÇÕES DE NEGÓCIO

## Usuários

Somente usuários com status ACTIVE podem acessar o sistema.

Usuários INACTIVE ou BLOCKED não possuem acesso.

---

## Administração

Somente usuários com perfil ADMINISTRATOR podem:

* Criar usuários;
* Editar usuários;
* Promover novos administradores.

---

## Beneficiários

Somente beneficiários ACTIVE podem realizar inscrições.

---

## Eventos

Não é permitido realizar inscrições em eventos:

* FINISHED;
* CANCELED;
* ARCHIVED.

---

## Inscrições

Toda inscrição nasce inicialmente com:

WAITING_LIST

---

# 8. AUTOMAÇÕES IMPLEMENTADAS

## 8.1 Controle Automático de Capacidade

Ferramenta:

Make

Objetivo:

Garantir que o número de participantes confirmados não ultrapasse a capacidade do evento.

Fluxo:

Nova Inscrição
↓
Consultar Evento
↓
Verificar Capacidade
↓
Atualizar Status

Resultado:

* CONFIRMED
* WAITING_LIST

---

## 8.2 Notificação por E-mail

Ferramenta:

Make + Gmail

Objetivo:

Notificar automaticamente o beneficiário após sua inscrição.

Fluxo:

Nova Inscrição
↓
Consultar Beneficiário
↓
Consultar Evento
↓
Enviar E-mail

---

## 8.3 Controle de Presença

Ferramenta:

Airtable Automation

Objetivo:

Atualizar automaticamente o status da inscrição quando a presença for confirmada.

Regra:

Se:

Attendance = TRUE

E

Status = CONFIRMED

Então:

Status = PRESENT

Motivo da implementação no Airtable:

Trata-se de uma lógica simples baseada em uma única condição, não exigindo o uso do Make.

---

# 9. FLUXOS OPERACIONAIS

## Cadastro de Beneficiário

Operador
↓
Cadastro
↓
Beneficiário Ativo

---

## Inscrição em Evento

Beneficiário
↓
Solicita inscrição
↓
WAITING_LIST
↓
Validação automática
↓
CONFIRMED ou WAITING_LIST

---

## Participação em Evento

CONFIRMED
↓
Presença registrada
↓
PRESENT

---

# 10. POSSÍVEIS MELHORIAS FUTURAS

Entre as evoluções previstas para a plataforma destacam-se:

## Portal do Beneficiário

Permitir que os próprios beneficiários:

* Consultem eventos;
* Realizem inscrições;
* Acompanhem histórico;
* Atualizem seus dados cadastrais.

---

## Dashboard Gerencial

Painéis com indicadores como:

* Beneficiários por região;
* Eventos realizados;
* Taxa de comparecimento;
* Participação por período;
* Eventos mais populares.

---

## Lista de Espera Inteligente

Promoção automática de beneficiários da WAITING_LIST quando houver cancelamentos.

---

## Certificados

Geração automática de certificados de participação.

---

## Comunicação Automatizada

Envio de:

* Lembretes de eventos;
* Pesquisas de satisfação;
* Comunicados institucionais.

---

## Relatórios

Exportação de relatórios operacionais e gerenciais em PDF e Excel.

---

# 11. CONSIDERAÇÕES FINAIS

A implantação da plataforma representa um importante passo na transformação digital da ONG Vida Plena.

A adoção de ferramentas No-Code permitiu construir uma solução robusta, acessível e sustentável, alinhada à realidade operacional da instituição e à disponibilidade de recursos técnicos da equipe.

Além de resolver problemas históricos relacionados à organização das informações, a nova solução estabelece uma base sólida para crescimento futuro, possibilitando a expansão dos serviços oferecidos pela ONG e a melhoria contínua do acompanhamento dos beneficiários atendidos.

A arquitetura escolhida prioriza simplicidade, baixo custo de manutenção e facilidade de evolução, garantindo que a ONG continue focada em sua missão social enquanto utiliza a tecnologia como ferramenta de apoio à gestão e tomada de decisão.
