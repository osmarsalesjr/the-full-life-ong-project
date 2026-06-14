# Resumo Técnico – Sistema de Gestão da ONG Vida Plena

## Introdução

A ONG Vida Plena atua há mais de 10 anos em comunidades periféricas da Grande São Paulo, promovendo ações de inclusão digital, capacitação profissional e campanhas de saúde. Com o crescimento das atividades, surgiram dificuldades relacionadas ao controle de beneficiários, eventos e histórico de participação.

A solução traz uma plataforma de gestão interna baseada em ferramentas No-Code, permitindo que a própria equipe da ONG possa administrar e evoluir o sistema sem necessidade de programação.

---

## Levantamento de Requisitos

O levantamento de requisitos foi realizado a partir da análise dos processos operacionais da ONG e dos principais problemas enfrentados pela equipe.

Foram identificadas necessidades relacionadas ao controle de beneficiários, gerenciamento de eventos, controle de inscrições, registro de presença e automação de atividades administrativas. A partir disso, foram definidos os módulos do sistema, as regras de negócio e os fluxos operacionais da solução.

---

## Raciocínio por Trás da Modelagem do Banco Visual

A modelagem foi construída considerando os principais elementos do negócio e seus relacionamentos.

O beneficiário foi definido como a entidade central do sistema, pois representa a pessoa atendida pela ONG. Os eventos representam as atividades promovidas pela instituição, enquanto as inscrições registram a participação dos beneficiários nos eventos.

Também foram criadas entidades específicas para usuários e regiões, permitindo controlar o acesso à plataforma e organizar os beneficiários de acordo com sua localização geográfica.

---

## Justificativas para a Escolha das Ferramentas

### Airtable

Utilizado como banco de dados visual da aplicação. Foi escolhido pela facilidade de modelagem, interface amigável, suporte a relacionamentos entre tabelas e facilidade de manutenção por usuários sem conhecimento técnico.

### Softr

Utilizado para construção da interface web. Foi escolhido pela integração nativa com Airtable, facilidade de configuração e suporte a autenticação de usuários sem necessidade de desenvolvimento de código.

### Make

Responsável pelas automações mais complexas da solução. Foi utilizado principalmente para implementar regras de negócio que exigem consultas, validações e atualizações em múltiplas entidades.

Um exemplo é a validação automática de vagas em eventos, onde o sistema verifica a capacidade disponível antes de confirmar uma inscrição.

### Gmail

Utilizado para envio automático de notificações aos beneficiários após a realização de inscrições e futuras comunicações da ONG.

---

## Estrutura Relacional

A solução foi organizada em cinco entidades principais.

### User

Representa os colaboradores da ONG.

**Atributos:** nome, e-mail, perfil e status.

### Region

Representa as regiões geográficas utilizadas para classificação dos beneficiários.

**Atributos:** nome da região.

### Beneficiary

Representa as pessoas atendidas pela ONG.

**Atributos:** cpf, nome, e-mail, telefone, data de nascimento e status.

Relacionamento: pertence a uma região.

### Event

Representa os eventos promovidos pela instituição.

**Atributos:** título, descrição, data e horário, local, capacidade e status.

### Registration

Representa a inscrição de um beneficiário em um evento.

**Atributos:** beneficiário, evento, status da inscrição e presença.

Relacionamento: materializa o relacionamento muitos-para-muitos entre beneficiários e eventos.

---

## Regras de Negócio Implementadas

As principais regras implementadas no sistema são:

* Apenas usuários com status ACTIVE podem acessar a plataforma;
* Apenas administradores podem criar ou editar outros administradores;
* Apenas beneficiários ativos podem ser inscritos em eventos;
* Não é permitido realizar inscrições em eventos cancelados, finalizados ou arquivados;
* Toda inscrição é criada inicialmente com status WAITING_LIST;
* O sistema verifica automaticamente a capacidade do evento antes de confirmar uma inscrição;
* Quando a presença é registrada em uma inscrição confirmada, seu status é atualizado automaticamente para PRESENT.

---

## Automações Implementadas

### Controle Automático de Capacidade

Implementado no Make.

Quando uma inscrição é criada, o sistema consulta a capacidade do evento e a quantidade de participantes confirmados. Caso existam vagas disponíveis, a inscrição é atualizada para CONFIRMED. Caso contrário, permanece em WAITING_LIST.

### Notificação por E-mail

Implementada utilizando Make e Gmail.

Após a criação da inscrição, o sistema recupera as informações do beneficiário e do evento e envia automaticamente uma notificação por e-mail.

### Controle de Presença

Implementado por meio das automações nativas do Airtable.

Quando o campo de presença é marcado e a inscrição está confirmada, o sistema atualiza automaticamente seu status para PRESENT.

---

## Ética e Segurança da Informação

A solução foi desenvolvida considerando princípios de segurança e privacidade das informações.

O acesso ao sistema é restrito a usuários autorizados e somente usuários ativos podem autenticar-se na plataforma. Além disso, determinadas operações administrativas são limitadas a perfis específicos, reduzindo riscos de alterações indevidas.

Sob a perspectiva ética, a plataforma foi projetada para garantir simplicidade de uso, transparência e proteção dos dados dos beneficiários, contribuindo para uma gestão mais confiável e organizada das informações da ONG.

---

## Conclusão

A implementação da plataforma permitiu substituir processos manuais por uma solução centralizada, organizada e de fácil manutenção. A combinação de Airtable, Softr, Make e Gmail proporcionou uma arquitetura compatível com a realidade da ONG, possibilitando maior controle sobre beneficiários, eventos e inscrições, além da automação de atividades operacionais.

Como resultado, a organização passou a contar com informações mais confiáveis, processos mais eficientes e uma base tecnológica capaz de apoiar futuras evoluções e ampliar o impacto de suas ações sociais.
