![repo](https://github.com/Grupo-Energia/sr-web-dev-technical-test/assets/162369419/10a6a72b-0bf4-42ce-bee0-31ebe7a368f5)


# Teste Técnico para Desenvolvedor Fullstack - Grupo Energia

## Objetivo:
Desenvolver uma aplicação de gerenciamento de frotas com foco em automações.

## Prazo para entrega sugerido para o projeto:
10 ~ 15 dias

## Descrição do Projeto:
O candidato deve criar uma aplicação web utilizando React.js para o frontend e Node.js para o backend. A aplicação deve gerenciar uma frota de veículos, fornecendo funcionalidades de automação para melhorar a eficiência e a manutenção dos veículos. Para o frontend, pode ser utilizado qualquer framework ou biblioteca adicional que o candidato desejar (como Next.js, Remix, Waku ou Solid). Para o backend, o candidato pode utilizar qualquer banco de dados relacional de sua escolha (como PostgreSQL, MySQL, MariaDB ou CockroachDB) e pode utilizar qualquer framework ou biblioteca adicional que desejar (como Nest.js, Express.js, Fastify ou Hono).

## Requisitos:
- **Cadastro, edição e exclusão de veículos (CRUD).**
- **Visualização da lista de veículos com informações detalhadas (modelo, ano, placa, etc.).**
- **Implementar um sistema de notificações para alertar sobre eventos importantes (manutenção, troca de pneus, etc.). _(Obs: Isso pode ser feito apenas dentro do sistema, com um componente de notificação (como um "sino") na interface)_.**
- **Implementar automações que auxiliem na gestão da frota (descrições abaixo).**

### Automação 1 - Previsão de Desgaste dos Pneus:
Implementar uma funcionalidade que preveja o desgaste dos pneus com base na quilometragem percorrida. O sistema deve enviar notificações quando for necessário realizar a troca dos pneus.

### Automação 2 - Manutenção Preventiva:
Implementar uma automação que gere lembretes de manutenção preventiva (troca de óleo, revisões gerais) com base na quilometragem e no tempo de uso do veículo. O sistema deve enviar notificações automáticas para os responsáveis pelos veículos.

### Automação 3 - Análise de Custo-Benefício:
Implementar uma funcionalidade que analise dados históricos de compra e manutenção para calcular o melhor custo-benefício dos produtos e serviços adquiridos (pneus, óleo, peças, etc.). O sistema deve recomendar as melhores opções com base em desempenho e custo.

## Diferenciais/Bônus:
- Criar testes automatizados para a aplicação;
- Implementar um sistema de autenticação e autorização de usuários;
- Permitir a exportação desses relatórios em formatos comuns, como PDF e Excel;
- Criar uma interface de usuário amigável e responsiva, com navegação intuitiva.
- Realizar o deploy da aplicação em um servidor de sua escolha.

## Critérios de Avaliação:
- Qualidade e organização do código;
- Uso adequado de boas práticas de desenvolvimento;
- Capacidade de implementar as funcionalidades solicitadas;
- Criatividade na implementação das automações;
- Intuitividade e facilidade de uso da aplicação.


# Informações extras
- Nesse repositório você também pode encontrar um arquivo chamado `suggested_schema.sql` com a estrutura do banco de dados que você pode utilizar para o projeto, juntamente com um arquivo chamado `sample_seed.sql`, para realizar o _seed_ do banco de dados com dados de exemplo. Este é apenas um esquema sugerido e você não precisa seguí-lo à risca.
- Também está disponível um arquivo chamado `sample_api_documentation.md` com exemplos de como você pode implementar as rotas da sua API.

## Referências e Ferramentas:

### Frameworks e Bibliotecas Frontend
- [React.js](https://reactjs.org/)
- [Next.js](https://nextjs.org/)
- [Remix](https://remix.run/)
- [Solid](https://www.solidjs.com/)
- [Waku](https://waku.gg/)
- [Chakra UI](https://chakra-ui.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [shadcn/ui](https://ui.shadcn.com/)

### Frameworks e Bibliotecas Backend
- [Node.js](https://nodejs.org/en/)
- [Express.js](https://expressjs.com/)
- [Fastify](https://www.fastify.io/)
- [Hono](https://hono.dev/)
- [Nest.js](https://nestjs.com/)

### Banco de Dados
- [PostgreSQL](https://www.postgresql.org/)
- [MySQL](https://www.mysql.com/)
- [MariaDB](https://mariadb.org/)
- [CockroachDB](https://www.cockroachlabs.com/)
- [Neon](https://neon.tech)

### Linguagens de Programação
- [TypeScript](https://www.typescriptlang.org/)

### Ferramentas de Testes
- [Jest](https://jestjs.io/)
- [Cypress](https://www.cypress.io/)

### Autenticação e Autorização
- [JWT](https://jwt.io/)

### Exportação de Relatórios em PDF e Excel
- [jsPDF](https://github.com/parallax/jsPDF)
- [SheetJS](https://sheetjs.com/)

### Deploy
- [Heroku](https://www.heroku.com/)
- [Fly.io](https://fly.io/)
- [AWS](https://aws.amazon.com/)
- [DigitalOcean](https://www.digitalocean.com/)
- [Vercel](https://vercel.com/)
- [Netlify](https://www.netlify.com/)

### Containers e Orquestração
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)

### Documentação de APIs
- [Postman](https://www.postman.com/)
- [Insomnia](https://insomnia.rest/)
- [Swagger](https://swagger.io/)
- [OpenAPI](https://www.openapis.org/)


## Entrega:
- O código deve ser disponibilizado em um repositório Git público. Instruções claras sobre como rodar a aplicação localmente devem ser fornecidas no README do repositório. 
- Após concluído, enviar o link com o repositório e seu CV para arielton@grupoenergia.eng.br.


Boa sorte! Estamos ansiosos para ver sua solução inovadora para o gerenciamento de frotas.


