DROP TABLE flat_matches;
DROP TABLE tenants;
DROP TABLE flats;

CREATE TABLE flats
(
id SERIAL8 PRIMARY KEY,
location VARCHAR(255),
available_space VARCHAR(255),
animal_friendly VARCHAR(255),
smokers_friendly VARCHAR(255)
);
#booleans for true of false???
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
  animal VARCHAR(255),
  can_live_with_animal VARCHAR(255),
  smoke VARCHAR(255),
  can_live_with_smokers VARCHAR(255),
  flat_id INT8 REFERENCES flats(id)
);


CREATE TABLE flat_matches
(
id SERIAL8 PRIMARY KEY,
tenant_id INT8 REFERENCES tenants(id) ON DELETE CASCADE,
flat_id INT8 REFERENCES flats(id) ON DELETE CASCADE
);
