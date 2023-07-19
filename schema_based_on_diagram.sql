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
