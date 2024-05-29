
INSERT INTO vehicles
  (model, year, license_plate, mileage)
VALUES
  ('Toyota Corolla', 2018, 'ABC-1234', 50000),
  ('Ford Focus', 2017, 'XYZ-5678', 60000);


INSERT INTO tires
  (vehicle_id, installation_date, mileage_at_installation, predicted_replacement_mileage)
VALUES
  (1, '2023-01-15', 45000, 60000),
  (2, '2023-02-20', 55000, 70000);


INSERT INTO maintenance
  (vehicle_id, type, description, mileage_at_maintenance, date)
VALUES
  (1, 'trocaDeOleo', 'Troca de óleo do motor', 50000, '2023-06-10'),
  (2, 'inspecaoGeral', 'Inspeção geral do veículo', 60000, '2023-07-15');


INSERT INTO users
  (name, email, password_hash, role)
VALUES
  ('João Silva', 'joao.silva@example.com', 'senha_hashed_1', 'admin'),
  ('Maria Souza', 'maria.souza@example.com', 'senha_hashed_2', 'user');


INSERT INTO cost_analysis
  (vehicle_id, item_type, cost, purchase_date, performance_score)
VALUES
  (1, 'pneu', 1000.00, '2023-01-15', 85),
  (2, 'óleo', 200.00, '2023-06-10', 90);
