DROP TABLE IF EXISTS users,guns,skinvariants,gunskinvariant,cart,itemsincart CASCADE;

--Example of how to create a TABLE --
CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    email VARCHAR(75) NOT NULL,
    password VARCHAR(24) NOT NULL,
    username VARCHAR(25) NOT NULL
);

CREATE TABLE guns (
    gunid serial primary key,
    gunname VARCHAR(25) NOT NULL
);

CREATE TABLE skinvariants (
    variantid serial primary key,
    variantname VARCHAR(25) NOT NULL
);

CREATE TABLE gunskinvariant (
    gunid INTEGER REFERENCES guns(gunid),
    variantid INTEGER REFERENCES skinvariants(variantid),
    price FLOAT NOT NULL,
    quantity INTEGER NOT NULL,
    image VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY(gunid,variantid) -- add multiple primary keys
);

CREATE TABLE cart (
    cartid serial primary key,
    userid INTEGER REFERENCES users(userid),
    status CHAR(1) CHECK(status IN ('pending','done')), 
    total FLOAT,
    completeddate TIMESTAMP
);

-- Example of Relational table --
CREATE TABLE itemsincart(
    cartid INTEGER REFERENCES cart(cartid),
    gunid INTEGER REFERENCES guns(gunid),
    variantid INTEGER REFERENCES skinvariants(variantid),
    quantity INTEGER NOT NULL,
    FOREIGN KEY(gunid,variantid) REFERENCES gunskinvariant(gunid,variantid), -- Add multiple FOREIGN key from multiple primary keys
    PRIMARY KEY (cartid,gunid,variantid) 
);

INSERT INTO guns (gunname) 
VALUES 
('Phantom'),
('Vandal'),
('Sheriff'),
('Classic'),
('Frenzy'),
('Ghost'),
('Shorty'),
('Stinger'),
('Spectre'),
('Bucky'),
('Judge'),
('Guardian'),
('Marshall'),
('Operator'),
('Odin'),
('Ares'),
('Bulldog')
-- init.sql -> You type the schema aka the tables for the database