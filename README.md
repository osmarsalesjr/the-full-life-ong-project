# ONG Vida Plena - Repositório de Artefatos

## Visão Geral

Este repositório reúne os artefatos, diagramas, documentação e recursos utilizados no desenvolvimento e manutenção da plataforma de gestão da ONG Vida Plena.

A solução foi construída utilizando ferramentas No-Code/Low-Code com o objetivo de gerenciar beneficiários, eventos, inscrições e participação em atividades promovidas pela ONG.

Arquitetura da solução:

```text
Softr
  ↓
Airtable
  ↓
Make
  ↓
Gmail
```

---

## Componentes da Solução

### Airtable

Responsável pelo armazenamento dos dados e automações simples da plataforma.

**Acesso:**

[LINK DE LEITURA AIRTABLE](https://airtable.com/invite/l?inviteId=invry90dCb2CHp4gl&inviteToken=9a67db15fd9144072153c31a73ceed57e21287b9400f1cbd17b6ec733c0976e2&utm_medium=email&utm_source=product_team&utm_content=transactional-alerts)


### Softr

Responsável pela interface web utilizada pelos colaboradores da ONG.

**Portal:**

[LINK DO PORTAL](https://projeto-ong-vida-plena.softr.app)

### Make

Responsável pelas automações da solução, incluindo validação de capacidade dos eventos e envio de notificações por e-mail.

**Workspace:**

[LINK DO MAKE](https://us2.make.com/public/shared-scenario/T4H7XELEMAd/the-full-life-ong-update-registration-if-there)
[BLUEPRINT DO CENÁRIO](./documentacao/TheFullLifeOng_UpdateRegistrationIfTheresCapacity.blueprint.json)

### Gmail

Utilizado para envio automático de notificações aos beneficiários através das automações do Make.

---

## Principais Funcionalidades

* Gestão de usuários;
* Gestão de regiões;
* Gestão de beneficiários;
* Gestão de eventos;
* Controle de inscrições;
* Controle de presença;
* Notificações automáticas por e-mail;
* Validação automática de vagas em eventos.

---

## Documentação Disponível

Este repositório deve conter:

* Documentação Técnica;
* Resumo Técnico;
* Diagrama Conceitual;
* Diagrama de Classes;
* Modelo Entidade-Relacionamento (ER);
* Blueprints dos cenários do Make;
* Materiais complementares do projeto.

---

## Manutenção

Sempre que houver alterações na estrutura de dados, automações ou interface da aplicação, a documentação e os artefatos deste repositório devem ser atualizados para manter a consistência da solução.
