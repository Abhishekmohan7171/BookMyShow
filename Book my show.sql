CREATE DATABASE BookMyShow; 
USE BookMyShow; 
SELECT DATABASE();

show tables;

-- P1
-- Create Theatre Table
CREATE TABLE Theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Create Movie Table
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    language VARCHAR(50),
    genre VARCHAR(100),
    duration TIME
);

-- Create Show Table
CREATE TABLE Shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    screen VARCHAR(50),
    format VARCHAR(10),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Insert data into Theatre
INSERT INTO Theatre (theatre_name, location)
VALUES 
('PVR: Nexus', 'Forum Mall'),
('INOX', 'City Center');

-- Insert data into Movie
INSERT INTO Movie (movie_name, language, genre, duration)
VALUES 
('Dasara', 'Telugu', 'Action', '02:36:00'),
('Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', 'Drama', '02:32:00'),
('Tu Jhoothi Main Makkaar', 'Hindi', 'Romance', '02:59:00'),
('Avatar: The Way of Water', 'English', 'Sci-Fi', '03:12:00');

-- Insert data into Show
INSERT INTO Shows (theatre_id, movie_id, show_date, show_time, screen, format)
VALUES
(1, 1, '2024-12-21', '12:15:00', 'Screen 1', '2D'),
(1, 2, '2024-12-21', '10:00:00', 'Screen 2', '2D'),
(1, 3, '2024-12-21', '13:15:00', 'Screen 1', '2D'),
(1, 4, '2024-12-21', '17:30:00', 'Screen 3', '3D');

SELECT * FROM Theatre;
SELECT * FROM Movie;
SELECT * FROM Shows;
SELECT * FROM Theatre,Movie,Shows;


-- P2
-- List all shows for a specific date and theatre
SELECT 
    T.theatre_name,
    M.movie_name,
    S.show_date,
    S.show_time,
    S.screen,
    S.format
FROM 
    Shows S
JOIN 
    Theatre T ON S.theatre_id = T.theatre_id
JOIN 
    Movie M ON S.movie_id = M.movie_id
WHERE 
    S.show_date = '2024-12-21' AND T.theatre_name = 'PVR: Nexus';

