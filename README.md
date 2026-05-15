# Desafio Tecnico - Desenvolvedor Fullstack

## Modulo: Conferencia de Estoque Agendada

### Contexto

Imagine um sistema de conferencia de estoque agendada para uma empresa de distribuicao de equipamentos de tecnologia. Em datas especificas, o sistema agenda sessoes de conferencia para os funcionarios. No dia da conferencia, a pessoa responsavel acessa a tela, verifica fisicamente os produtos e registra as quantidades encontradas.

Seu desafio e implementar uma versao simplificada desse fluxo usando React no frontend, Laravel no backend e PostgreSQL como banco de dados.

## Fluxo de Negocio

Uma conferencia de estoque agendada possui:

- Codigo da conferencia
- Data agendada
- Funcionario responsavel
- Lista de itens a serem conferidos

Cada item possui:

- Codigo do produto no sistema
- Nome do produto
- Quantidade registrada no sistema, armazenada no banco e oculta na tela de conferencia
- Quantidade contada pelo funcionario
- Situacao do item na conferencia

### Organizacao da Interface

Os itens devem aparecer em tres secoes:

- `A Conferir`: itens ainda nao contados. O usuario informa a quantidade e confirma.
- `Conferidos`: itens em que a quantidade contada e igual a quantidade do sistema. Devem aparecer somente para leitura.
- `Faltantes / Excedentes`: itens com diferenca entre a quantidade contada e a quantidade do sistema. Devem exibir codigo do sistema, produto, quantidade informada e exigir uma observacao, por exemplo: "produto avariado" ou "erro de entrada anterior".

### Regras Principais

1. Ao informar a quantidade de um item em `A Conferir`:
   - Se `quantidade_contada == quantidade_sistema`, mover para `Conferidos`.
   - Se `quantidade_contada != quantidade_sistema`, mover para `Faltantes / Excedentes` e exigir `observacao`.
2. A conferencia pode ser salva parcialmente com `status: EM_ANDAMENTO` e retomada posteriormente.
3. Deve existir uma acao "Finalizar conferencia":
   - Exibir um modal de confirmacao com uma mensagem como: `Deseja concluir a conferencia codigo: 1071? Ao confirmar, nao sera possivel continuar a fazer a conferencia posteriormente.`
   - Apos a finalizacao, a conferencia deve ficar bloqueada para edicao, com `status: FINALIZADA`.

## Stack Obrigatoria

- Frontend: React
- Backend HTTP API: Laravel
- Banco de dados: PostgreSQL
- ORM: Eloquent ORM
- Migrations e seeders: Laravel Migrations e Laravel Seeders

O frontend pode ser implementado como SPA, por exemplo com Vite + React. O backend deve expor uma API REST em Laravel, consumida pelo frontend.

## Modelo de Dados Sugerido

### `funcionarios`

| Campo | Tipo sugerido | Observacao |
| --- | --- | --- |
| `id` | `bigserial` | Chave primaria |
| `nome` | `varchar(255)` | Obrigatorio |
| `email` | `varchar(255)` | Obrigatorio e unico |
| `created_at` | `timestamp` | Controlado pelo Laravel |
| `updated_at` | `timestamp` | Controlado pelo Laravel |

### `produtos`

| Campo | Tipo sugerido | Observacao |
| --- | --- | --- |
| `id` | `bigserial` | Chave primaria |
| `codigo_sistema` | `varchar(100)` | Codigo exibido na tela, obrigatorio e unico |
| `nome` | `varchar(255)` | Obrigatorio |
| `created_at` | `timestamp` | Controlado pelo Laravel |
| `updated_at` | `timestamp` | Controlado pelo Laravel |

### `estoques_produtos`

| Campo | Tipo sugerido | Observacao |
| --- | --- | --- |
| `id` | `bigserial` | Chave primaria |
| `produto_id` | `foreignId` | Referencia `produtos.id` |
| `quantidade_sistema` | `integer` | Quantidade atual registrada no sistema |
| `created_at` | `timestamp` | Controlado pelo Laravel |
| `updated_at` | `timestamp` | Controlado pelo Laravel |

### `contagens_estoque`

| Campo | Tipo sugerido | Observacao |
| --- | --- | --- |
| `id` | `bigserial` | Chave primaria |
| `codigo` | `varchar(50)` | Obrigatorio e unico, exemplo: `1071` |
| `data_agendada` | `date` | Data prevista para a conferencia |
| `responsavel_id` | `foreignId` | Referencia `funcionarios.id` |
| `status` | `varchar(50)` | `EM_ANDAMENTO` ou `FINALIZADA` |
| `created_at` | `timestamp` | Controlado pelo Laravel |
| `updated_at` | `timestamp` | Controlado pelo Laravel |

### `itens_contagem_estoque`

| Campo | Tipo sugerido | Observacao |
| --- | --- | --- |
| `id` | `bigserial` | Chave primaria |
| `contagem_estoque_id` | `foreignId` | Referencia `contagens_estoque.id` |
| `produto_id` | `foreignId` | Referencia `produtos.id` |
| `quantidade_sistema` | `integer` | Snapshot da quantidade ao criar a conferencia |
| `quantidade_contada` | `integer nullable` | Comeca como `null` |
| `situacao` | `varchar(50)` | `A_CONFERIR`, `CONFERIDO` ou `FALTANTE_EXCEDENTE` |
| `observacao` | `text nullable` | Obrigatoria quando `situacao` for `FALTANTE_EXCEDENTE` |
| `created_at` | `timestamp` | Controlado pelo Laravel |
| `updated_at` | `timestamp` | Controlado pelo Laravel |

Observacoes:

- `quantidade_sistema` deve ser copiada de `estoques_produtos` quando a `contagens_estoque` for criada.
- `quantidade_contada` deve iniciar como `null`.
- `situacao` deve iniciar como `A_CONFERIR`.
- O banco PostgreSQL deve validar, sempre que possivel, os valores aceitos para `status` e `situacao`.

## Requisitos Sugeridos da API

Use rotas REST no Laravel, preferencialmente dentro de `routes/api.php`.

GET `/api/contagens-estoque/{id}`: retorna os dados da conferencia e sua lista de itens, com `situacao` ou agrupados por secao.

PATCH `/api/itens-contagem-estoque/{id}`: atualiza `quantidade_contada`, recalcula `situacao` usando `quantidade_sistema` e exige `observacao` quando o item for `FALTANTE_EXCEDENTE`.

PATCH `/api/contagens-estoque/{id}/status`: permite:

- Salvar como `EM_ANDAMENTO`.
- Finalizar a conferencia, alterando o status para `FINALIZADA` e bloqueando a edicao dos itens.

Voce pode organizar os endpoints de outra forma, desde que o fluxo seja respeitado.

## Requisitos do Frontend

A tela de conferencia de estoque em React deve exibir:

- Codigo da conferencia
- Data agendada
- Funcionario responsavel

Tres secoes visuais:

- `A Conferir`: campo numerico para informar a quantidade e botao de confirmacao por item.
- `Faltantes / Excedentes`: dados do item e campo obrigatorio de observacao.
- `Conferidos`: dados do item em modo somente leitura.

Botoes globais:

- `Salvar contagem`: salva o progresso parcial.
- `Finalizar conferencia`: abre um modal de confirmacao e, se confirmado, bloqueia a conferencia.

O layout nao precisa seguir um design visual especifico. O mais importante e a organizacao conceitual da tela e o funcionamento correto do fluxo.

## Requisitos do Backend

O backend em Laravel deve conter:

- Migrations para PostgreSQL.
- Models Eloquent com relacionamentos entre funcionarios, produtos, estoques, contagens e itens.
- Controllers ou actions para os endpoints principais.
- Validacao de entrada, preferencialmente com Form Requests.
- Regras de negocio para recalcular a situacao dos itens.
- Bloqueio de edicao quando a conferencia estiver `FINALIZADA`.
- Seeders com dados minimos para testar o fluxo.

## Diferenciais Opcionais

- Autenticacao simples por funcionario.
- Filtros e busca por nome do produto ou codigo do sistema.
- Destaque visual para itens faltantes e excedentes.
- Testes automatizados no Laravel, usando PHPUnit ou Pest.
- Testes de interface no React, usando Cypress, Playwright ou Testing Library.
- Tratamento amigavel de erros.
- Estrutura clara de pastas no backend e no frontend.
- Docker Compose com Laravel, React e PostgreSQL.
- Deploy do frontend e backend em ambiente de sua escolha.

## Referencias e Ferramentas

### Frontend

- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
- [React Router](https://reactrouter.com/)
- [TanStack Query](https://tanstack.com/query/latest)
- [Tailwind CSS](https://tailwindcss.com/)
- [shadcn/ui](https://ui.shadcn.com/)

### Backend

- [Laravel](https://laravel.com/)
- [Eloquent ORM](https://laravel.com/docs/eloquent)
- [Laravel Migrations](https://laravel.com/docs/migrations)
- [Laravel Validation](https://laravel.com/docs/validation)

### Banco de Dados

- [PostgreSQL](https://www.postgresql.org/)

### Testes

- [PHPUnit](https://phpunit.de/)
- [Pest](https://pestphp.com/)
- [Cypress](https://www.cypress.io/)
- [Playwright](https://playwright.dev/)

### Documentacao de API

- [Postman](https://www.postman.com/)
- [Insomnia](https://insomnia.rest/)
- [Swagger](https://swagger.io/)
- [OpenAPI](https://www.openapis.org/)

## Entrega

O codigo deve ser disponibilizado em um repositorio Git publico. O README do projeto entregue deve conter instrucoes claras de como executar a aplicacao localmente, incluindo:

- Requisitos de ambiente
- Instalacao das dependencias do frontend e backend
- Configuracao do arquivo `.env` do Laravel
- Configuracao da conexao com PostgreSQL
- Execucao das migrations e seeders
- Comandos para iniciar a API Laravel e o frontend React

Apos concluir, envie o link do repositorio e seu curriculo para arielton@grupoenergia.eng.br.
