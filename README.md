# Technical Challenge — Fullstack Developer

## Module: Scheduled Stock Count

### Context

Imagine a scheduled stock count system for a technology equipment distribution company. On specific dates, the system schedules counting sessions for employees. On the counting day, the responsible person accesses the screen, physically checks the products, and records what they found.

Your challenge: implement a simplified version of this flow in TypeScript.

## Business Flow

A scheduled stock count includes:

- Stock count code
- Scheduled date
- Responsible employee
- List of items to be counted

Each item includes:

- System code of the product
- Product name
- Quantity registered in the system (stored in the database—hidden on the screen)
- Quantity counted by the employee
- Stock count status

### Interface Layout

Items must appear in three sections:

- `A Conferir` — items not yet counted. The user informs the quantity and confirms.
- `Conferidos` — items where the counted quantity matches the system quantity. They appear read-only.
- `Faltantes / Excedentes` — items with a difference between the counted quantity and the system quantity. Show the system code, product, informed quantity, and require an observation (e.g., "damaged product", "previous entry error").

### Main Rules

1. When entering the quantity for an item in `A Conferir`:
   - If `quantidade_contada == quantidade_sistema` → move to `Conferidos`.
   - If `quantidade_contada != quantidade_sistema` → move to `Faltantes / Excedentes` and require `observacao`.
2. The stock count can be saved partially (`status: EM_ANDAMENTO`) and resumed later.
3. There must be a "Finalizar conferência" action:
   - Show a confirmation modal with a message such as `Deseja concluir a conferência código: 1071? Ao confirmar não será possível continuar a fazer a conferência posteriormente.`
   - After finalization, the stock count locks for editing (`status` → `FINALIZADA`).

## Mandatory Stack

- Language: TypeScript
- Frontend: Next.js or TanStack Router in a React SPA/MPA
- Backend HTTP API: Elysia (or another TypeScript REST solution)
- Relational database of your choice: PostgreSQL, MySQL, SQLite, etc.
- Suggested ORM/query builder: Drizzle, Prisma, Knex, etc.

## Suggested Data Model (TypeScript examples)

Funcionario (`employees`)

```ts
type Funcionario = {
  id: string;
  nome: string;
  email: string;
};
```

Produto (`products`)

```ts
type Produto = {
  id: string;
  codigoSistema: string; // code shown on screen
  nome: string;
};
```

EstoqueProduto (`product_stocks`)

```ts
type EstoqueProduto = {
  id: string;
  produtoId: string;
  quantidadeSistema: number;
};
```

ContagemEstoque (`stock_counts`)

```ts
type ContagemEstoque = {
  id: string;
  codigo: string; // e.g., "1071"
  dataAgendada: Date;
  responsavelId: string; // reference to "Funcionario"
  status: "EM_ANDAMENTO" | "FINALIZADA";
  criadoEm: Date;
  atualizadoEm: Date;
};
```

ItemContagemEstoque (`stock_count_items`)

```ts
type ItemContagemEstoque = {
  id: string;
  contagemEstoqueId: string; // reference to "ContagemEstoque"
  produtoId: string; // reference to "Produto"
  quantidadeSistema: number; // snapshot when creating the "ContagemEstoque"
  quantidadeContada: number | null;
  situacao: "A_CONFERIR" | "CONFERIDO" | "FALTANTE_EXCEDENTE";
  observacao: string | null; // required when "FALTANTE_EXCEDENTE"
};
```

Notes:

- `quantidade_sistema` is copied from `product_stocks` when creating the `ContagemEstoque`.
- `quantidade_contada` starts as `null`.
- `situacao` starts as `A_CONFERIR`.

## Suggested API Requirements (endpoints)

GET `/contagens-estoque/:id` — returns `ContagemEstoque` data and its list of items (with `situacao` or grouped by section).

PATCH `/itens-contagem-estoque/:id` — updates `quantidadeContada`, recalculates `situacao` using `quantidadeSistema`. If `FALTANTE_EXCEDENTE`, require `observacao`.

PATCH `/contagens-estoque/:id/status` — allows:

- Save as "Em andamento".
- Finalize the `ContagemEstoque` (locks item editing).

Note: You may organize endpoints differently as long as the flow is respected.

## Frontend Requirements

The stock count screen must display:

- Stock count code
- Date
- Responsible employee

Three visual sections:

- `A Conferir` — numeric field to enter the quantity plus a per-item confirm button.
- `Faltantes / Excedentes` — display item data and a mandatory observation field.
- `Conferidos` — display item data in read-only mode.

Global buttons:

- "Salvar contagem" — saves partial progress.
- "Finalizar conferência" — opens a confirmation modal and, if confirmed, locks the `ContagemEstoque`.

The layout does not need a specific visual design; the conceptual organization is what matters.

## Optional Differentials

- Simple authentication per `Funcionario`.
- Filters and search by product name or system code.
- Visual emphasis for missing vs excess items (e.g., arrows or colors).
- Basic automated tests.
- Friendly error handling.
- Clear folder structure in the backend and frontend.
- Project deploy in a serverless architecture using Vercel, Netlify, Appwrite, or similar.

## References and Tools

### Frontend Frameworks and Libraries

- [React.js](https://reactjs.org/)
- [Next.js](https://nextjs.org/)
- [Remix](https://remix.run/)
- [Solid](https://www.solidjs.com/)
- [Waku](https://waku.gg/)
- [Chakra UI](https://chakra-ui.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [shadcn/ui](https://ui.shadcn.com/)

### Backend Frameworks and Libraries

- [Node.js](https://nodejs.org/en/)
- [Elysia](https://elysiajs.com/)
- [Express.js](https://expressjs.com/)
- [Fastify](https://www.fastify.io/)
- [Hono](https://hono.dev/)
- [Nest.js](https://nestjs.com/)

### Databases

- [PostgreSQL](https://www.postgresql.org/)
- [MySQL](https://www.mysql.com/)
- [MariaDB](https://mariadb.org/)
- [CockroachDB](https://www.cockroachlabs.com/)
- [Neon](https://neon.tech)

### Programming Languages

- [TypeScript](https://www.typescriptlang.org/)

### Testing Tools

- [Jest](https://jestjs.io/)
- [Cypress](https://www.cypress.io/)

### Authentication and Authorization

- [JWT](https://jwt.io/)

### PDF and Excel Reporting

- [jsPDF](https://github.com/parallax/jsPDF)
- [SheetJS](https://sheetjs.com/)

### Deploy

- [Heroku](https://www.heroku.com/)
- [Fly.io](https://fly.io/)
- [AWS](https://aws.amazon.com/)
- [DigitalOcean](https://www.digitalocean.com/)
- [Vercel](https://vercel.com/)
- [Netlify](https://www.netlify.com/)
- [Appwrite](https://appwrite.io/)

### Containers and Orchestration

- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)

### API Documentation

- [Postman](https://www.postman.com/)
- [Insomnia](https://insomnia.rest/)
- [Swagger](https://swagger.io/)
- [OpenAPI](https://www.openapis.org/)

### Delivery:

The code must be made available in a public Git repository. Clear instructions on how to run the application locally must be provided in the repository’s README.

Once completed, send the repository link and your résumé to arielton@grupoenergia.eng.br
