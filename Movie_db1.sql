-- CREATE DATABASE movie_db;
 -- USE movie_db;

-- Create Table actor (
--     act_id      Integer     Not Null AUTO_INCREMENT,
--     act_fname   Char(20)    Not Null,
--     act_lname   Char(20)    Not Null,
--     act_gender  Char(1)     Null,
--     CONSTRAINT  act_pk      PRIMARY KEY(act_id)
-- );
-- INSERT INTO actor VALUES (1, 'Jim', 'Iyke', 'M');
-- INSERT INTO actor VALUES (2, 'Genevieve', 'Nnaji', 'F');

-- Create Table director (
--     dir_id      Integer     Not Null,
--     dir_fname   Char(20)    Not Null,
--     dir_lname   Char(20)    Not Null,
--     CONSTRAINT  dir_pk      PRIMARY KEY(dir_id)
-- );
-- INSERT INTO director VALUES (1, 'Sam', 'Immanuel');
-- INSERT INTO director VALUES (2, 'Patience', 'Gbemi');

-- Create Table genres (
--     gen_id      Integer     Not Null,
--     gen_title   Char(20)    Not Null,
--     CONSTRAINT  gen_pk      PRIMARY KEY(gen_id)
-- );
-- INSERT INTO genres VALUES (1, 'Action');
-- INSERT INTO genres VALUES (2, 'Comedy');

-- Create Table reviewer (
--     rev_id      Integer     Not Null,
--     rev_name   Char(30)    Not Null,
--     CONSTRAINT  rev_pk      PRIMARY KEY(rev_id)
-- );
-- INSERT INTO reviewer VALUES (1, 'David');
-- INSERT INTO reviewer VALUES (2, 'Yusuf');

-- Create Table movie (
--     mov_id          Integer     Not Null,
--     mov_title       Char(50)    Not Null,
--     mov_year        Integer     Not Null,
--     mov_time        Integer     Not Null,
--     mov_lang        Char(50)    Not Null,
--     mov_dt_rel      Date        Null,
--     mov_rel_country Char(5)     Not Null,
--     CONSTRAINT  mov_pk      PRIMARY KEY(mov_id)
-- );
-- INSERT INTO movie VALUES (1, 'Eyes Wide Shut', '1999', '12', 'English', '1990-09-01', 'Usa');
-- INSERT INTO movie VALUES (2, 'American Beauty', '1998', '12', 'English', '2012-07-01', 'Eng');
-- INSERT INTO movie VALUES (3, 'Guru Matolu', '1997', '12', 'English', '2012-07-01', 'Eng');


-- Create Table movie_genres (
-- mov_id int Not Null,
-- gen_id int Not Null,
-- CONSTRAINT mov_gen_pk PRIMARY KEY (mov_id, gen_id),
-- CONSTRAINT mov_fk FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
-- CONSTRAINT gen_fk FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
-- );
-- INSERT INTO movie_genres VALUES (1, 1);
-- INSERT INTO movie_genres VALUES (2, 2);

-- Create Table movie_direction (
-- dir_id int Not Null,
-- mov_id int Not Null,
-- CONSTRAINT mov_dir_pk PRIMARY KEY (dir_id, mov_id),
-- CONSTRAINT dir_fk FOREIGN KEY (dir_id) REFERENCES director(dir_id),
-- CONSTRAINT movie_fk FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
-- );
-- INSERT INTO movie_direction VALUES (1, 1);
-- INSERT INTO movie_direction VALUES (2, 2);

-- Create Table movie_cast (
-- act_id int Not Null,
-- mov_id int Not Null,
-- role   Char(30) Not Null,
-- CONSTRAINT mov_cast_pk PRIMARY KEY (act_id, mov_id),
-- CONSTRAINT act_fk FOREIGN KEY (act_id) REFERENCES actor(act_id),
-- CONSTRAINT movie1_fk FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
-- );
-- INSERT INTO movie_cast VALUES (1, 1, 'Lead');
-- INSERT INTO movie_cast VALUES (2, 2, 'Support');

-- Create Table rating (
-- mov_id int Not Null,
-- rev_id int Not Null,
-- rev_stars   int Null,
-- num_o_ratings int Null, 
-- CONSTRAINT rating_pk PRIMARY KEY (mov_id, rev_id),
-- CONSTRAINT movie2_fk FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
-- CONSTRAINT rev_fk FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
-- );
-- INSERT INTO rating VALUES (1, 1, 7, null);


-- show tables;
-- select * from movie;
SELECT mov_title, mov_year
FROM movie;

SELECT mov_year 
FROM movie 
WHERE mov_title = 'American Beauty';

SELECT mov_title 
FROM movie 
WHERE mov_year = 1999;

SELECT * 
FROM movie 
WHERE mov_year < 1998;

SELECT mov_title 
FROM movie 
WHERE mov_year = 1999;

SELECT rev_name 
FROM reviewer 
UNION SELECT mov_title 
FROM movie;

SELECT rev_name 
FROM reviewer 
WHERE rev_id 
IN(SELECT rev_id 
	FROM rating 
    WHERE rev_stars >= 7);
    
SELECT mov_title 
FROM movie 
WHERE mov_id 
IN(SELECT mov_id 
	FROM rating 
    WHERE num_o_ratings 
    IS NULL);
    
SELECT rev_name 
FROM reviewer 
WHERE rev_id 
IN(SELECT rev_id 
	FROM rating 
    WHERE num_o_ratings 
    IS NULL);
    
SELECT DISTINCT movie.mov_title, director.dir_fname, director.dir_lname
FROM movie, director
WHERE movie.mov_title = 'Eyes Wide Shut';



