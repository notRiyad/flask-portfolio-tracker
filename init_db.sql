CREATE DATABASE IF NOT EXISTS portefeuille_db;
USE portefeuille_db;

CREATE TABLE IF NOT EXISTS referentielfonds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS referentielinstruments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    fond_id INT,
    FOREIGN KEY (fond_id) REFERENCES referentielfonds(id)
);

CREATE TABLE IF NOT EXISTS positions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    instrument_id INT,
    fond_id INT,
    poids DECIMAL(5, 2),
    FOREIGN KEY (instrument_id) REFERENCES referentielinstruments(id),
    FOREIGN KEY (fond_id) REFERENCES referentielfonds(id)
);
