CREATE SCHEMA stations;

CREATE TABLE stations.station (
    station_name VARCHAR(10) PRIMARY KEY,
    tracks_number INT,
    region VARCHAR(10),
    city_name VARCHAR(10),
);

CREATE TABLE stations.city (
    region VARCHAR(10),
    city_name VARCHAR(10),
    PRIMARY KEY (region, city_name)
);

CREATE TABLE stations.connection (
  train_nr int,
  departure DATE,
  arrival DATE,
  from_station_name VARCHAR(10),
  to_station_name VARCHAR(10),
  PRIMARY KEY (train_nr, departure)
);

CREATE TABLE stations.train (
  nr INT PRIMARY KEY,
  train_length INT
);

ALTER TABLE stations.connection ADD FOREIGN KEY (train_nr) REFERENCES stations.train (nr);

ALTER TABLE stations.connection ADD FOREIGN KEY (from_station_name) REFERENCES stations.station (station_name);

ALTER TABLE stations.connection ADD FOREIGN KEY (to_station_name) REFERENCES stations.station (station_name);

ALTER TABLE stations.station ADD FOREIGN KEY (city_name, region) REFERENCES stations.city
