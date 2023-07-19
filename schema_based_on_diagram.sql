/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  status VARCHAR(50)
);
CREATE INDEX ON medical_histories (patient_id);

-- add join table between medical histories and treatments
CREATE TABLE medical_chart (
  medical_history_id INTEGER NOT NULL REFERENCES medical_histories(id),
  treatment_id INTEGER NOT NULL REFERENCES treatments(id)
);
CREATE INDEX ON medical_chart (treatment_id);
CREATE INDEX ON medical_chart (medical_history_id);

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255)
);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TiMESTAMP,
  paid_at timestamp,
  medical_history_id INTEGER REFERENCES medical_histories(id)
);
CREATE INDEX ON invoices (medical_history_id);

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INTEGER,
  total_price DECIMAL,
  invoice_id INTEGER REFERENCES invoices(id),
  treatment_id INTEGER REFERENCES treatments(id)
);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);