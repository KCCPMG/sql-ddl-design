/*
Design the schema for a medical center.

A medical center employs several doctors
A doctors can see many patients
A patient can be seen by many doctors
During a visit, a patient may be diagnosed to have one or more diseases.
*/

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

/*
doctors
          id              |  name  |
--------------------------+---------
   SERIAL PRIMARY KEY       TEXT
*/

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name TEXT
);

/*
patients
          id              |  name  |
--------------------------+---------
   SERIAL PRIMARY KEY        TEXT
*/

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name TEXT
);


/*
diseases
          id              |  name  |
--------------------------+---------
   SERIAL PRIMARY KEY        TEXT
*/

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name TEXT
);


/* 
medical_assignments
             doctor_id              |           patient_id
------------------------------------+------------------------------------
FOREIGN KEY REFERENCES doctors (id)   FOREIGN KEY REFERENCES patients (id)
*/

CREATE TABLE medical_assignments (
  doctor_id INTEGER REFERENCES doctors (id),
  patient_id INTEGER REFERENCES patients (id)
);


/*
diagnoses
             patient_id             |           disease_id
------------------------------------+------------------------------------
FOREIGN KEY REFERENCES patients (id)  FOREIGN KEY REFERENCES diseases (id)
*/

CREATE TABLE diagnoses (
  patient_id INTEGER REFERENCES patients (id),
  disease_id INTEGER REFERENCES diseases (id)
)