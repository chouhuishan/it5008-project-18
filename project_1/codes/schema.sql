CREATE SCHEMA IF NOT EXISTS restaurant;
SET search_path TO restaurant;
CREATE TABLE IF NOT EXISTS restaurant.cuisine (name VARCHAR(256) PRIMARY KEY);
CREATE TABLE IF NOT EXISTS restaurant.menu (
    item VARCHAR(100) PRIMARY KEY,
    price NUMERIC(6, 2) NOT NULL CHECK (price > 0),
    -- (6,2): Precision = 6, Scale = 2 (2 digits after dp)
    cuisine VARCHAR(100) NOT NULL REFERENCES restaurant.cuisine(name) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS restaurant.registration (
    phone CHAR(8) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    registration_ts TIMESTAMP NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant.staff (
    staff_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant.staff_cuisine (
    staff_id VARCHAR(8) NOT NULL REFERENCES restaurant.staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
    cuisine_name VARCHAR(100) NOT NULL REFERENCES restaurant.cuisine(name) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (staff_id, cusine_name)
);
CREATE TABLE IF NOT EXISTS restaurant.order_item (
    order_id VARCHAR(11) NOT NULL REFERENCES restaurant.order(order_id),
    phone CHAR(8) NULL REFERENCES restaurant.registration(phone),
    item VARCHAR(100) NOT NULL REFERENCES restaurant.menu(item),
    staff_id VARCHAR(8) NOT NULL REFERENCES restaurant.staff(staff_id)
);
CREATE TABLE IF NOT EXISTS restaurant.order (
    order_ts TIMESTAMP NOT NULL,
    order_id VARCHAR(11) PRIMARY KEY,
    payment_type VARCHAR(4) NOT NULL CHECK (payment_type IN ('card', 'cash')),
    card_num VARCHAR(19) NOT NULL,
    card_type VARCHAR(50) NOT NULL,
    total_price NUMERIC(10, 2)
);