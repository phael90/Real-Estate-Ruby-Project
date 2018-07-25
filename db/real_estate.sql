DROP TABLE rentals;
DROP TABLE tenants;
DROP TABLE flats;

CREATE TABLE flats
(
id SERIAL8 PRIMARY KEY,
location VARCHAR(255),
available_space VARCHAR(255),
animal_friendly BOOLEAN,
smokers_friendly BOOLEAN
);

CREATE TABLE tenants
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  age INT2,
  nationality VARCHAR(255),
  gender VARCHAR(255),
  preferred_location VARCHAR(255),
  profession VARCHAR(255),
  animal BOOLEAN,
  can_live_with_animal BOOLEAN,
  smoke BOOLEAN,
  can_live_with_smokers BOOLEAN,
  flat_id INT8 REFERENCES flats(id)
);


CREATE TABLE rentals
(
id SERIAL8 PRIMARY KEY,
tenant_id INT8 REFERENCES tenants(id) ON DELETE CASCADE,
flat_id INT8 REFERENCES flats(id) ON DELETE CASCADE
);
