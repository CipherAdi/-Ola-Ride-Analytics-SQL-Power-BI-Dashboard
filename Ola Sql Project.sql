select*
from ola.bookings;

#1. Retrieve all successful bookings:
create view successfull_bookings as
SELECT * 
FROM bookings 
WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_viechel_type as
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM bookings
GROUP BY Vehicle_Type;


#3. Get the total number of cancelled rides by customers:
Create view cancelled_rides_by_customer as
SELECT COUNT(*) as rides_cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
Create view top_customers as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view rides_cancelled_due_to_P_C_issues as
SELECT COUNT(*) 
FROM bookings 
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Max_and_Min_driver_ratings as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create view UPI_Payments as
SELECT * 
FROM bookings 
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create view AVG_Customer_Rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
Create view total_booking_values as
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
Create view incomplete_rides_and_reason as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'Yes';


