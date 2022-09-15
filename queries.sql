SELECT * FROM animals
WHERE name LIKE '%mon%';

SELECT * FROM animals
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
WHERE weight_kg >= 10.4 AND weight_kg<= 17.3;


-- TRANSACTION

BEGIN

UPDATE animals SET species ='unspecified';
SELECT * FROM animals;
ROLLBACK;

---------------
BEGIN

UPDATE animals SET species ='digimon' 
WHERE name LIKE '%mon%';

UPDATE animals SET species ='pokemon' 
WHERE species = '';

SELECT * FROM animals;
COMMIT;

---------------

BEGIN
TRUNCATE TABLE animals;
ROLLBACK;
SELECT * FROM animals;
-- BREATHING NORMALIY :) --- 
---------------

BEGIN
DELETE FROM animals WHERE date_of_birth >'2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = "weight_kg" * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals SET weight_kg = "weight_kg" * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

------------------------

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attmepts =0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attmepts) FROM animals GROUP BY neutered;

SELECT MIN(weight_kg) , MAX(weight_kg) FROM animals;

SELECT AVG(escape_attmepts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31';

-------------------------------------------------------------------

SELECT animals.name, owners.full_name As owners
FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE animals.owners_id = 5;


SELECT animals.name, species.name As Species
FROM animals
JOIN species ON animals.species_id = species.id
WHERE animals.species_id = 1;

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name, COUNT(animals.species_id)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT OWNERS.full_name, animals.name
FROM animals
LEFT JOIN owners ON owners.id = animals.owners_id
WHERE owners.id = 3 AND animals.species_id = 2;

SELECT owners.full_name As the_owner, animals.name
FROM animals
JOIN owners 
ON animals.owners_id = (SELECT owners_id FROM owners WHERE owners.full_name = 'Dean Winchester')
WHERE escape_attmepts = 0;


SELECT owners.full_name, COUNT(animals.owners_id) animals_number
FROM animals JOIN owners
ON animals.owners_id = owners.id
GROUP BY owners.full_name
ORDER BY animals_number DESC LIMIT 1;