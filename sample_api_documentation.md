# Exemplo de Documentacao da API Laravel

As rotas abaixo sao sugestoes para uma API REST em Laravel. Elas podem ser ajustadas, desde que o fluxo da conferencia de estoque seja preservado.

## API de Funcionarios

- **GET /api/funcionarios**: lista todos os funcionarios.
- **POST /api/funcionarios**: cria um funcionario.
- **GET /api/funcionarios/{id}**: retorna os dados de um funcionario.
- **PUT /api/funcionarios/{id}**: atualiza um funcionario.
- **DELETE /api/funcionarios/{id}**: remove um funcionario.

## API de Produtos

- **GET /api/produtos**: lista todos os produtos.
- **POST /api/produtos**: cria um produto.
- **GET /api/produtos/{id}**: retorna os dados de um produto.
- **PUT /api/produtos/{id}**: atualiza um produto.
- **DELETE /api/produtos/{id}**: remove um produto.
- **GET /api/produtos/buscar**: busca produtos por nome ou codigo do sistema.

## API de Estoque de Produtos

- **GET /api/estoques-produtos**: lista os estoques dos produtos.
- **GET /api/estoques-produtos/{produto}**: retorna o estoque de um produto.
- **PUT /api/estoques-produtos/{produto}**: atualiza a quantidade em estoque de um produto.

## API de Contagens de Estoque

- **GET /api/contagens-estoque**: lista as contagens, com filtros opcionais por status, responsavel e periodo.
- **POST /api/contagens-estoque**: cria uma contagem de estoque.
- **GET /api/contagens-estoque/{id}**: retorna uma contagem com os itens agrupados por situacao.
- **PUT /api/contagens-estoque/{id}**: atualiza dados gerais de uma contagem.
- **DELETE /api/contagens-estoque/{id}**: remove uma contagem, se ela ainda puder ser excluida.
- **PATCH /api/contagens-estoque/{id}/status**: salva como `EM_ANDAMENTO` ou finaliza como `FINALIZADA`.

## API de Itens da Contagem

- **GET /api/contagens-estoque/{contagem}/itens**: lista os itens de uma contagem.
- **GET /api/contagens-estoque/{contagem}/itens/por-situacao**: lista os itens agrupados por `A_CONFERIR`, `CONFERIDO` e `FALTANTE_EXCEDENTE`.
- **PATCH /api/itens-contagem-estoque/{id}**: atualiza a quantidade contada e a observacao de um item. A API deve recalcular automaticamente a situacao comparando `quantidade_sistema` e `quantidade_contada`.
- **POST /api/itens-contagem-estoque/{id}/confirmar**: confirma a contagem de um item e move para `CONFERIDO` ou `FALTANTE_EXCEDENTE`.

## API de Autenticacao

- **POST /api/auth/registrar**: registra um usuario vinculado a um funcionario.
- **POST /api/auth/login**: autentica o usuario e retorna um token.
- **GET /api/auth/me**: retorna os dados do usuario autenticado.
- **POST /api/auth/logout**: encerra a sessao do usuario autenticado.

## Exemplos de Request e Response

### GET /api/contagens-estoque/{id}

Response:

```json
{
  "id": 1,
  "codigo": "1071",
  "data_agendada": "2025-11-20",
  "responsavel": {
    "id": 1,
    "nome": "Joao Silva",
    "email": "joao.silva@example.com"
  },
  "status": "EM_ANDAMENTO",
  "itens": {
    "a_conferir": [
      {
        "id": 1,
        "produto": {
          "codigo_sistema": "PROD-001",
          "nome": "Notebook Dell Inspiron 15"
        },
        "quantidade_contada": null,
        "situacao": "A_CONFERIR"
      }
    ],
    "conferidos": [
      {
        "id": 4,
        "produto": {
          "codigo_sistema": "PROD-004",
          "nome": "Monitor LG UltraWide 29\""
        },
        "quantidade_sistema": 15,
        "quantidade_contada": 15,
        "situacao": "CONFERIDO"
      }
    ],
    "faltantes_excedentes": [
      {
        "id": 6,
        "produto": {
          "codigo_sistema": "PROD-006",
          "nome": "Headset HyperX Cloud II"
        },
        "quantidade_sistema": 35,
        "quantidade_contada": 32,
        "situacao": "FALTANTE_EXCEDENTE",
        "observacao": "3 unidades danificadas encontradas no estoque"
      }
    ]
  }
}
```

### PATCH /api/itens-contagem-estoque/{id}

Request:

```json
{
  "quantidade_contada": 32,
  "observacao": "3 unidades danificadas"
}
```

Response:

```json
{
  "id": 6,
  "contagem_estoque_id": 1,
  "produto_id": 6,
  "quantidade_sistema": 35,
  "quantidade_contada": 32,
  "situacao": "FALTANTE_EXCEDENTE",
  "observacao": "3 unidades danificadas"
}
```

### PATCH /api/contagens-estoque/{id}/status

Request:

```json
{
  "status": "FINALIZADA"
}
```

Response:

```json
{
  "id": 1,
  "codigo": "1071",
  "status": "FINALIZADA",
  "message": "Contagem de estoque finalizada com sucesso."
}
```
