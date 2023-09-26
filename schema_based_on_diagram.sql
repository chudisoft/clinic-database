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

CREATE TABLE medical_histories_treatments (
    medical_id int,
    treatment_id int,
    PRIMARY KEY (medical_id, treatment_id),
    CONSTRAINT fk_medical
        FOREIGN KEY (medical_id)
            REFERENCES medical_histories(id),
    CONSTRAINT fk_treatments
        Foreign Key (treatment_id) 
            REFERENCES treatment(id)
);

CREATE TABLE invoices(
    id serial PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id int,
    CONSTRAINT fk_medical
        FOREIGN KEY (medical_history_id)
            REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id serial primary key,
    unit_price DECIMAL,
    quantity int,
    total_price DECIMAL,
    invoice_id int,
    treatment_id int,
    CONSTRAINT fk_treatments
        Foreign Key (treatment_id) REFERENCES treatment(id),
    CONSTRAINT fk_invoices
        Foreign Key (invoice_id) REFERENCES invoices(id),
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);

CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON invoice_items(invoice_id);

