-- Tabela de funcionários
CREATE TABLE funcionarios
(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de produtos
CREATE TABLE produtos
(
  id SERIAL PRIMARY KEY,
  codigo_sistema VARCHAR(100) NOT NULL UNIQUE,
  nome VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de estoque de produtos
CREATE TABLE estoques_produtos
(
  id SERIAL PRIMARY KEY,
  produto_id INTEGER REFERENCES produtos(id) ON DELETE CASCADE,
  quantidade_sistema INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de contagens de estoque
CREATE TABLE contagens_estoque
(
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(50) NOT NULL UNIQUE,
  data_agendada DATE NOT NULL,
  responsavel_id INTEGER REFERENCES funcionarios(id),
  status VARCHAR(50) NOT NULL DEFAULT 'EM_ANDAMENTO',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT check_status CHECK (status IN ('EM_ANDAMENTO', 'FINALIZADA'))
);

-- Tabela de itens da contagem de estoque
CREATE TABLE itens_contagem_estoque
(
  id SERIAL PRIMARY KEY,
  contagem_estoque_id INTEGER REFERENCES contagens_estoque(id) ON DELETE CASCADE,
  produto_id INTEGER REFERENCES produtos(id),
  quantidade_sistema INTEGER NOT NULL,
  quantidade_contada INTEGER,
  situacao VARCHAR(50) NOT NULL DEFAULT 'A_CONFERIR',
  observacao TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT check_situacao CHECK (situacao IN ('A_CONFERIR', 'CONFERIDO', 'FALTANTE_EXCEDENTE'))
);

-- Tabela de usuários para autenticação
CREATE TABLE usuarios
(
  id SERIAL PRIMARY KEY,
  funcionario_id INTEGER REFERENCES funcionarios(id) ON DELETE CASCADE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

