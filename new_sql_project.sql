USE online_food_delivery;
show tables;
describe swiggy;

alter table swiggy
add primary key(ID);

SELECT * from swiggy;

/*find total row in a database*/
select count(*) from swiggy;

SELECT * from swiggy
where City = 'Bangalore';

#find the count of unique cites mentioned in the data base
select count(distinct city) from swiggy;

#find name of the unique city 
select distinct city
from swiggy;

#find count of restauranats in each city
select City,count(distinct Restaurant) 
from swiggy
group by city;

#find hotel number of city in desc 
select City,count(distinct Restaurant)as tot_hotel
from swiggy
group by city
order by tot_hotel desc;

#find total no of orders made from each restro
select restaurant, count(ID) as Orders
from swiggy
group by  restaurant
order by Orders desc;

#find the max order in a city and restaurant
select City, restaurant, count(ID) as Orders
from swiggy
group by City, restaurant
order by Orders desc;

Select * from swiggy where Restaurant = 'Tandoor Hut';

Select * from swiggy where Price < 700;

Select * from swiggy where Price > 501;

Select * from swiggy where Price > 750 and City ='Bangalore';

Select * from swiggy where Price between 1500 and 2000;

 SELECT MAX(Price) AS max_Price_amount FROM swiggy;

SELECT MIN(Price) AS min_Price_amount FROM swiggy;

SELECT AVG(Price) AS avg_Price_amount FROM swiggy;

#find the avg city by city
SELECT City , AVG(Price) AS avg_price
FROM swiggy
WHERE City IN ('Bangalore', 'Mumbai', 'Pune')
GROUP BY City;

#find the avg of 3 city 
SELECT 'Overall' AS City, AVG(Price) AS avg_price
FROM swiggy
WHERE City IN ('Bangalore', 'Mumbai', 'Pune');

#find the avg of ratings 
select  avg(Total_ratings)
from swiggy;

#find the avg of ratings
select avg(Delivery_time)
from swiggy;

#max order food
SELECT MAX(Food_type) AS max_order_food FROM swiggy;

Select max(Food_type) from swiggy order by Food_type asc;

#second best itme order 
SELECT Food_type
FROM swiggy
ORDER BY Food_type DESC
LIMIT 1 OFFSET 1;

select * from swiggy;

SELECT MAX(Restaurant) AS max_Restaurant_order FROM swiggy;

SELECT city , count(id)
from swiggy
group by city;

#find restaurants from delhi who serves indian , chinese or mughlai
select City, count(distinct restaurant)as tot_hotels
from swiggy 
group by city
having count(distinct restaurant) >=1100;

#find avarage time of order in mumbai and hyderabad
SELECT City,avg(Delivery_time)
from swiggy
group by City
having City in ('mumbai','hyderabad');

#find avarage time of order in mumbai
SELECT avg(Delivery_time)
from swiggy
where City = "mumbai";

#find avarage delivery time of order 
SELECT avg(Delivery_time)
from swiggy; 

# find only those cities which has more than 110 resto
select City, count(distinct restaurant)as tot_hotels
from swiggy 
group by city
having count(distinct restaurant) >=1100;

SELECT City,restaurant, count(price) as Orders , dense_rank() over(order by count(ID) desc) as rankk
from swiggy 
group by city,restaurant 
having count(ID) > 1;

#find bottom five restaurants with lowest order
SELECT City,restaurant, count(ID) as Orders , dense_rank() over(order by count(ID) asc) as rankk
from swiggy 
group by city,restaurant 
limit 5;

# find top three restaurants with highest orders
SELECT City,restaurant, count(ID) as Orders , dense_rank() over(order by count(ID) desc) as rankk
from swiggy 
group by city,restaurant 
limit 3;

SELECT City, restaurant,count(Price+Total_ratings)as total
FROM swiggy
group by city,restaurant ;

select City, restaurant, count(ID) as Orders
from swiggy
group by City, restaurant
order by Orders desc;

#find count of restauranats in each city
select City,count(distinct Restaurant) 
from swiggy
group by city;

select * from swiggy;

select City,Food_type, restaurant, count(ID) as Orders
from swiggy
group by City,Food_type, restaurant
order by Orders desc;

