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

------------------------ LAST ANIMAL SEEN BY wILLIAM

SELECT * FROM visits 
WHERE vets_id = 1 ORDER BY date_of_visit DESC LIMIT 1;

------------------------ DIFFERENT ANIMAL STEPHANIE SEE

SELECT COUNT(animals_id) FROM visits 
WHERE vets_id = 3;

------------------------ List all vets and their specialties, including vets with no specialties

SELECT name ,  specializations.vets_id, specializations.species_id FROM vets
left JOIN specializations ON vets.id = vets_id; 

------------------------all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT * FROM visits WHERE vets_id = 3
AND date_of_visit >= '2020-04-01' AND date_of_visit <= '2020-08-30';

------------------------max visit

SELECT animals.name , COUNT(visits.animals_id) AS num_of_visits FROM visits
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY num_of_visits DESC LIMIT 1;

------------------------Who was Maisy Smith's first visit?

SELECT * FROM visits WHERE vets_id = 2 
ORDER BY date_of_visit LIMIT 1 ;

------------------------ Detials?

SELECT animals.* , vets.* , visits.date_of_visit FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
ORDER BY date_of_visit DESC LIMIT 1;

------------------------ How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(animals_id) FROM visits WHERE vets_id = 2;



