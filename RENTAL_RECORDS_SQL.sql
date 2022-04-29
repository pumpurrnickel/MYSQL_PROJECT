-- Query 1
-- Customer 'Angel' has rented 'SBA1111A' from today for 10 days
INSERT INTO rental_records (veh_reg_no, customer_id, start_date, end_date)
SELECT 'SBA1111A', customer_id, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY) FROM customers
WHERE name = 'Angel';

-- Query 2
-- Customer 'Kumar' has rented 'GA5555E' from tomorrow for 3 months
INSERT INTO rental_records (veh_reg_no, customer_id, start_date, end_date)
SELECT 'GA5555E', customer_id, CURDATE() + 1, DATE_ADD(CURDATE() + 1, INTERVAL 3 MONTH) FROM customers
WHERE name = 'Kumar';

-- Query 3
-- List all rental records (start date, end date) with vehicle's registration number, brand, and customer name, sorted by vehicle's catagories followed by start date
SELECT start_date, end_date, veh_reg_no, brand, name FROM rental_records
JOIN vehicles USING (veh_reg_no)
JOIN customers USING (customer_id)
ORDER BY category, start_date;

-- Query 4
-- List all the expired rental records (end_date before curdate())
SELECT * FROM rental_records
WHERE end_date < CURDATE();

-- Query 5
-- List the vehicles rented out on '2012-01-10' (not available for rental), in columns of vehicle registration no, customer name, start date and end date
SELECT veh_reg_no, name, start_date, end_date FROM rental_records
JOIN customers USING (customer_id)
WHERE '2012-01-10' BETWEEN start_date AND end_date;

-- Query 6
-- List all vehicles rented out today, in columns registration number, customer name, start date, end date
SELECT veh_reg_no, name, start_date, end_date FROM rental_records
JOIN customers USING (customer_id)
WHERE CURDATE() BETWEEN start_date AND end_date;

-- Query 7
-- Similarly, list the vehicles rented out (not available for rental) for the period from '2012-01-03' to '2012-01-18'
SELECT veh_reg_no, name, start_date, end_date FROM rental_records
JOIN customers USING (customer_id)
WHERE (start_date > DATE('2012-01-18') AND start_date < DATE('2012-01-18'))
OR (end_date > DATE('2012-01-03') AND end_date < DATE('2012-01-18'))
OR (start_date < DATE('2012-01-03') AND end_date > DATE('2012-01-18'));

-- Query 8
-- List the vehicles (registration number, brand and description) available for rental (not rented out) on '2012-01-10'
SELECT veh_reg_no, brand, vehicles.desc FROM vehicles
WHERE NOT veh_reg_no IN (SELECT veh_reg_no FROM rental_records
WHERE '2012-01-10' BETWEEN start_date AND end_date);

-- Query 9
-- Similarly, list the vehicles available for rental for the period from '2012-01-03' to '2012-01-18'
SELECT veh_reg_no, brand, vehicles.desc FROM vehicles
WHERE NOT veh_reg_no IN (SELECT veh_reg_no FROM rental_records
WHERE (start_date BETWEEN '2012-01-03' AND '2012-01-18')
OR (end_date BETWEEN '2012-01-03' AND '2012-01-18')
OR (start_date < '2012-01-03' AND end_date > '2012-01-18')

-- Query 10
-- Similarly, list the vehicles available for rental from today for 10 days
SELECT veh_reg_no, brand, vehicles.desc FROM rental_records
JOIN vehicles USING (veh_reg_no)
WHERE start_date > CURRENT_DATE() + 10 OR end_date < CURRENT_DATE();