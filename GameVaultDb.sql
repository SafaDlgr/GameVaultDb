
-- DATABASE 
CREATE DATABASE gamevault;
USE gamevault;


-- 1. DEVELOPERS
CREATE TABLE developers (
    id INT IDENTITY(1,1) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    founded_year INT,
    CONSTRAINT PK_developers PRIMARY KEY (id)
);

-- 2. GAMES
CREATE TABLE games (
    id INT IDENTITY(1,1) NOT NULL,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    release_date DATE,
    rating DECIMAL(3,1),
    developer_id INT NOT NULL,
    CONSTRAINT PK_games PRIMARY KEY (id),
    CONSTRAINT FK_games_developers
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
);
-- 3. GENRES
CREATE TABLE genres (
    id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    CONSTRAINT PK_genres PRIMARY KEY (id)
);

--4. GAMES-GENRES
CREATE TABLE games_genres (
    id INT IDENTITY(1,1) NOT NULL,
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT PK_games_genres PRIMARY KEY (id),
    CONSTRAINT FK_games_genres_game
        FOREIGN KEY (game_id)
        REFERENCES games(id),
    CONSTRAINT FK_games_genres_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
       
);

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda', 'USA', 1986),
('Valve', 'USA', 1996),
('Ubisoft', 'France', 1986);


INSERT INTO genres (name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'Open world exploration'),
('Horror', 'Scary and tense atmosphere'),
('FPS', 'First Person Shooter'),
('Sports', 'Sports based games');


INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 799.99, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 699.99, '2020-12-10', 8.0, 1),
('GTA V', 899.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 999.99, '2018-10-26', 9.8, 2),
('Skyrim', 499.99, '2011-11-11', 9.4, 3),
('DOOM Eternal', 599.99, '2020-03-20', 8.8, 3),
('Half-Life 2', 299.99, '2004-11-16', 9.6, 4),
('CS:GO', 0.00, '2012-08-21', 9.0, 4),
('Assassin’s Creed Valhalla', 749.99, '2020-11-10', 8.6, 5),
('Far Cry 6', 699.99, '2021-10-07', 8.2, 5);


INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),          -- The Witcher 3 - RPG, Open World
(2, 1), (2, 2),          -- Cyberpunk 2077
(3, 2),                  -- GTA V - Open World
(4, 2),                  -- RDR2 - Open World
(5, 1), (5, 2),          -- Skyrim
(6, 4),                  -- DOOM Eternal - FPS
(7, 4),                  -- Half-Life 2 - FPS
(8, 4),                  -- CS:GO - FPS
(9, 1), (9, 2),          -- AC Valhalla
(10, 2);                 -- Far Cry 6


-- %10 indirim
UPDATE games
SET price = price * 0.90;


-- Cyberpunk 2077 rating güncelleme
UPDATE games
SET rating = 9.0
WHERE title = 'Cyberpunk 2077';


DELETE FROM games
WHERE title = 'CS:GO';

-- Tüm oyunlar ve geliþtiricileri
SELECT 
    g.title,
    g.price,
    d.company_name
FROM games g
JOIN developers d ON g.developer_id = d.id;


-- RPG oyunlarý
SELECT 
    g.title,
    g.rating
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres gr ON gg.genre_id = gr.id
WHERE gr.name = 'RPG';

-- 500 TL üzeri oyunlar
SELECT title, price
FROM games
WHERE price > 500
ORDER BY price DESC;

-- Ýçinde "i" geçen oyunlar
SELECT title
FROM games
WHERE title LIKE '%i%';


