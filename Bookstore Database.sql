/* Creating an Online bookstore databse
Creating a Database for an online bookstore that sells books */

create database Online_Bookstore;
Use Online_Bookstore;

create table Books(
book_id int auto_increment,
title varchar (35) not null unique,
`auth_name` varchar (30) not null unique,
pub_name varchar (35) not null,
price int,
pub_year year,

primary key (book_id)
);

insert into Books(title,`auth_name`,pub_name,price,pub_year) values 
('How to Survive in Nigeria','Unago C Shege', 'Balablu Enterprise', 3700, '1999'),
('Nigeria go Better','Yuneva C Somtin', 'Kalakuta Republic', 2500, '2012'),
('Our Mumu no too much','Asari Dokubo', 'Meme Arena', 3000, '2017'),
('Banana Republic','Dr. Adebayo Faleke', 'Chochocho media ventures', 1900, '2022'),
('Father of 4','Speed Darlington', 'Apki prints', 1920, '2024'),
('Jungle Justice','Very Darkman', 'Twitterspace elements', 2000, '2024'),
('My Gender','Bobrisky & James brown', 'Instaprint books', 1720, '2020'),
('Baby Oil Production','Piddy', 'Sasuke benders', 1234, '2009'),
('If You Like Give UP','Unago C Shege Jr', 'T-Pain intercontinental', 2450, '2023'),
('Africa Gorrillas','E.B Things,PhD', 'Die there Enterprise', 4000, '2021');

create table Authors(
author_id int auto_increment, 
`auth_name` varchar(50) not null unique,
auth_email varchar(40) unique,
book_id int,
title varchar(35) not null unique,
Bio varchar(100) not null,

primary key (author_id),
foreign key (book_id) references Books(book_id),
foreign key (title) references Books(title)
) auto_increment = 1;

insert into Authors (`auth_name`, auth_email, book_id, title, Bio) values
('Unago C Shege', 'shegebansa@example.com', 1, 'How to Survive in Nigeria', 'Wrote the novel before he died. Alas! Nah 3rd next of kin later release the book'),
('Yuneva C Somtin','moretocome@night.com', 2,'Nigeria go Better', 'Author later blind when he  see wetin  pass hin eyes'),
('Asari Dokubo', 'Asasika@stfu.com', 3,'Our Mumu no too much','Nah frustration make the man talk this on an interview. The bastard was actually pained'),
('Dr. Adebayo Faleke', 'wetinconcernme@me.com', 4, 'Banana Republic', 'Him nah better writter and he sabi talk but he no fit abuse the culprits because who wan die?'),
('Speed Darlington', 'seniorman@ig.com', 5,'Father of 4', 'Egbon first sing that time but our mumu be dey think say nah fure Drake... lol!!!'),
('Very Darkman', 'Cloutchaser@hobby.fun', 6,'Jungle Justice', 'This one dey feel like modern fela but dem no really send hin papa'),
('Bobrisky & James brown', 'bastardduos@rubbish.com', 7, 'My Gender', 'Nah the first set of people wey God go first use thunder strike be these. dem leav bunda dey do g*y?'),
('Piddy', 'phedo@random.shi', 8,'Baby Oil Production','God must put him in the bottom of heal pit because how person go forsake other gender hot'),
('Unago C Shege Jr', 'shegebansajr@example.com', 9,'If You Like Give UP', 'Low and behold, he died and was diagnozed of tiredness because he rest'),
('E.B Things,PhD', 'thingsscatter@live.lie', 10,'Africa Gorrillas', 'Funny how Gorrilla kill am for zoo when he dey try mock the specie');

create table Publishers(
publisher_id int auto_increment,
pub_name varchar(40) not null,
address varchar(55) not null,
contact_details bigint,
book_id int,

primary key(publisher_id),
foreign key (book_id) references Books(book_id)
);

insert into Publishers (pub_name, address, contact_details, book_id) values
('Balablu Enterprise', 'Aso villa road',0802335676442, 1),
('Kalakuta Republic', 'Shrine way',081237689983, 2),
('Meme Arena', 'Social media way', 89101898381, 3),
('Chochocho media ventures', 'Agbohunsafefe estate',8898098198, 4),
('Apki prints', 'Imagination street', 891889191231, 5),
('Twitterspace elements', 'Elon Musk close', 7398782734812, 6),
('Instaprint books', 'Colormixture apartment', 7898234322323, 7),
('Sasuke benders', 'Avartar line', 8773287312, 8),
('T-Pain intercontinental', 'Bourdilon street', 1993988132, 9),
('Die there Enterprise', 'ilenyo avenue', 987732782343, 10);


create table Customers(
customer_id int auto_increment,
`customer_name` varchar (40) unique,
customer_email varchar(50) unique,
shipping_add varchar(60) not null,

primary key(customer_id)
);

insert into Customers (`customer_name`, customer_email, shipping_add) values
('Ogbeni', 'ogb@sample.com', 'closeby avenue'),
('Arakunri', 'ark@book.com', 'nohome srt'),
('Andugbe Arindin', 'ana@fooling.com', 'opoo ibadan'),
('Amukun Eruewo', 'amu@kun@mail.com', 'Oke lenwo'),
('Awo Ogberi', 'awo@bitch.com', 'yabaleft avenue'),
('Ofonu Joonu', 'ofj@sample.com', 'closeby avenue'),
('Sam larry', 'smly@apayan.com', 'awol avenue'),
('Ose ojumikoro', 'isee@everything.com', 'eyes lens way'),
('Oxlade savage', 'tape@sex.com', 'moaning arena'),
('Lagbaja Temedo', 'LGBTQ@cross.com', 'shag denial lake');


create table Orders(
order_id int auto_increment ,
title varchar (35) not null,
`customer_name` varchar (40),
order_date date,
cost int,

primary key(order_id),
foreign key(title) references Books(title),
foreign key(`customer_name`) references Customers(`customer_name`)
) auto_increment = 1;

insert into Orders (title, `customer_name`, order_date, cost) values
('How to Survive in Nigeria', 'Ogbeni', '2024-09-23', 3700),
('Nigeria go Better', 'Arakunri', '2024-02-21', 2500),
('Our Mumu no too much', 'Andugbe Arindin', '2023-01-12', 3000),
('Banana Republic', 'Amukun Eruewo', '2024-12-28', 1900),
('Father of 4', 'Ofonu Joonu', '2024-10-01', 1920),
('Jungle Justice', 'Sam larry', '2024-06-23', 2000),
('My Gender', 'Sam larry', '2024-11-03', 1720),
('Baby Oil Production', 'Ose ojumikoro', '2024-09-09', 1234),
('If You Like Give UP', 'Oxlade savage', '2024-06-28', 2450),
('Africa Gorrillas', 'Lagbaja Temedo', '2024-04-03', 4000);
