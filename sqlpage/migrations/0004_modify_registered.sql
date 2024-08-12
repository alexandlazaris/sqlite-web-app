DROP TABLE RegisteredConsole;

CREATE TABLE RegisteredConsoles (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    manufacturer VARCHAR NOT NULL,
    type VARCHAR NOT NULL
);