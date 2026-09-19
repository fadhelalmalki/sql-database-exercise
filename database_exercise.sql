# Introduction to Database - Exercise

# Data Definition Language (DDL)
#--------------------------------

# to create database store
create database store;

# to create the tables countries, users, orders, products and order_products
create table countries(
    code int primary key ,
    name varchar(20) unique ,
    continent_name varchar(20) not null
);

create table users(
    id int primary key ,
    full_name varchar(20) ,
    email varchar(20) unique ,
    gender char(1) check ( gender='m' or gender='f' ) ,
    date_of_birth varchar(15) ,
    created_at datetime default current_timestamp ,
    country_code int ,
    foreign key (country_code) references countries(code)
);

create table orders(
    id int primary key ,
    user_id int ,
    foreign key (user_id) references users(id) ,
    status varchar(6) check ( status='start' or status='finish' ) ,
    created_at datetime default current_timestamp
);

create table products(
    id int primary key ,
    name varchar(10) not null ,
    price int default 0,
    status varchar(10) check ( status='valid' or status='expired' ) ,
    created_at datetime default current_timestamp
);

create table order_products(
    order_id int,
    foreign key (order_id) references orders(id) ,
    product_id int,
    foreign key (product_id) references products(id) ,
    quantity int default 0 ,
    primary key (order_id, product_id)
);


# Data Query Language (DQL)
#--------------------------------

select * from countries;
select * from users;
select * from orders;
select * from products;
select * from order_products;

# Data Manipulation Language (DML)
#--------------------------------

# to add a new row to the countries table
insert into countries values (001, 'saudi arabia', 'asia');
insert into countries values (002, 'japan', 'asia');

# to add a new row to the users table
insert into users values (001, 'fadhel almalki', 'fad@gmail.com', 'm', '5 april','2026-09-17 18:00:00',001);
# to test default datetime
insert into users values (002, 'mohammed almalki', 'mohammed@gmail.com', 'm', '5 april',default,002);

# to add a new row to the orders table
insert into orders values (001, 001, 'start','2026-09-17 19:00:00');
# to test default datetime
insert into orders values (002, 002, 'start',default);

# to add a new row to the products table
insert into products values (001, 'laptop',1000, 'valid', '2026-09-17 19:00:00');
# to test default datetime
insert into products values (002, 'ipad',1000, 'valid', default);

# to add a new row to the order_products table
insert into order_products values (001,001,5);

# to update row from countries table
update countries set name='china' where code=002;

# to delete row from products table
delete from products where id=002;





