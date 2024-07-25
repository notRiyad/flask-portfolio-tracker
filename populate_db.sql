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

INSERT INTO referentielfonds (name, description) VALUES
('Fonds Alpha', 'Un fonds équilibré avec un portefeuille diversifié.'),
('Fonds Beta', 'Fonds de croissance avec une orientation technologique.'),
('Fonds Gamma', 'Fonds axé sur les énergies renouvelables.'),
('Fonds Delta', 'Fonds conservateur avec une faible volatilité.');

INSERT INTO referentielinstruments (name, type, fond_id) VALUES
('Apple Inc.', 'Action', 1),
('Microsoft Corp.', 'Action', 1),
('Alphabet Inc.', 'Action', 1),
('Tesla Inc.', 'Action', 2),
('Amazon.com Inc.', 'Action', 2),
('NVIDIA Corp.', 'Action', 2),
('NextEra Energy', 'Action', 3),
('First Solar', 'Action', 3),
('Vestas Wind Systems', 'Action', 3),
('Coca-Cola Co.', 'Action', 4),
('Procter & Gamble Co.', 'Action', 4),
('Johnson & Johnson', 'Action', 4),
('Meta Platforms Inc.', 'Action', 1),
('Adobe Inc.', 'Action', 2),
('Salesforce Inc.', 'Action', 2),
('Brookfield Renewable Partners', 'Action', 3),
('SunPower Corp.', 'Action', 3),
('Brookfield Infrastructure Partners', 'Action', 4),
('PepsiCo Inc.', 'Action', 4),
('Unilever PLC', 'Action', 4);

INSERT INTO positions (instrument_id, fond_id, poids) VALUES
(1, 1, 25.00),
(2, 1, 25.00),
(3, 1, 50.00),
(4, 2, 40.00),
(5, 2, 30.00),
(6, 2, 30.00),
(7, 3, 50.00),
(8, 3, 30.00),
(9, 3, 20.00),
(10, 4, 30.00),
(11, 4, 20.00),
(12, 4, 50.00),
(15, 2, 15.00),
(16, 2, 15.00),
(17, 3, 20.00),
(18, 3, 40.00),
(19, 4, 25.00),
(20, 4, 25.00);