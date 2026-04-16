-- Base de dades teòrica per l'Observatori Blaugrana
-- Projecte Intermodular (1r DAW)

CREATE DATABASE IF NOT EXISTS fcb_observatori_db;
USE fcb_observatori_db;

-- 1. Taula 'jugadors'
-- Guarda la informació central i física dels membres de la plantilla.
CREATE TABLE jugadors (
    id_jugador INT PRIMARY KEY,
    nom_complet VARCHAR(100) NOT NULL,
    dorsal INT UNIQUE NOT NULL,
    posicio ENUM('POR', 'DEF', 'MIG', 'DEL') NOT NULL,
    dades_url_foto VARCHAR(255)
);

-- 2. Taula 'estadistiques'
-- Relació 1 a 1 amb jugadors per desacoblar les xifres canviants
CREATE TABLE estadistiques (
    id_jugador INT PRIMARY KEY,
    gols_anotats INT DEFAULT 0,
    assistencies INT DEFAULT 0,
    targetes_grogues INT DEFAULT 0,
    targetes_vermelles INT DEFAULT 0,
    FOREIGN KEY (id_jugador) REFERENCES jugadors(id_jugador) ON DELETE CASCADE
);

-- 3. Taula 'finances'
-- Registra els costos contractuals de cada jugador
CREATE TABLE finances (
    id_jugador INT PRIMARY KEY,
    salari_anual DECIMAL(15,2) NOT NULL,
    valor_mercat DECIMAL(15,2) NOT NULL,
    clausula_rescisio DECIMAL(15,2),
    FOREIGN KEY (id_jugador) REFERENCES jugadors(id_jugador) ON DELETE CASCADE
);

-- 4. Taula 'infermeria'
-- Registra la salut mèdica. Si un jugador hi apareix, es que està lesionat.
CREATE TABLE infermeria (
    id_part_medic INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    tipus_lesio VARCHAR(150) NOT NULL,
    data_lesio DATE DEFAULT CURRENT_DATE,
    temps_baixa_estimat_dies INT,
    FOREIGN KEY (id_jugador) REFERENCES jugadors(id_jugador) ON DELETE CASCADE
);

-- ----------------------------------------------------
-- EXEMPLES D'INSERCIÓ PER TESTEJAR LES CONSULTES (DML)
-- ----------------------------------------------------

INSERT INTO jugadors (id_jugador, nom_complet, dorsal, posicio) VALUES 
(19, 'Lamine Yamal', 19, 'DEL'),
(8, 'Pedri', 8, 'MIG'),
(1, 'Marc-André ter Stegen', 1, 'POR');

INSERT INTO estadistiques (id_jugador, gols_anotats, assistencies, targetes_grogues) VALUES
(19, 6, 8, 1),
(8, 3, 5, 0),
(1, 0, 0, 0);

INSERT INTO finances (id_jugador, salari_anual, valor_mercat) VALUES
(19, 1600000.00, 150000000.00),
(8, 5000000.00, 90000000.00),
(1, 6300000.00, 35000000.00);

-- Ingressem a Ter Stegen a l'hospital
INSERT INTO infermeria (id_jugador, tipus_lesio, temps_baixa_estimat_dies) VALUES
(1, 'Trencament del tendó rotulià de la cama dreta', 240);
