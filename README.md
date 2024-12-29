# BookMyShow: Problem Solving Case

BookMyShow is a ticketing platform that allows users to book tickets for movie shows. This project involves designing the database schema, creating SQL tables, populating them with sample data, and implementing queries to retrieve specific data based on user input.

---

## Project Overview

### Objective
The primary goal of this project is to:
1. List all entities, their attributes, and table structures.
2. Ensure the database follows 1NF, 2NF, 3NF, and BCNF normalization rules.
3. Write SQL queries to:
   - Create the required tables.
   - Insert sample data into the tables.
   - Retrieve all shows on a given date at a given theatre.
4. Provide the solution as a PR on GitHub.

---

## Entities and Attributes

### 1. Theatre
| Attribute    | Type        | Description                   |
|--------------|-------------|-------------------------------|
| theatre_id   | INT (PK)    | Unique identifier for theatre |
| name         | VARCHAR(100)| Name of the theatre           |
| location     | VARCHAR(100)| Location of the theatre       |

### 2. Movie
| Attribute    | Type        | Description                   |
|--------------|-------------|-------------------------------|
| movie_id     | INT (PK)    | Unique identifier for movie   |
| title        | VARCHAR(100)| Title of the movie            |
| genre        | VARCHAR(50) | Genre of the movie            |
| duration     | INT         | Duration of the movie (mins)  |

### 3. Show
| Attribute    | Type        | Description                   |
|--------------|-------------|-------------------------------|
| show_id      | INT (PK)    | Unique identifier for show    |
| theatre_id   | INT (FK)    | Theatre associated with show  |
| movie_id     | INT (FK)    | Movie associated with show    |
| show_date    | DATE        | Date of the show              |
| show_time    | TIME        | Time of the show              |

---

## SQL Queries

### 1. Table Creation Queries
```sql
-- Create Theatre Table
CREATE TABLE Theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Create Movie Table
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    duration INT NOT NULL
);

-- Create Show Table
CREATE TABLE Show (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
```

### 2. Insert Sample Data
```sql
-- Insert data into Theatre Table
INSERT INTO Theatre (name, location) VALUES 
('Cineplex', 'Downtown'), 
('MovieTown', 'Midtown');

-- Insert data into Movie Table
INSERT INTO Movie (title, genre, duration) VALUES 
('Avengers', 'Action', 120), 
('Frozen', 'Animation', 90);

-- Insert data into Show Table
INSERT INTO Show (theatre_id, movie_id, show_date, show_time) VALUES 
(1, 1, '2024-12-30', '14:00:00'),
(1, 2, '2024-12-30', '16:00:00'),
(2, 1, '2024-12-30', '18:00:00');
```

### 3. Query to Retrieve Shows
```sql
SELECT 
    Show.show_time, 
    Movie.title 
FROM Show 
JOIN Movie ON Show.movie_id = Movie.movie_id 
WHERE Show.theatre_id = ? AND Show.show_date = ?;
```

---

## ER Diagram

The ER diagram for the system is attached as a file in this repository.

---

## Steps to Run the Project

### 1. Prerequisites
- MySQL installed locally or on a server.
- Node.js environment.
- MySQL Workbench or any SQL client tool.

### 2. Clone the Repository
```bash
git clone <repository-url>
cd bookmyshow
```

### 3. Set Up the Database
1. Run the SQL scripts from `scripts.sql` to create the database and tables.
2. Insert the sample data.


