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
    reg_date DATE NOT NULL,
    reg_time TIME NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant.staff (
    staff_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant.staff_cuisine (
    staff_id VARCHAR(8) NOT NULL REFERENCES restaurant.staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
    cuisine VARCHAR(100) NOT NULL REFERENCES restaurant.cuisine(name) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (staff_id, cusine)
);
CREATE TABLE IF NOT EXISTS restaurant.order (
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    order_id CHAR(11) NOT NULL,
    payment_type VARCHAR(4) NOT NULL CHECK (payment_type IN ('card', 'cash')),
    card_num CHAR(19),
    card_type VARCHAR(50) CHECK (
        CASE
            WHEN payment_type = 'card' THEN card_type IN ('americanexpress', 'visa', 'mastercard')
            ELSE card_type IS NULL
        END
    ),
    item VARCHAR(100) NOT NULL REFERENCES restaurant.menu(item),
    total_price NUMERIC(10, 2),
    phone CHAR(8) NULL REFERENCES restaurant.registration(phone),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    staff_id VARCHAR(8) NOT NULL REFERENCES restaurant.staff(staff_id)
);
