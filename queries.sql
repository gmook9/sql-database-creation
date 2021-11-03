USE gmook_cs355sp21; 

-- query 1
-- creates view
CREATE VIEW CityAndName AS
SELECT  current_city, username
FROM  profile
WHERE current_city = 'Sacramento';



-- query 2

 CREATE OR REPLACE VIEW number_of_user AS
 (SELECT count(*)
 FROM profile);
 
 SELECT count(*) AS 'Number of users in system' FROM number_of_user;
 
 
 -- query 3
 
UPDATE profile
SET users_resume = 'accepted'
WHERE users_resume IN (
SELECT users_resume FROM profile a WHERE
a.users_resume = 'exists');

-- query 4

SELECT * from profile a JOIN profile_city_looking_for_job b
ON a.username = b.username;

-- query 4
-- returns total number of profiles
SELECT distinct count(*) AS "number of users" from profile;

-- query 5
-- returns non repeated edu emails
SELECT distinct(non_edu_email) FROM user_non_student;

--query 6
--if a city is in the system then it shows all cities
  SELECT current_city
    FROM profile
    WHERE EXISTS
    ( SELECT current_city
    FROM profile
    WHERE current_city = 'Roseville'
    );
	
	
--query 7
--gives usernames of those in selected cities
SELECT current_city, username
FROM profile
WHERE current_city IN ('Folsom','Galt');
    
	
--query 8
--shows cities that have active resumes for companies and freelancers to view
SELECT current_city, users_resume
FROM profile
WHERE users_resume IN ('exist')
GROUP BY current_city
HAVING COUNT(current_city) >= 1
ORDER BY current_city;
    
--query 9
SELECT email FROM freelancer
UNION
SELECT city FROM profile_city_looking_for_job;


--query 10
--Can be used to determine username of a city if a resume exists on file
DROP FUNCTION IF EXISTS function_a;

DELIMITER //

CREATE FUNCTION function_a
(
    input_city VARCHAR(40)
)
RETURNS VARCHAR(255)
BEGIN
DECLARE var VARCHAR(255);
set var = ( SELECT username FROM profile 
WHERE current_city = input_city AND
users_resume LIKE 'exist'
);
RETURN var;
END; //

DELIMITER ;

SELECT function_a('Sacramento');
	