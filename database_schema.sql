-- Base de Datos para Simulador de Míster
-- Diseñado para el módulo de Bases de Datos (1º DAW)

CREATE DATABASE IF NOT EXISTS mister_fcb;
USE mister_fcb;

-- Taula d'usuaris (Gestió dels jugadors del simulador)
CREATE TABLE usuaris (
    id_usuari INT AUTO_INCREMENT PRIMARY KEY,
    nom_usuari VARCHAR(50) NOT NULL UNIQUE,
    correu VARCHAR(100) NOT NULL UNIQUE,
    contrasenya VARCHAR(255) NOT NULL, -- S'ha d'encriptar (Bcrypt/Argon2)
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pressupost_actual DECIMAL(15,2) DEFAULT 250000000.00
);

-- Taula de plantilla/jugadors (Mercat i dades fixes)
CREATE TABLE jugadors (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nom_complet VARCHAR(100) NOT NULL,
    posicio ENUM('POR', 'DEF', 'MIG', 'DEL') NOT NULL,
    mitjana INT NOT NULL CHECK(mitjana BETWEEN 50 AND 99),
    preu_mercat DECIMAL(12,2) NOT NULL,
    salari DECIMAL(12,2) NOT NULL,
    nacionalitat VARCHAR(50)
);

-- Inserció d'un usuari de prova
INSERT INTO usuaris (nom_usuari, correu, contrasenya) 
VALUES ('admin', 'admin@fcb.cat', '123456');

-- Inserció manual d'alguns jugadors de prova (L'aplicació carrega via JSON però la BD persistiria aquesta informació si fos full-stack)
INSERT INTO jugadors (nom_complet, posicio, mitjana, preu_mercat, salari, nacionalitat) VALUES
('Lamine Yamal', 'DEL', 86, 120000000.00, 150000.00, 'Spain'),
('Pedri', 'MIG', 86, 80000000.00, 240000.00, 'Spain'),
('Marc-André ter Stegen', 'POR', 89, 35000000.00, 105000.00, 'Germany'),
('Ronald Araujo', 'DEF', 86, 70000000.00, 210000.00, 'Uruguay');

-- Taula per vincular quins jugadors pertanyen a cada usuari (El "Save State")
CREATE TABLE plantilla_usuari (
    id_usuari INT,
    id_jugador INT,
    estatus ENUM('starter', 'bench', 'none') DEFAULT 'none',
    PRIMARY KEY (id_usuari, id_jugador),
    FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari) ON DELETE CASCADE,
    FOREIGN KEY (id_jugador) REFERENCES jugadors(id_jugador) ON DELETE CASCADE
);
