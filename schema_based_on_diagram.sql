/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  status VARCHAR(50)
);

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255)
);
CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TiMESTAMP,
  paid_at_timestamp DEFAULT CURRENT_TIMESTAMP,
  medical_history_id INTEGER
);
CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INTEGER,
  total_price DECIMAL,
  invoice_id INTEGER,
  treatment_id INTEGER
);
