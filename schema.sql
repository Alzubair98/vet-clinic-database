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
