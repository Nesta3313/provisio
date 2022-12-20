DROP DATABASE IF EXISTS Provisio;

CREATE DATABASE Provisio;

USE Provisio;

CREATE TABLE hotel (
    hotel_ID int NOT NULL,
    hotel_name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    CONSTRAINT hotel_pk PRIMARY KEY (hotel_ID)
);

CREATE TABLE registrations (
    customer_ID int NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    CONSTRAINT registrations_pk PRIMARY KEY (customer_ID)

);

CREATE TABLE reservations (
    reservation_ID int NOT NULL,
    hotel_ID int NOT NULL,
    check_in varchar(255) NOT NULL,
    check_out varchar(255) NOT NULL,
    number_of_guest varchar(255) NOT NULL,
    customer_ID int NOT NULL,
    location varchar(255) NOT NULL,
    room_size varchar(255) NOT NULL,
    amenities varchar(255) NOT NULL,
    loyalty_points int NOT NULL,
    CONSTRAINT reservations_pk PRIMARY KEY (reservation_ID)
);

ALTER TABLE reservations ADD CONSTRAINT reservations_hotel_fk
    FOREIGN KEY (hotel_ID)
    REFERENCES hotel (hotel_ID);

ALTER TABLE reservations ADD CONSTRAINT reservations_customer_fk
    FOREIGN KEY (customer_ID)
	REFERENCES registrations (customer_ID);


INSERT INTO hotel VALUES (200, 'The Loft by Provisio', 'Chicago IL');
INSERT INTO hotel VALUES (404, 'Provisio Hotel', 'Atlanta GA');
INSERT INTO hotel VALUES (201, 'The Grand Provisio', 'Las Vegas, NV');

INSERT INTO registrations VALUES ( customer_id, 'Joe', 'Byron', 'byron@mail.com', 'AQnQ|86f}prU'); /*Byron123*/
INSERT INTO registrations VALUES ( customer_id, 'Tom', 'Holland', 'spiderverse@mail.net', 'AQnQ|M\^4ZKY'); /*Peter123*/
INSERT INTO registrations VALUES ( customer_id, 'Celine', 'Dion', 'celine@celine.com', '~MXQp9[ewZ6U');  /*Celine123*/

INSERT INTO reservations VALUES (222, 200, '2022-12-20', '2022-12-24', 2, 1, 'Chicago, IL', 'king', 'breakfast', 600);
INSERT INTO reservations VALUES (330, 404, '2023-01-13', '2023-01-14', 1, 2, 'Atlanta GA', 'queen', 'wi-fi', 150);
INSERT INTO reservations VALUES (3000, 201, '2022-11-08', '2022-11-10', '4-5', 3, 'Las vegas, NV', 'king', 'parking', 300);

