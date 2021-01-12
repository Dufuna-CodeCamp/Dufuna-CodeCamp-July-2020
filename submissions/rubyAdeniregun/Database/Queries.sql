
/* Question 1: Query to find the total number of passengers that survived 
The total number of passengers who survived = 342. */
SELECT * FROM accident_records WHERE passenger_survived LIKE 1; 

/* Question2: Query to find the total number of passengers who did not survive
The total number of passengers who did not survive = 549. */
SELECT * FROM accident_records WHERE passenger_survived LIKE 0; 


/* Question 3: Query to get the name and sex of passengers under 
the age of 27 that embarked at Queenstown and Cherbourg? */
 SELECT registered_passengers.full_name, registered_passengers.sex 
 FROM registered_passengers LEFT JOIN passengers_records 
 ON passengers_records.registered_passengers_id = passengers_records.registered_passengers_id
 WHERE age < '27' AND point_of_embarkation= 'Q' OR point_of_embarkation = 'C';

  
/* Question 4: Query to get how many of the passengers that embarked at Southampton survived? 
Passengers = 891 */
SELECT passengers_records.point_of_embarkation LIKE 'S', accident_records.passenger_survived LIKE 1
FROM passengers_records RIGHT JOIN accident_records 
ON passengers_records.registered_passengers_id = accident_records.registered_passengers_id;


/* Question 5: Query to get the id, name and the total number of passengers who paid a fare greater 
than $100 and above the age of 35 had siblings or spouses on board.
Total number of passengers = 295 */
SELECT registered_passengers.id, registered_passengers.full_name
FROM registered_passengers LEFT JOIN passengers_records 
ON registered_passengers.id = passengers_records.registered_passengers_id
WHERE registered_passengers.age > '35' AND passengers_records.trip_fare > 100 OR passengers_records.number_of_siblings_spouses_aboard >= 1;
