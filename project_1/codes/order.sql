TRUNCATE TABLE restaurant.order_item;
TRUNCATE TABLE restaurant.order;
INSERT INTO restaurant.order
VALUES (
        '2024-03-01 12:19:23',
        '20240301002',
        'card',
        '5108-7574-2920-6803',
        'mastercard',
        14,
        '93627414'
    );
INSERT INTO restaurant.order_item
VALUES (
        '20240301002',
        'Ayam Balado',
        'STAFF-03'
    );
INSERT INTO restaurant.order_item
VALUES (
        '20240301002',
        'Ayam Balado',
        'STAFF-04'
    );