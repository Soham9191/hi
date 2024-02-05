-- [Problem 2a] INSERT statements

-- Insert into person

INSERT INTO person (driver_id, name, address) 
VALUES
    ('D123456789', 'John Doe', '152 Elm Street'),
    ('D987654321', Jack Smith', '453 Oak Avenue'),
    ('D111222333', 'Alex Jon', '899 Pine Road');

-- Insert into car

INSERT INTO car
VALUES
    ('ABC1234', 'Toyota Camry', 2019),
    ('XYZ5678', 'Ford Focus', 2018),
    ('LMN2345', NULL, NULL);

INSERT INTO car(license, model)
VALUES
    ('SB1332B', 'Maruti’');  -- Example with NULL values for year


-- Insert into accident
INSERT INTO accident (date_occurred, location, summary) 
VALUES
    ('2023-01-01 14:30:00', 'Intersection of 5th and Main', 'Two-car collision with minor injuries.'),
    ('2023-02-15 08:20:00', 'Highway 10, near exit 22', 'Single car accident, driver lost control on icy road.'),
    ('2023-03-10 17:45:00', 'Parking lot at 123 Elm Street', ‘Truck colliding with car’); 

INSERT INTO accident (date_occurred, location) 
VALUES
    ('2023-02-02 14:30:00', '202 South St'); -- Example with NULL summary

-- Insert into owns
INSERT INTO owns (driver_id, license) 
VALUES
    ('D123456789', 'ABC1234'),
    ('D987654321', 'XYZ5678'),
    ('D111222333', 'LMN2345');

-- Insert into participated
INSERT INTO participated (driver_id, license, report_number, damage_amount) 
VALUES
    ('D123456789', 'ABC1234', 1, 500.00),
    ('D987654321', 'XYZ5678', 2, 1500.00),
    ('D111222333', 'LMN2345', 3, 1000.00); 

INSERT INTO participated (driver_id, license, report_number) 
VALUES
    ('B111222333', 'KjN2345', 3); -- Example with NULL damage_amount


-- [Problem 2b] UPDATE statements to test CASCADE

-- Update a person's driver_id to test CASCADE in owns
UPDATE person 
SET driver_id = 'D123456788' 
WHERE driver_id = 'D132456589';

-- Update a car's license to test CASCADE in owns
UPDATE car 
SET license = 'ABC1235'
 WHERE license = 'ACB1234';

-- [Problem 2c] Commented out DELETE statement to test non-cascading deletes in participated
-- DELETE FROM car WHERE license = 'XYZ5678';


