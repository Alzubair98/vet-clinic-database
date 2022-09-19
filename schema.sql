CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_brith DATE NOT NULL,
    escape_attmepts INT NOT NULL,
    neutered BIT,
    weight_kg DECIMAL,
);

ALTER TABLE animals ADD COLUMN species VARCHAR;


CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR, 
    age INT
 );


CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
);

-- add primary key to id
ALTER TABLE animals ADD PRIMARY KEY (id);

--delete a species column
ALTER TABLE animals DROP COLUMN species;

-- add columns 
ALTER TABLE animals ADD COLUMN owners_id INT;
ALTER TABLE animals ADD COLUMN species_id INT;

--make columns forign keys

ALTER TABLE animals 
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals 
ADD CONSTRAINT fk_owners
FOREIGN KEY(owners_id) REFERENCES owners(id);


---------------- Add Join Table 
CREATE TABLE vet (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY(vets_id, species_id)
);


CREATE TABLE visits(
    animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date_of_visit DATE,
    PRIMARY KEY(animals_id, vets_id, date_of_visits)
);
------------------------ second week

CREATE INDEX animals_id ON visits (animals_id);

CREATE INDEX vets_id ON visits (vets_id);

CREATE INDEX owners_id ON owners (email);
