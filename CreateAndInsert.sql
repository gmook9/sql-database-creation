USE gmook_cs355sp21; 

DROP TABLE IF EXISTS user_non_student;
DROP TABLE IF EXISTS user_company;
DROP TABLE IF EXISTS user_freelancer;
DROP TABLE IF EXISTS freelancer_profile;
DROP TABLE IF EXISTS company_profile;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS non_student;
DROP TABLE IF EXISTS profile_city_looking_for_job;
DROP TABLE IF EXISTS freelancer;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS user;

CREATE TABLE student (
student_id varchar(255),
PRIMARY KEY (student_id)
);


INSERT INTO student (student_id) VALUES
  (1234),
  (2342),
  (4455),
  (4546),
  (7764),
  (0900),
  (1432),
  (3425),
  (5453),
  (4294);


CREATE TABLE user (
user_id int,
student_id varchar(255),
username TEXT,
PRIMARY KEY (user_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

INSERT INTO user (user_id, student_id, username) VALUES
  (1337, 1234, 'Array'),
  (1776, 2342, 'Cracked'),
  (1999, 4455, 'Grid'),
   (1992, 4546, 'Hanoi'),
   (1993, 7764, 'Radiation'),
   (1994, 0900, 'Jungle'),
   (1995, 1432, 'Launch'),
   (1996, 3425, 'Havana'),
   (1777, 5453, 'Cracked');
   

CREATE TABLE profile (
users_resume TEXT,
current_city TEXT,
username VARCHAR(255),
PRIMARY KEY (username)
);

INSERT INTO profile (users_resume, current_city, username) VALUES
  ('exist', 'San Francisco', 'Array'),
  ('exist', 'Roseville' ,'Cracked'),
  ('does not exist', 'Folsom', 'Grid'),
  ('does not exist', 'El Dorado Hills', 'Hanoi'),
  ('exist', 'Sacramento', 'Radiation'),
  ('does not exist', 'Fair Oaks', 'Jungle'),
  ('exist', 'South Lake Tahoe', 'Launch'),
  ('does not exist', 'Galt', 'Havana'),
  ('exist', 'clearlake', 'Moon');
  

CREATE TABLE freelancer (
email VARCHAR(40),
PRIMARY KEY (email)
);

INSERT INTO freelancer (email) VALUES
	('subbase.com'),
    ('underpass@gmail.com'),
    ('Afghan@gmail.com'),
    ('Favela@gmail.com'),
    ('Karachi@gmail.com'),
    ('Quarry@hotmail.com'),
    ('Estate@earwax.com'),
    ('highrise@muffins.com'),
  ('wasteland@msn.com');

CREATE TABLE company (
company_name VARCHAR(40),
PRIMARY KEY (company_name)
);

INSERT INTO company (company_name) VALUES
	('airfield'),
    ('cliffside'),
    ('makin'),
    ('seelow'),
    ('dome'),
    ('roundhouse'),
    ('castle'),
    ('station'),
    ('verruckt');


CREATE TABLE non_student (
non_edu_email VARCHAR(100),
PRIMARY KEY (non_edu_email)
);

INSERT INTO non_student (non_edu_email) VALUES
  ('CORNPuff@gmail.com'),
  ('DonaldDuck@gmail.com'),
  ('Please@gmail.com'),
  ('give@gmail.com'),
  ('me@gmail.com'),
  ('a@gmail.com'),
  ('good@gmail.com'),
  ('grade@gmail.com'),
  ('thanks@gmail.com');

CREATE TABLE profile_city_looking_for_job (
city varchar(255),
username varchar(255),
FOREIGN KEY (username) REFERENCES profile(username)
);

INSERT INTO profile_city_looking_for_job (city, username) VALUES
('San Diego' , 'Array'),
('Sacramento', 'Cracked'),
('China', 'Grid'),
('Folsom', 'Hanoi'),
('FairOaks', 'Radiation'),
('Southland', 'Jungle'),
('newport', 'Launch'),
('bodega', 'Havana'),
('clearlake', 'Moon');


CREATE TABLE user_non_student (
user_id int,
non_edu_email varchar(100),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (non_edu_email) REFERENCES non_student(non_edu_email)
);


INSERT INTO user_non_student (user_id, non_edu_email) VALUES
  (1337, 'CORNPuff@gmail.com'),
  (1776, 'DonaldDuck@gmail.com'),
  (1999, 'Please@gmail.com'),
  (1992, 'give@gmail.com'),
  (1993, 'me@gmail.com'),
  (1994, 'a@gmail.com'),
  (1995, 'good@gmail.com'),
  (1996, 'grade@gmail.com'),
  (1777, 'thanks@gmail.com');
  
  
  CREATE TABLE user_company (
user_id int,
company_name varchar(40),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (company_name) REFERENCES company(company_name)
);

INSERT INTO user_company (user_id, company_name) VALUES
	(1337, 'airfield'),
    (1776, 'cliffside'),
    (1999, 'makin'),
    (1992, 'seelow'),
    (1993, 'dome'),
    (1994, 'roundhouse'),
    (1995, 'castle'),
    (1996, 'station'),
    (1777, 'verruckt');
  
  
  CREATE TABLE user_freelancer (
user_id int,
email varchar(40),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (email) REFERENCES freelancer(email)
);

INSERT INTO user_freelancer  (user_id, email) VALUES
	(1337, 'subbase.com'),
    (1776, 'underpass@gmail.com'),
    (1999, 'Afghan@gmail.com'),
    (1992, 'Favela@gmail.com'),
    (1993, 'Karachi@gmail.com'),
    (1994, 'Quarry@hotmail.com'),
    (1995, 'Estate@earwax.com'),
    (1996, 'highrise@muffins.com'),
  (1777, 'wasteland@msn.com');
  


  CREATE TABLE freelancer_profile (
username varchar(255),
email varchar(40),
FOREIGN KEY (username) REFERENCES profile(username),
FOREIGN KEY (email) REFERENCES freelancer(email)
);

INSERT INTO freelancer_profile (email, username) VALUES
  ( 'subbase.com', 'Array'),
  ('underpass@gmail.com', 'Cracked'),
  ('Afghan@gmail.com','Grid'),
  ( 'highrise@muffins.com', 'Hanoi'),
  ('Favela@gmail.com','Radiation'),
  ( 'Karachi@gmail.com','Jungle'),
  ('Quarry@hotmail.com','Launch'),
  ('Estate@earwax.com','Havana'),
  ( 'wasteland@msn.com' ,'Moon');
  
CREATE TABLE company_profile (
username varchar(255),
company_name varchar(40),
FOREIGN KEY (company_name) REFERENCES company(company_name),
FOREIGN KEY (username) REFERENCES profile(username)
);

INSERT INTO company_profile (company_name, username) VALUES
  ('airfield', 'Array'),
  ('cliffside', 'Cracked'),
  ('makin','Grid'),
  ('seelow', 'Hanoi'),
  ('dome','Radiation'),
  ('roundhouse','Jungle'),
  ('castle','Launch'),
  ('station','Havana'),
  ('verruckt' ,'Moon');
  
