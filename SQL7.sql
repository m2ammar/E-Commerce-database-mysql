-- =================================
-- Creating Database E_Commerce
-- =================================

Create database E_Commerce;
Use E_Commerce;

-- =================================
-- Creating Table Customers 
-- =================================

Create table Customers(
 customer_id int primary key,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(60),
 phone varchar(15),
 address varchar(60),
 created_at date
);

-- =================================
-- Creating Table Categories
-- =================================

Create table Categories(
category_id int primary key,
category_name varchar(50),
description varchar(100)
);

-- =================================
-- Creating Table Products
-- =================================

Create table Products(
product_id int primary key,
category_id integer, 
product_name varchar(100),
price decimal(10,2),
stock_quantity int,
created_at date,
foreign key (category_id) references Categories(category_id)
);

-- =================================
-- Creating Table Orders
-- =================================

Create table Orders(
order_id integer primary key,
customer_id integer,
order_date date,
status varchar(20),
total_amount decimal(10,2),
foreign key (customer_id) references Customers(customer_id)
);
-- =================================
-- Creating Table Order_Items
-- =================================
CREATE TABLE Order_Items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
unit_price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =================================
-- Creating Table Payments
-- =================================

CREATE TABLE Payments (
payment_id INT PRIMARY KEY,
order_id INT,
payment_date DATE,
amount DECIMAL(10,2),
payment_method VARCHAR(30),
status VARCHAR(20),
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- =================================
-- Creating Table Reviews
-- =================================

CREATE TABLE Reviews (
review_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
rating INT,
comment VARCHAR(255),
review_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =================================
-- Creating Table Shipping
-- =================================

CREATE TABLE Shipping (
shipping_id INT PRIMARY KEY,
order_id INT,
address VARCHAR(100),
city VARCHAR(50),
shipping_date DATE,
delivery_date DATE,
status VARCHAR(20),
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- =================================
-- Data inserting in Customers 
-- =================================

insert into Customers(customer_id, first_name, last_name, email, phone, address, created_at) values

(1, 'Ali', 'Hassan', 'ali.hassan@gmail.com', '03001234567', 'House 5 Block A Karachi', '2023-01-15'),
(2, 'Sara', 'Khan', 'sara.khan@gmail.com', '03111234567', 'Flat 12 Gulshan Karachi', '2023-02-20'),
(3, 'Ahmed', 'Raza', 'ahmed.raza@gmail.com', '03211234567', 'Street 3 DHA Lahore', '2023-03-10'),
(4, 'Fatima', 'Malik', 'fatima.malik@gmail.com', '03311234567', 'House 9 F-7 Islamabad', '2023-04-05'),
(5, 'Usman', 'Tariq', 'usman.tariq@gmail.com', '03421234567', 'Block B Model Town Lahore', '2023-05-18'),
(6, 'Ayesha', 'Siddiqui', 'ayesha.s@gmail.com', '03501234567', 'House 22 Nazimabad Karachi', '2023-06-01'),
(7, 'Bilal', 'Chaudhry', 'bilal.ch@gmail.com', '03611234567', 'Sector G Hayatabad Peshawar', '2023-07-14'),
(8, 'Zara', 'Qureshi', 'zara.q@gmail.com', '03711234567', 'House 7 Cantt Rawalpindi', '2023-08-22'),
(9, 'Omar', 'Sheikh', 'omar.sheikh@gmail.com', '03811234567', 'Flat 3 Clifton Karachi', '2023-09-30'),
(10, 'Hina', 'Baig', 'hina.baig@gmail.com', '03911234567', 'House 15 Johar Town Lahore', '2023-10-12');

Select * from Customers;

-- =================================
-- Data inserting in Categories
-- =================================

insert into Categories(category_id, category_name, description) values
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Men and women clothing'),
(3, 'Books', 'Academic and fiction books' ),
(4, 'Home Appliances', 'Kitchen and home appliances'),
(5, 'Sports', 'Sports and fitness equipment'),
(6, 'Beauty', 'Skincare and beauty products'),
(7, 'Toys', 'Kids toys and games'),
(8, 'Furniture', 'Home and office furniture');

Select * from Categories;

-- =================================
-- Data inserting in Products 
-- =================================

insert into Products(product_id, category_id, product_name, price, stock_quantity, created_at) values
(1, 1, 'Samsung Galaxy S23', 150000.00, 50, '2023-01-10'),
(2, 1, 'iPhone 14 Pro', 280000.00, 30, '2023-01-15'),
(3, 1, 'HP Laptop 15', 120000.00, 25, '2023-02-01'),
(4, 2, 'Mens Casual Shirt', 2500.00, 200, '2023-02-10'),
(5, 2, 'Womens Kameez', 3500.00, 150, '2023-03-05'),
(6, 3, 'Python Programming Book', 1800.00, 100, '2023-03-12'),
(7, 3, 'Database Systems Book', 2200.00, 80, '2023-04-01'),
(8, 4, 'Dawlance Refrigerator', 85000.00, 20, '2023-04-15'),
(9, 4, 'Haier Washing Machine', 65000.00, 15, '2023-05-10'),
(10, 5, 'Cricket Bat', 4500.00, 60, '2023-05-20'),
(11, 5, 'Football', 2800.00, 90, '2023-06-01'),
(12, 6, 'Face Moisturizer', 1500.00, 120, '2023-06-15'),
(13, 7, 'Lego Building Set', 5500.00, 45, '2023-07-10'),
(14, 8, 'Office Chair', 18000.00, 30, '2023-07-25'),
(15, 8, 'Wooden Study Table', 22000.00, 20, '2023-08-05');

Select * from Products;

-- =================================
-- Data inserting in Orders 
-- =================================

insert into Orders(order_id, customer_id, order_date, status, total_amount) values

(1, 1, '2023-02-01', 'Delivered', 150000.00),
(2, 2, '2023-02-15', 'Delivered', 3500.00),
(3, 3, '2023-03-10', 'Shipped', 280000.00),
(4, 4, '2023-04-05', 'Delivered', 2200.00),
(5, 5, '2023-05-12', 'Cancelled', 4500.00),
(6, 6, '2023-06-20', 'Delivered', 85000.00),
(7, 7, '2023-07-15', 'Pending', 5500.00),
(8, 8, '2023-08-10', 'Shipped', 65000.00),
(9, 9, '2023-09-05', 'Delivered', 1800.00),
(10, 10, '2023-10-18', 'Pending', 22000.00),
(11, 1, '2023-11-01', 'Delivered', 2800.00),
(12, 3, '2023-11-20', 'Shipped', 18000.00);

Select * from Orders;

-- =================================
-- Data inserting in Order_Items
-- ===============================
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 150000.00),
(2, 2, 5, 1, 3500.00),
(3, 3, 2, 1, 280000.00),
(4, 4, 7, 1, 2200.00),
(5, 5, 10, 1, 4500.00),
(6, 6, 8, 1, 85000.00),
(7, 7, 13, 1, 5500.00),
(8, 8, 9, 1, 65000.00),
(9, 9, 6, 1, 1800.00),
(10, 10, 15, 1, 22000.00),
(11, 11, 11, 1, 2800.00),
(12, 12, 14, 1, 18000.00);

Select * from Order_Items;

-- =================================
-- Data inserting in Payments  
-- ===============================
INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method, status) VALUES
(1, 1, '2023-02-01', 150000.00, 'JazzCash', 'Completed'),
(2, 2, '2023-02-15', 3500.00, 'EasyPaisa', 'Completed'),
(3, 3, '2023-03-10', 280000.00, 'Bank Transfer', 'Pending'),
(4, 4, '2023-04-05', 2200.00, 'Cash on Delivery', 'Completed'),
(5, 5, '2023-05-12', 4500.00, 'JazzCash', 'Refunded'),
(6, 6, '2023-06-20', 85000.00, 'Bank Transfer', 'Completed'),
(7, 7, '2023-07-15', 5500.00, 'EasyPaisa', 'Pending'),
(8, 8, '2023-08-10', 65000.00, 'Cash on Delivery', 'Completed'),
(9, 9, '2023-09-05', 1800.00, 'JazzCash', 'Completed'),
(10, 10, '2023-10-18', 22000.00, 'Bank Transfer', 'Pending'),
(11, 11, '2023-11-01', 2800.00, 'EasyPaisa', 'Completed'),
(12, 12, '2023-11-20', 18000.00, 'Cash on Delivery', 'Completed');

Select * from Payments;

-- =================================
-- Data inserting in Reviews 
-- ===============================

INSERT INTO Reviews (review_id, customer_id, product_id, rating, comment, review_date) VALUES
(1, 1, 1, 5, 'Excellent phone, very fast', '2023-02-10'),
(2, 2, 5, 4, 'Good quality fabric', '2023-02-20'),
(3, 3, 2, 5, 'Best iPhone ever', '2023-03-15'),
(4, 4, 7, 4, 'Very helpful for studies', '2023-04-10'),
(5, 6, 8, 5, 'Cooling is amazing', '2023-06-25'),
(6, 7, 13, 3, 'Kids loved it but pricey', '2023-07-20'),
(7, 8, 9, 4, 'Works perfectly fine', '2023-08-15'),
(8, 9, 6, 5, 'Great book for beginners', '2023-09-10'),
(9, 10, 15, 4, 'Solid and sturdy table', '2023-10-22'),
(10, 1, 11, 4, 'Good football for the price', '2023-11-05');

Select * from Reviews;

-- =================================
-- Data inserting in Shipping
-- ===============================

INSERT INTO Shipping (shipping_id, order_id, address, city, shipping_date, delivery_date, status) VALUES
(1, 1, 'House 5 Block A', 'Karachi', '2023-02-02', '2023-02-05', 'Delivered'),
(2, 2, 'Flat 12 Gulshan', 'Karachi', '2023-02-16', '2023-02-19', 'Delivered'),
(3, 3, 'Street 3 DHA', 'Lahore', '2023-03-11', '2023-03-15', 'In Transit'),
(4, 4, 'House 9 F-7', 'Islamabad', '2023-04-06', '2023-04-09', 'Delivered'),
(5, 5, 'Block B Model Town', 'Lahore', '2023-05-13', NULL, 'Cancelled'),
(6, 6, 'House 22 Nazimabad', 'Karachi', '2023-06-21', '2023-06-24', 'Delivered'),
(7, 7, 'Sector G Hayatabad', 'Peshawar', '2023-07-16', NULL, 'Pending'),
(8, 8, 'House 7 Cantt', 'Rawalpindi', '2023-08-11', '2023-08-14', 'Delivered'),
(9, 9, 'Flat 3 Clifton', 'Karachi', '2023-09-06', '2023-09-09', 'Delivered'),
(10, 10, 'House 15 Johar Town', 'Lahore', '2023-10-19', NULL, 'Pending'),
(11, 11, 'House 5 Block A', 'Karachi', '2023-11-02', '2023-11-05', 'Delivered'),
(12, 12, 'Street 3 DHA', 'Lahore', '2023-11-21', '2023-11-24', 'Delivered');

Select * from Shipping;

-- =================================
-- Queries (Easy)
-- ===============================

Select first_name, last_name
from Customers
where address like  '%Karachi%';

Select product_name, price
from Products
where price > 10000
Order by price desc;

Select customer_id, order_id, order_date, total_amount
from Orders
where status = 'Delivered';

Select payment_id, order_id, payment_date, amount, payment_method, status
from Payments
where payment_method = 'JazzCash';

-- =================================
-- Queries (Moderate)
-- ===============================

Select Customers.first_name, Customers.last_name, Orders.order_id, Orders.order_date
from Customers
Inner join Orders on Customers.customer_id = Orders.customer_id;

Select p.product_name As Product, c.category_name As Category
from Products as p
join Categories as c on c.category_id = p.category_id;

Select CONCAT(c.first_name, ' ', c.last_name) as Full_name, o.customer_id, sum(total_amount) as Total_spend_by_each
from Customers as c
join Orders o on c.customer_id = o.customer_id
GROUP BY o.customer_id, c.first_name, c.last_name;

Select o.customer_id, o.order_date, 
o.status AS Order_Status, 
o.total_amount, 
p.payment_date, p.amount, p.payment_method, 
p.status AS Payment_Status
From Orders o
join Payments p on o.order_id = p.order_id;

-- =================================
-- Queries (Hard)
-- ===============================

Select CONCAT(cus.first_name, ' ',cus.last_name), oi.quantity
from Customers as cus
join Orders as o
on cus.customer_id = o.customer_id
join Order_Items as oi on oi.order_id = o.order_id; 

Select count(o.order_id) as No_of_orders, Concat(c.first_name, ' ',c.last_name)
from Customers c
join Orders o on c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
having count(o.order_id)>1;


Select count(o.order_id) as No_of_orders, Concat(c.first_name, ' ',c.last_name)
from Customers c
join Orders o on c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
having count(o.order_id)>1;

Select p.product_name, Max(r.rating) AS Highest_Rating
from Reviews r
join Products p on p.product_id = r.product_id
group by p.product_name
Order by Highest_Rating desc
limit 1;


