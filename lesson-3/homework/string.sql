CREATE DATABASE lesson3

USE lesson3

CREATE TABLE passengers(
   id BIGINT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   date_of_birth DATE,
   country_of_citizenship VARCHAR(50),
   country_of_residence VARCHAR(50),
   passport_number VARCHAR(20),
   created_at DATETIME,
   updated_at DATETIME
   );

CREATE TABLE airport(
   id BIGINT PRIMARY KEY,
   airport_name VARCHAR(50),
   country VARCHAR(50),
   state VARCHAR(50),
   city VARCHAR(50),
   created_at DATETIME,
   updated_id DATETIME
   );

CREATE TABLE airline(
   id BIGINT PRIMARY KEY,
   airline_code VARCHAR(50),
   airline_name BIGINT,
   airline_country VARCHAR(50),
   created_at DATETIME,
   updated_at DATETIME
   );

CREATE TABLE no_fly_list(
   id BIGINT PRIMARY KEY,
   active_from DATE,
   active_to DATE,
   no_fly_reason VARCHAR(255),
   created_at DATETIME,
   updated_at DATETIME,
   psgnr_id BIGINT,
   FOREIGN KEY(psgnr_id) REFERENCES passengers(id)
   );

CREATE TABLE security_check(
   id BIGINT PRIMARY KEY,
   check_result VARCHAR(20),
   comments VARCHAR(100),
   created_at DATETIME,
   updated_at DATETIME,
   passenger_id BIGINT,
   FOREIGN KEY(passenger_id) REFERENCES passengers(id)
   )

CREATE TABLE booking(
   booking_id BIGINT PRIMARY KEY,
   flight_id BIGINT,
   status VARCHAR(20),
   booking_platform VARCHAR(20),
   created_at DATETIME,
   updated_at DATETIME,
   passenger_id BIGINT,
   FOREIGN KEY(passenger_id) REFERENCES passengers(id)
   );

CREATE TABLE baggage(
   id BIGINT PRIMARY KEY,
   weight_in_kg decimal(4,2),
   created_date DATE,
   updated_date DATE,
   booking_id BIGINT,
   FOREIGN KEY(booking_id) REFERENCES booking(booking_id)
   );

CREATE TABLE baggage_check(
   id BIGINT PRIMARY KEY,
   check_result VARCHAR(50),
   created_at BIGINT,
   updated_at BIGINT,
   booking_id BIGINT,
   passenger_id BIGINT,
   FOREIGN KEY(booking_id) REFERENCES booking(booking_id),
   FOREIGN KEY(passenger_id) REFERENCES passengers(id)
   );

CREATE TABLE boarding_pass(
   id BIGINT PRIMARY KEY,
   qr_code VARCHAR(50),
   created_at DATETIME,
   updated_at DATETIME,
   booking_id BIGINT,
   FOREIGN KEY(booking_id) REFERENCES booking(booking_id)
   );

CREATE TABLE flights(
   flight_id BIGINT PRIMARY KEY,
   departing_gate VARCHAR(20),
   arriving_gate VARCHAR(20),
   created_at DATETIME,
   updated_at DATETIME,
   airline_id BIGINT,
   departing_airport_id BIGINT,
   arriving_airport_id BIGINT,
   FOREIGN KEY(airline_id) REFERENCES airline(id),
   FOREIGN KEY(departing_airport_id) REFERENCES airport(id),
   FOREIGN KEY(arriving_airport_id) REFERENCES airport(id)
  );

CREATE TABLE flight_manifest(
   id BIGINT PRIMARY KEY,
   created_at DATETIME,
   updated_at DATETIME,
   booking_id BIGINT,
   flight_id BIGINT,
   FOREIGN KEY(booking_id) REFERENCES booking(booking_id),
   FOREIGN KEY(flight_id) REFERENCES flights(flight_id)
);
