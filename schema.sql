/* Database schema to keep the structure of the entire database. */

CREATE TABLE patients (
    id serial PRIMARY KEY,
    name varchar(255),
    date_of_birth date,
);

CREATE TABLE treatment (
    id serial PRIMARY KEY,
    name varchar(255),
    type varchar(255),
);

CREATE TABLE medical_histories (
    id serial PRIMARY KEY,
    addmited_at timestamp,
    patient_id integer REFERENCES patients(id),
    status varchar(255),
);
