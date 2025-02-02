DROP DATABASE IF EXISTS gans_escooter;

CREATE DATABASE gans_escooter;

USE gans_escooter;

CREATE TABLE cities (
    city_id INT AUTO_INCREMENT,
    city_name VARCHAR(255) NOT NULL,
    country VARCHAR(255),
	latitude FLOAT NOT NULL, 
    longitude FLOAT NOT NULL,
    PRIMARY KEY (city_id)
);

CREATE TABLE populations (
    cities_data_id INT AUTO_INCREMENT,
    city_id INT,
    population INT NOT NULL, 
    census_year INT, -- this is a proxy for the census date that we can get when using the API
     -- this is the actual census year which we can webscrape
    data_collection_timestamp DATETIME, 
    
    PRIMARY KEY (cities_data_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE forecasts (
	forecast_id INT AUTO_INCREMENT,
    city_id INT NOT NULL,
    forecast_time DATETIME NOT NULL,
    temparature FLOAT,
    feels_like FLOAT,
    wind_speed float,
    weather_condition varchar(50),
    PRIMARY KEY (forecast_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE cities_airports (
    city_id INT NOT NULL,
    iata VARCHAR(5) NOT NULL,
    PRIMARY KEY (city_id, iata),
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    FOREIGN KEY (iata) REFERENCES airports(iata)
);

CREATE TABLE airports (
	iata VARCHAR(5) NOT NULL,
    icao VARCHAR(4),
    airport_name VARCHAR(255),
    longitude FLOAT,
    latitude FLOAT,
    PRIMARY KEY (iata)
);

CREATE TABLE flights (
	flight_data_id INT AUTO_INCREMENT,
    iata VARCHAR(5) NOT NULL,
    flight_number VARCHAR(15),
    scheduled_arrival_time DATETIME NOT NULL,
    updated_arrival_time DATETIME,
    departure_location VARCHAR(255),
    PRIMARY KEY (flight_data_id),
    FOREIGN KEY (iata) REFERENCES airports(iata)
);

SELECT * FROM cities;
SELECT * FROM populations;
SELECT * FROM forecasts;
SELECT * FROM cities_airports;
SELECT * FROM airports;
SELECT * FROM flights;

SELECT * FROM airports WHERE iata = 'BER';
INSERT IGNORE INTO airports (iata, airport_name) VALUES ('BER', 'Berlin Airport');
SELECT iata, COUNT(*) 
FROM airports 
GROUP BY iata 
HAVING COUNT(*) > 1;

DELETE FROM airports
WHERE iata = 'BER';

DELETE FROM cities_airports
WHERE iata = 'BER';