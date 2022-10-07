CREATE SCHEMA hospital;

CREATE TABLE hospital.person (
  person_nr SERIAL PRIMARY KEY,
  person_name VARCHAR(10),
  station_nr INT
);

CREATE TABLE hospital.caregiver (
  person_nr INT PRIMARY KEY,
  qualification VARCHAR(10)
);

CREATE TABLE hospital.doctor (
  person_nr INT PRIMARY KEY,
  area VARCHAR(10),
  rank VARCHAR(10)
);

CREATE TABLE hospital.station (
  station_nr INT PRIMARY KEY,
  station_name VARCHAR(10)
);

CREATE TABLE hospital.room (
  room_nr SERIAL PRIMARY KEY,
  beds_number INT,
  station_nr INT
);

CREATE TABLE hospital.patient (
  patient_nr SERIAL PRIMARY KEY,
  patient_name VARCHAR(10),
  disease VARCHAR(10),
  room_nr INT,
  doctor_nr INT
);

ALTER TABLE hospital.room ADD FOREIGN KEY (station_nr) REFERENCES hospital.station (station_nr);

ALTER TABLE hospital.person ADD FOREIGN KEY (station_nr) REFERENCES hospital.station (station_nr);

ALTER TABLE hospital.caregiver ADD FOREIGN KEY (person_nr) REFERENCES hospital.person (person_nr);

ALTER TABLE hospital.doctor ADD FOREIGN KEY (person_nr) REFERENCES hospital.person (person_nr);

ALTER TABLE hospital.patient ADD FOREIGN KEY (room_nr) REFERENCES hospital.room (room_nr);

ALTER TABLE hospital.patient ADD FOREIGN KEY (doctor_nr) REFERENCES hospital.doctor (person_nr);
