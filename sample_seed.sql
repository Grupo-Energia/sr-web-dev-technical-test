
-- Inserir funcionários
INSERT INTO funcionarios
  (nome, email)
VALUES
  ('João Silva', 'joao.silva@example.com'),
  ('Maria Souza', 'maria.souza@example.com'),
  ('Carlos Santos', 'carlos.santos@example.com'),
  ('Ana Costa', 'ana.costa@example.com');


-- Inserir produtos
INSERT INTO produtos
  (codigo_sistema, nome)
VALUES
  ('PROD-001', 'Notebook Dell Inspiron 15'),
  ('PROD-002', 'Mouse Logitech MX Master 3'),
  ('PROD-003', 'Teclado Mecânico Keychron K2'),
  ('PROD-004', 'Monitor LG UltraWide 29"'),
  ('PROD-005', 'Webcam Logitech C920'),
  ('PROD-006', 'Headset HyperX Cloud II'),
  ('PROD-007', 'SSD Samsung 1TB'),
  ('PROD-008', 'Memória RAM DDR4 16GB'),
  ('PROD-009', 'Hub USB-C 7 portas'),
  ('PROD-010', 'Suporte para Notebook');


-- Inserir estoque de produtos
INSERT INTO estoques_produtos
  (produto_id, quantidade_sistema)
VALUES
  (1, 25),
  (2, 50),
  (3, 30),
  (4, 15),
  (5, 40),
  (6, 35),
  (7, 60),
  (8, 80),
  (9, 45),
  (10, 100);


-- Inserir usuários (senha: "password123" - hash bcrypt)
INSERT INTO usuarios
  (funcionario_id, password_hash)
VALUES
  (1, '$2a$10$hashed_password_1'),
  (2, '$2a$10$hashed_password_2'),
  (3, '$2a$10$hashed_password_3');


-- Inserir contagens de estoque
INSERT INTO contagens_estoque
  (codigo, data_agendada, responsavel_id, status)
VALUES
  ('1071', '2025-11-20', 1, 'EM_ANDAMENTO'),
  ('1072', '2025-11-18', 2, 'FINALIZADA'),
  ('1073', '2025-11-25', 3, 'EM_ANDAMENTO');


-- Inserir itens de contagem de estoque (contagem 1071 - em andamento)
INSERT INTO itens_contagem_estoque
  (contagem_estoque_id, produto_id, quantidade_sistema, quantidade_contada, situacao, observacao)
VALUES
  -- Items a conferir
  (1, 1, 25, NULL, 'A_CONFERIR', NULL),
  (1, 2, 50, NULL, 'A_CONFERIR', NULL),
  (1, 3, 30, NULL, 'A_CONFERIR', NULL),
  -- Items conferidos
  (1, 4, 15, 15, 'CONFERIDO', NULL),
  (1, 5, 40, 40, 'CONFERIDO', NULL),
  -- Items faltantes/excedentes
  (1, 6, 35, 32, 'FALTANTE_EXCEDENTE', '3 unidades danificadas encontradas no estoque'),
  (1, 7, 60, 65, 'FALTANTE_EXCEDENTE', 'Entrada não registrada no sistema - produtos recebidos mas não lançados');


-- Inserir itens de contagem de estoque (contagem 1072 - finalizada)
INSERT INTO itens_contagem_estoque
  (contagem_estoque_id, produto_id, quantidade_sistema, quantidade_contada, situacao, observacao)
VALUES
  (2, 1, 25, 25, 'CONFERIDO', NULL),
  (2, 2, 50, 48, 'FALTANTE_EXCEDENTE', '2 unidades vendidas mas não baixadas do estoque'),
  (2, 8, 80, 80, 'CONFERIDO', NULL),
  (2, 9, 45, 45, 'CONFERIDO', NULL);


-- Inserir itens de contagem de estoque (contagem 1073 - em andamento)
INSERT INTO itens_contagem_estoque
  (contagem_estoque_id, produto_id, quantidade_sistema, quantidade_contada, situacao, observacao)
VALUES
  (3, 3, 30, 30, 'CONFERIDO', NULL),
  (3, 4, 15, NULL, 'A_CONFERIR', NULL),
  (3, 5, 40, NULL, 'A_CONFERIR', NULL),
  (3, 10, 100, 98, 'FALTANTE_EXCEDENTE', '2 unidades com defeito de fabricação');
