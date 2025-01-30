-- Display all customer names and email addresses from the customer table.
select concat(first_name,' ',last_name) as `Full Name`, email
from Customer;

-- Show the film titles and their rental rates from the film table.
select title, rental_rate 
from film;

-- Display the rental IDs, rental dates, and return dates from the rental table.
select rental_id, rental_date, return_date
from rental;

-- Show the inventory IDs and the corresponding film IDs from the inventory table.
select inventory_id, film_id
from inventory;

-- Display the staff IDs, first names, and last names from the staff table.
select staff_id, first_name, last_name
from staff;

-- Show the payment IDs, amount, and payment dates payment table.
select  payment_id, amount, payment_date
from payment;

-- Display the rental IDs, customer IDs, and staff IDs from the rental table.
select rental_id, customer_id, staff_id
from rental;

-- Show the film IDs and titles of all films in the film table.
select film_id, title
from film;

-- Display the store IDs and addresses from the store table.
select store_id, address
from store
join address on store.address_id = address.address_id;

-- Show the customer IDs, first names, and last names of all customers in the customer table.
select  customer_id, first_name, last_name
from customer;

-- Show the staff IDs and email addresses from the staff table.
select staff_id, email
from staff;

-- Display the payment IDs, customer IDs, and staff IDs from the payment table.
select payment_id, customer_id, staff_id
from payment;

-- Show the rental IDs, inventory IDs, and customer IDs from the rental table.
select rental_id, inventory_id, customer_id
from rental;

-- Display the film IDs, titles, and rental rates of all films in the film table.
select film_id, title, rental_rate
from film;

-- Show the customer IDs, first names, last names, and email addresses from the customer table.
select customer_id, first_name, last_name, email
from customer;

-- Display the rental IDs, rental dates, and inventory IDs from the rental table.
select rental_id, rental_date, inventory_id
from rental;

-- Show the staff IDs, first names, last names, and email addresses from the staff table.
select staff_id, first_name, last_name, email
from staff;

-- Display the payment IDs, amounts, and customer IDs from the payment table.
select payment_id, amount, customer_id
from payment;

-- Show the inventory IDs, film IDs, and store IDs inventory table.
 select inventory_id, film_id, store_id
 from inventory;
 
-- Display customer first names, last names, and email addresses of all customers who live in district "California" from the customer table.
select first_name, last_name, email
from customer
join address on customer.address_id = address.address_id
where district = "California";

-- Show the rental IDs, rental dates, and return dates of all rentals made in May 2005 from the rental table.
select rental_id, rental_date, return_date
from rental 
where rental_date between "2005-05-01" and "2005-05-31";

-- Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 1 from the staff table.
select staff_id, first_name, last_name, email
from staff
where store_id = 1;

-- Show the payment IDs, amounts, and customer IDs of all payments made on May 14th, 2005 from the payment table.
select payment_id, amount, customer_id
from payment
where payment_date = "2005-05-14";

-- Display the rental IDs, customer IDs, and staff IDs of all rentals made by customer ID 1 from the rental table.
select rental_id, customer_id, staff_id
from rental
where customer_id = 1;

-- Show the film IDs, titles, and rental rates of all films with a rental rate greater than or equal to 4 from the film table.
select film_id, title, rental_rate 
from film
where rental_rate >= 4;

-- Display the customer IDs, first names, last names, and email addresses of all customers whose first name starts with "A" from the customer table.
select customer_id, first_name, last_name, email
from customer
where first_name like 'A%';

-- Show the rental IDs, rental dates, and inventory IDs of all rentals made in store 2 from the rental table.
select rental_id, rental_date, inventory_id
from rental
where staff_id = 2;

/* Display the staff IDs, first names, last names, and email addresses of all staff members who have a last name starting with "S" staff table. */
select staff_id, first_name, last_name,email
from staff
where last_name like 'S%';

-- show payment amounts, customer IDs of all payments made by customer ID 2 from the payment table.
select amount, customer_id
from payment
where customer_id = 2;

-- Display the customer IDs, first names, last names, and email addresses of all customers whose email address contains "gmail.com" customer table.
select customer_id, first_name, last_name, email
from customer
where email like '%gmail.com%';

-- Show rental ID, rental dates, inventory IDs of all rentals made by customer ID 2 in store 2 from the rental table.
select rental_id, rental_date, customer_id
from rental
where rental_id = 2 and customer_id = 2;
-- Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 1 or 2 from the staff table.
select staff_id, first_name, last_name, email
from staff
where store_id = 1 or store_id = 2;
-- Show the payment IDs, amounts, and customer IDs of all payments made by customer ID 1 or 2 from the payment table.
select payment_id, amount, customer_id
from payment
where customer_id = 1 or customer_id = 2;

-- Display the rental IDs, customer IDs, and staff IDs of all rentals where the rental date is between May 1st, 2005 and May 31st, 2005 from the rental table.
select rental_id, customer_id, staff_id, rental_date
from rental
where return_date between "2005-05-01" and "2005-05-31";
-- show the film titles, and rental rates of all films in the comedy or drama category from the film table.
select title, rental_rate
from film 
join film on film_category.film_id = film.film_id
join film_category on category.category_id = film_category.category_id
where category = "comedy" or catergory = "drama"; 

