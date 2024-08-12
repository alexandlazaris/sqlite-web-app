DROP TABLE console;

CREATE TABLE RegisteredConsole (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    yearCreated DATE NOT NULL,
    manufacturer VARCHAR NOT NULL,
    type VARCHAR NOT NULL
);

CREATE TABLE AvailableConsoles (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    manufacturer VARCHAR NOT NULL,
    type VARCHAR NOT NULL
);
