/* Creating a State Database
Creating a database and to input 5 entries in the table*/

-- Creating Database --

create database	 Ibadan_Lesser_cities;
use Ibadan_lesser_cities;

-- Creating a table in the database --

create table cities(
city_id int,
`City` varchar (30),
Senatorial_District varchar (30),
Population bigint,
Chairman varchar (30),

primary key(city_id)
);

-- inputting values in the table --
insert into cities values 
( 001, 'Akinyele', 'Oyo Central', '302700', 'Hon Wole Akinleye'),
( 002, 'Egbeda', 'Oyo Central', '405400', 'Hon Sikiru Sanda'),
( 003, 'Ido', 'Oyo South', '148800', 'Hon Sheriff Adeojo'),
( 004, 'Oluyole', 'Oyo Central', '290800', 'Hon Akeem Olatunji'),
( 005, 'Ona Ara', 'Oyo South', '379500', 'Hon Kolawole Temitope');