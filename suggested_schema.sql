-- Tabela de veículos
CREATE TABLE vehicles
(
  id SERIAL PRIMARY KEY,
  model VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  license_plate VARCHAR(20) NOT NULL,
  mileage INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pneus
CREATE TABLE tires
(
  id SERIAL PRIMARY KEY,
  vehicle_id INTEGER REFERENCES vehicles(id),
  installation_date DATE NOT NULL,
  mileage_at_installation INTEGER NOT NULL,
  predicted_replacement_mileage INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabela de manutenção
CREATE TABLE maintenance
(
  id SERIAL PRIMARY KEY,
  vehicle_id INTEGER REFERENCES vehicles(id),
  type VARCHAR(50) NOT NULL,
  description TEXT,
  mileage_at_maintenance INTEGER NOT NULL,
  date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabela de usuários
CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabela de análise de custos
CREATE TABLE cost_analysis
(
  id SERIAL PRIMARY KEY,
  vehicle_id INTEGER REFERENCES vehicles(id),
  item_type VARCHAR(50) NOT NULL,
  cost DECIMAL(10, 2) NOT NULL,
  purchase_date DATE NOT NULL,
  performance_score INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
