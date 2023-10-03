-- Active: 1696339043551@@127.0.0.1@3306

-- Práticas

CREATE TABLE
    licenses (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        register_number TEXT UNIQUE NOT NULL,
        category TEXT NOT NULL
    );

SELECT * FROM licenses;

CREATE TABLE
    drivers(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        license_id TEXT UNIQUE NOT NULL,
        FOREIGN KEY (license_id) REFERENCES licenses(id)
    );

SELECT * FROM drivers;

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    phones(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id)
    );

DROP TABLE phones;

SELECT * FROM phones;

INSERT INTO users
VALUES (
        'u001',
        'Luan',
        'luan@email.com',
        'luan123'
    ), (
        'u002',
        'Luana',
        'luana@email.com',
        'luan123'
    ), (
        'u003',
        'Luano',
        'luano@email.com',
        'luan123'
    );

INSERT INTO phones
VALUES ('p001', '912345678', 'u002'), ('p002', '900002211', 'u002'), ('p003', '911110041', 'u001');

SELECT * FROM phones;

SELECT
    users.id,
    users.name,
    phones.id,
    phones.phone_number
FROM users
    INNER JOIN phones ON users.id = phones.user_id
WHERE
    phones.phone_number LIKE '%5678';