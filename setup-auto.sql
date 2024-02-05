-- [Problem 1]
-- Drop tables first in the exact order of references.
-- Drop tables that reference others first

DROP TABLE IF EXISTS participated;
DROP TABLE IF EXISTS owns;

-- Then drop the referenced tables
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS accident;

-- Stores information about individuals with a unique driver ID
CREATE TABLE person (
    -- Unique driver identifier, fixed length (10 characters)
    driver_id CHAR(10) NOT NULL,
    -- Full name of the person (varying length)
    name VARCHAR(255) NOT NULL,
    -- Residential address (varying length)
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (driver_id)
);

-- Stores car details, each identified by a unique license number
CREATE TABLE car (
    -- Unique license number, fixed length (7 characters)
    license CHAR(7) NOT NULL,
    -- Car model name, can be NULL
    model VARCHAR(255),
    -- Year the car was manufactured, can be NULL
    year YEAR,
    PRIMARY KEY (license)
);

-- Records details of accidents
CREATE TABLE accident (
    -- Auto-incremented report number for each accident
    report_number INT AUTO_INCREMENT NOT NULL,
    -- Timestamp of when the accident occurred
    date_occurred TIMESTAMP NOT NULL,
    -- Location of the accident, expected to vary in size
    location VARCHAR(255) NOT NULL,
    -- Summary of the accident, can store large text and be NULL
    summary TEXT,
    PRIMARY KEY (report_number)
);

-- Table links drivers to their respective cars, representing ownership.
CREATE TABLE owns (
    -- `driver_id` from person table(exactly 10 characters)
    driver_id CHAR(10) NOT NULL,
    -- `license` from car table(exactly 7 characters long)
    license CHAR(7) NOT NULL,
    -- Composite primary key 
    PRIMARY KEY (driver_id, license),
    -- Foreign key constraint on `driver_id`.
    FOREIGN KEY (driver_id) REFERENCES person(driver_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    -- Foreign key constraint on `license` 
    FOREIGN KEY (license) REFERENCES car(license)
        ON DELETE CASCADE
        ON UPDATE CASCADE 
 );

-- Table records drivers that were involved in accidents.
-- It links drivers and cars to specific accidents.
CREATE TABLE participated (
    -- `driver_id` from person table(exactly 10 characters)
    driver_id CHAR(10) NOT NULL,
    -- `license` from car table(exactly 7 characters long)
    license CHAR(7) NOT NULL,
    -- report number for accident
    report_number INT NOT NULL,
    -- `damage_amount` records the dollars for accident
    -- can be NULL
    damage_amount DECIMAL(9,2),
    -- Composite primary key 
    PRIMARY KEY (driver_id, license, report_number),
    -- Foreign key constraint on `driver_id`
    -- Only Cascade Updates not deletes
    FOREIGN KEY (driver_id) 
    REFERENCES person(driver_id) 
    ON UPDATE CASCADE,
    -- Foreign key constraint on `license` 
    -- Only Cascade Updates not deletes

    FOREIGN KEY (license) 
    REFERENCES car(license) 
    ON UPDATE CASCADE,
    -- Foreign key constraint on `report_number` 
    -- Only Cascade Updates not deletes

    FOREIGN KEY (report_number) 
    REFERENCES accident(report_number) 
    ON UPDATE CASCADE 
    );






