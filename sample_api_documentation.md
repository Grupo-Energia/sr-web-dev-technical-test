# Sample API Documentation

## API de Funcionários
- **GET /api/funcionarios**: Get a list of all employees.
- **POST /api/funcionarios**: Create a new employee.
- **GET /api/funcionarios/:id**: Get details of a specific employee.
- **PUT /api/funcionarios/:id**: Update a specific employee.
- **DELETE /api/funcionarios/:id**: Delete a specific employee.

## API de Produtos
- **GET /api/produtos**: Get a list of all products.
- **POST /api/produtos**: Create a new product.
- **GET /api/produtos/:id**: Get details of a specific product.
- **PUT /api/produtos/:id**: Update a specific product.
- **DELETE /api/produtos/:id**: Delete a specific product.
- **GET /api/produtos/buscar**: Search products by name or system code.

## API de Estoque de Produtos
- **GET /api/estoques-produtos**: Get a list of all product stocks.
- **GET /api/estoques-produtos/:produtoId**: Get stock details for a specific product.
- **PUT /api/estoques-produtos/:produtoId**: Update stock quantity for a specific product.

## API de Contagens de Estoque
- **GET /api/contagens-estoque**: Get a list of all stock counts (with optional filters: status, responsible_id, date range).
- **POST /api/contagens-estoque**: Create a new stock count.
- **GET /api/contagens-estoque/:id**: Get details of a specific stock count including all items grouped by situation.
- **PUT /api/contagens-estoque/:id**: Update a stock count.
- **DELETE /api/contagens-estoque/:id**: Delete a stock count.
- **PATCH /api/contagens-estoque/:id/status**: Update stock count status (save as "EM_ANDAMENTO" or finalize to "FINALIZADA").

## API de Itens de Contagem
- **GET /api/contagens-estoque/:contagemEstoqueId/itens**: Get all items for a specific stock count.
- **GET /api/contagens-estoque/:contagemEstoqueId/itens/por-situacao**: Get items grouped by situation (A_CONFERIR, CONFERIDO, FALTANTE_EXCEDENTE).
- **PATCH /api/itens-contagem-estoque/:id**: Update counted quantity and observation for a specific item. Automatically recalculates situation based on system_quantity vs counted_quantity.
- **POST /api/itens-contagem-estoque/:id/confirmar**: Confirm an item count (moves from A_CONFERIR to CONFERIDO or FALTANTE_EXCEDENTE).

## API de Autenticação
- **POST /api/auth/registrar**: Register a new user (links to an employee).
- **POST /api/auth/login**: Login a user (returns JWT token).
- **GET /api/auth/me**: Get the current user's details (authentication required).
- **POST /api/auth/logout**: Logout the current user.

## Request/Response Examples

### GET /api/contagens-estoque/:id
Response:
```json
{
  "id": 1,
  "code": "1071",
  "scheduledDate": "2025-11-20",
  "responsible": {
    "id": 1,
    "name": "João Silva",
    "email": "joao.silva@example.com"
  },
  "status": "EM_ANDAMENTO",
  "items": {
    "aConferir": [
      {
        "id": 1,
        "product": {
          "systemCode": "PROD-001",
          "name": "Notebook Dell Inspiron 15"
        },
        "countedQuantity": null,
        "situation": "A_CONFERIR"
      }
    ],
    "conferidos": [
      {
        "id": 4,
        "product": {
          "systemCode": "PROD-004",
          "name": "Monitor LG UltraWide 29\""
        },
        "systemQuantity": 15,
        "countedQuantity": 15,
        "situation": "CONFERIDO"
      }
    ],
    "faltantesExcedentes": [
      {
        "id": 6,
        "product": {
          "systemCode": "PROD-006",
          "name": "Headset HyperX Cloud II"
        },
        "systemQuantity": 35,
        "countedQuantity": 32,
        "situation": "FALTANTE_EXCEDENTE",
        "observation": "3 unidades danificadas encontradas no estoque"
      }
    ]
  }
}
```

### PATCH /api/stock-count-items/:id
Request:
```json
{
  "countedQuantity": 32,
  "observation": "3 unidades danificadas"
}
```

Response:
```json
{
  "id": 6,
  "stockCountId": 1,
  "productId": 6,
  "systemQuantity": 35,
  "countedQuantity": 32,
  "situation": "FALTANTE_EXCEDENTE",
  "observation": "3 unidades danificadas"
}
```

### PATCH /api/stock-counts/:id/status
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
  "code": "1071",
  "status": "FINALIZADA",
  "message": "Contagem de estoque finalizada com sucesso."
}
```
