SELECT * FORM animals
WHERE name LIKE '%mon%';

SELECT * FORM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals 
WHERE neutered = b'1' AND escape_attmepts < 3;


SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attmepts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals 
WHERE neutered = b'1';

SELECT * FROM animals 
WHERE name != 'Gabumon';

SELECT * FROM animals 
WHERE weight_kg >= 10.4 AND eight_kg<= 17.3;