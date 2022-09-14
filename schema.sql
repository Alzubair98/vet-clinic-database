CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_brith DATE NOT NULL,
    escape_attmepts INT NOT NULL,
    neutered BIT,
    weight_kg DECIMAL,
);

ALTER TABLE animals ADD COLUMN species VARCHAR;
