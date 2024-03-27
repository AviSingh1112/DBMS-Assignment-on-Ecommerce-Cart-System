create database CartSystem;
use CartSystem;
CREATE TABLE Customer (
  Customer_id INT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(100),
  address VARCHAR(255),
  phone_number VARCHAR(20)
);

CREATE TABLE Orders (
  Order_id INT PRIMARY KEY,
  Order_date DATE,
  total_price DECIMAL(10, 2),
  Payment_id INT,
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Payment (
  Payment_id INT PRIMARY KEY,
  Payment_date DATE,
  Payment_method VARCHAR(50),
  amount DECIMAL(10, 2),
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Shipment (
  Shipment_id INT PRIMARY KEY,
  Shipment_data VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(100),
  zip_code VARCHAR(20),
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Order_item (
  Order_item_id INT PRIMARY KEY,
  quantity INT,
  price DECIMAL(10, 2),
  Order_id INT,
  Product_id INT,
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
  FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Product (
  Product_id INT PRIMARY KEY,
  SKU VARCHAR(100),
  description TEXT,
  price DECIMAL(10, 2),
  stock INT,
  Category_id INT,
  FOREIGN KEY (Category_id) REFERENCES Category(Category_id)
);

 
CREATE TABLE Wishlist (
  Wishlist_id INT PRIMARY KEY,
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Cart (
  Cart_id INT PRIMARY KEY,
  quantity INT,
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Category (
  Category_id INT PRIMARY KEY,
  name VARCHAR(100)
);

INSERT INTO Customer (Customer_id, first_name, last_name, email, password, address, phone_number) VALUES
(1, 'Arnav', 'Chaturvedi', 'arnavchaturvedi@gmail.com', 'hashed_password', 'Civil Lines, Satna', '9876543210'),
(2, 'Riya', 'Shagun', 'riya.shagun@gmail.com', 'hashed_password', 'Kandivali, Mumbai', '9876543211'),
(3, 'Ishika', 'Rathore', 'Ishika@gmail.com', 'hashed_password', 'Chhatri bagh, Indore', '9876543212'),
(4, 'Anika', 'Sethia', 'Anika.Sethia@gmail.com', 'hashed_password', 'Gomasthanagar, Indore', '9876543213'),
(5, 'Yashwardhan', 'Sant', 'yashsant12@gmail.com', 'hashed_password', 'Bijalpur, Indore', '9876543214'),
(6, 'Nakul', 'Sethi', 'NakulSethi@gmail.com', 'hashed_password', 'bhojpuria, Patna', '9876543215'),
(7, 'Arjav', 'Kasliwal', 'arjav.kasliwal@gmail.com', 'hashed_password', 'BPS School, Indore', '9876543216'),
(8, 'Pranav', 'Joshi', 'pranav.joshi@gmail.com', 'hashed_password', '1514 Malleshwaram, Bangalore', '9876543217'),
(9, 'Oshin', 'Ahuja', 'oshin.ahuja@gmail.com', 'hashed_password', 'Sindhi colony, Satna', '9876543218'),
(10, 'Lakshya', 'Dubey', 'Lakshya10@gmail.com', 'hashed_password', 'Khajrana, Indore', '9876543219'),
(11, 'Shanali', 'Singh', 'Shanali@gmail.com', 'hashed_password', '1817 Powai, Mumbai', '9876543220'),
(12, 'Suhani', 'Khandelwal', 'suhana@gmail.com', 'hashed_password', 'Nala Supara, Mumbai', '9876543221'),
(13, 'Kashish', 'Wadhwani', 'Kasheesh@gmail.com', 'hashed_password', 'viveknagar, Indore', '9876543222'),
(14, 'Prakhar', 'Agrawal', 'prakhar.agrawal@gmail.com', 'hashed_password', 'Dhawari, Satna', '9876543223'),
(15, 'Ananya', 'Pandey', 'ananya.pandey@gmail.com', 'hashed_password', '2222 Salt Lake, Kolkata', '9876543224'),
(16, 'Kabir', 'Singh', 'kabir.singh@gmail.com', 'hashed_password', '2323 Gandhinagar, Delhi', '9876543225'),
(17, 'Saanvi', 'Kumar', 'saanvi.kumar@gmail.com', 'hashed_password', '2424 Vijay Nagar, Indore', '9876543226'),
(18, 'Harshit', 'Chawla', 'harshit.chawla@gmail.com', 'hashed_password', '2525 C Scheme, Jaipur', '9876543227'),
(19, 'Khushi', 'Upadhyay', 'khushii@gmail.com', 'hashed_password', '2626 Ambawadi, Ahmedabad', '9876543228'),
(20, 'Chhavi', 'Ambor', 'chhaviambor420@gmail.com', 'hashed_password', '2727 Hazratganj, Lucknow', '9876543229');
select * from Customer;

INSERT INTO Orders VALUES 
(1, '2023-01-10', 79.99, NULL, 1),
(2, '2023-01-11', 49.99, NULL, 2),
(3, '2023-01-12', 89.99, NULL, 3),
(4, '2023-01-13', 59.99, NULL, 4),
(5, '2023-01-14', 99.99, NULL, 5),
(6, '2023-01-15', 29.99, NULL, 6),
(7, '2023-01-16', 199.99, NULL, 7),
(8, '2023-01-17', 299.99, NULL, 8),
(9, '2023-01-18', 399.99, NULL, 9),
(10, '2023-01-19', 129.99, NULL, 10),
(11, '2023-01-20', 159.99, NULL, 11),
(12, '2023-01-21', 249.99, NULL, 12),
(13, '2023-01-22', 279.99, NULL, 13),
(14, '2023-01-23', 179.99, NULL, 14),
(15, '2023-01-24', 199.99, NULL, 15);
select * from Orders;
INSERT INTO Payment VALUES 
(1, '2023-01-10', 'Credit Card', 79.99, 1),
(2, '2023-01-11', 'Credit Card', 49.99, 2),
(3, '2023-01-12', 'PayPal', 89.99, 3),
(4, '2023-01-13', 'Debit Card', 59.99, 4),
(5, '2023-01-14', 'Credit Card', 99.99, 5),
(6, '2023-01-15', 'Credit Card', 29.99, 6),
(7, '2023-01-16', 'PayPal', 199.99, 7),
(8, '2023-01-17', 'Debit Card', 299.99, 8),
(9, '2023-01-18', 'Credit Card', 399.99, 9),
(10, '2023-01-19', 'PayPal', 129.99, 10),
(11, '2023-01-20', 'Debit Card', 159.99, 11),
(12, '2023-01-21', 'Credit Card', 249.99, 12),
(13, '2023-01-22', 'PayPal', 279.99, 13),
(14, '2023-01-23', 'Credit Card', 179.99, 14),
(15, '2023-01-24', 'PayPal', 199.99, 15);
select * from Payment;
INSERT INTO Shipment VALUES 
(1, 'Delivered', 'Civil Lines, Satna', 'Satna', 'Madhya Pradesh', 'India', '485001', 1),
(2, 'In Transit', 'Kandivali, Mumbai', 'Mumbai', 'Maharashtra', 'India', '400067', 2),
(3, 'Dispatched', 'Chhatri bagh, Indore', 'Indore', 'Madhya Pradesh', 'India', '452007', 3),
(4, 'Pending', 'Gomasthanagar, Indore', 'Indore', 'Madhya Pradesh', 'India', '452009', 4),
(5, 'Delivered', 'Bijalpur, Indore', 'Indore', 'Madhya Pradesh', 'India', '452012', 5),
(6, 'In Transit', 'bhojpuria, Patna', 'Patna', 'Bihar', 'India', '800026', 6),
(7, 'Dispatched', 'BPS School, Indore', 'Indore', 'Madhya Pradesh', 'India', '452011', 7),
(8, 'Pending', '1514 Malleshwaram, Bangalore', 'Bangalore', 'Karnataka', 'India', '560003', 8),
(9, 'Delivered', 'Sindhi colony, Satna', 'Satna', 'Madhya Pradesh', 'India', '485001', 9),
(10, 'In Transit', 'Khajrana, Indore', 'Indore', 'Madhya Pradesh', 'India', '452016', 10),
(11, 'Dispatched', '1817 Powai, Mumbai', 'Mumbai', 'Maharashtra', 'India', '400076', 11),
(12, 'Pending', 'Nala Supara, Mumbai', 'Mumbai', 'Maharashtra', 'India', '401209', 12),
(13, 'Delivered', 'viveknagar, Indore', 'Indore', 'Madhya Pradesh', 'India', '452001', 13),
(14, 'In Transit', 'Dhawari, Satna', 'Satna', 'Madhya Pradesh', 'India', '485005', 14),
(15, 'Dispatched', '2222 Salt Lake, Kolkata', 'Kolkata', 'West Bengal', 'India', '700091', 15),
(16, 'Pending', '2323 Gandhinagar, Delhi', 'New Delhi', 'Delhi', 'India', '110031', 16),
(17, 'Delivered', '2424 Vijay Nagar, Indore', 'Indore', 'Madhya Pradesh', 'India', '452010', 17),
(18, 'In Transit', '2525 C Scheme, Jaipur', 'Jaipur', 'Rajasthan', 'India', '302001', 18),
(19, 'Dispatched', '2626 Ambawadi, Ahmedabad', 'Ahmedabad', 'Gujarat', 'India', '380006', 19),
(20, 'Pending', '2727 Hazratganj, Lucknow', 'Lucknow', 'Uttar Pradesh', 'India', '226001', 20);

select * from Shipment;

INSERT INTO Product VALUES 
(1, 'SKU123', 'Smartphone', 19999.00, 100, 1),
(2, 'SKU456', 'Laptop', 49999.00, 150, 1),
(3, 'SKU789', 'Bluetooth Headphones', 2999.00, 200, 1),
(4, 'SKU101', 'Smartwatch', 9999.00, 75, 1),
(5, 'SKU102', 'Tablet', 24999.00, 50, 1),
(6, 'SKU103', 'Wireless Charger', 1999.00, 100, 1),
(7, 'SKU104', 'DSLR Camera', 29999.00, 40, 1),
(8, 'SKU105', 'Printer', 8999.00, 60, 1),
(9, 'SKU106', 'E-reader', 7999.00, 150, 2),
(10, 'SKU107', 'Bluetooth Speaker', 1499.00, 80, 1),
(11, 'SKU108', 'Gaming Console', 29999.00, 90, 1),
(12, 'SKU109', 'Video Game', 3499.00, 200, 2),
(13, 'SKU110', 'Fitness Band', 3499.00, 110, 1),
(14, 'SKU111', 'External Hard Drive', 5999.00, 120, 1),
(15, 'SKU112', 'Router', 2499.00, 130, 1);
select * from Product;


INSERT INTO Order_item VALUES 
(1, 1, 19999.00, 1, 1),
(2, 1, 49999.00, 2, 2),
(3, 2, 2999.00, 3, 3),
(4, 1, 9999.00, 4, 4),
(5, 1, 24999.00, 5, 5),
(6, 1, 1999.00, 6, 6),
(7, 1, 29999.00, 7, 7),
(8, 1, 8999.00, 8, 8),
(9, 2, 7999.00, 9, 9),
(10, 2, 1499.00, 10, 10),
(11, 1, 29999.00, 11, 11),
(12, 2, 3499.00, 12, 12),
(13, 1, 3499.00, 13, 13),
(14, 1, 5999.00, 14, 14),
(15, 1, 2499.00, 15, 15);
select * from Order_item;
INSERT INTO Category (Category_id, name) VALUES 
(1, 'Electronics'),
(2, 'Books'),
(3, 'Home Appliances'),
(4, 'Fashion'),
(5, 'Beauty and Personal Care'),
(6, 'Sports and Fitness'),
(7, 'Groceries'),
(8, 'Toys and Games'),
(9, 'Furniture'),
(10, 'Jewelry'),
(11, 'Musical Instruments'),
(12, 'Automotive'),
(13, 'Gardening Tools'),
(14, 'Pet Supplies'),
(15, 'Office Supplies');
select * from Category;
INSERT INTO Wishlist VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);
select * from Wishlist;
INSERT INTO Cart VALUES 
(1, 2, 1),
(2, 1, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 2, 6),
(7, 1, 7),
(8, 3, 8),
(9, 4, 9),
(10, 1, 10),
(11, 2, 11),
(12, 3, 12),
(13, 4, 13),
(14, 1, 14),
(15, 2, 15);
select * from cart;
-- Sort by price(lowest to highest)
SELECT * FROM Product ORDER BY price ASC;

SELECT * FROM Product WHERE price BETWEEN 15000 AND 20000;

SELECT p.* 
FROM Product p
JOIN Category c ON p.Category_id = c.Category_id
WHERE c.name = 'Electronics';

SELECT * FROM Product WHERE stock < 10;

SELECT * FROM Product WHERE description LIKE '%smartphone%';

SELECT p.* 
FROM Product p
LEFT JOIN Order_item oi ON p.Product_id = oi.Product_id
WHERE oi.Product_id IS NULL;

SELECT p.*, SUM(oi.quantity) as TotalSold
FROM Product p
JOIN Order_item oi ON p.Product_id = oi.Product_id
JOIN Category c ON p.Category_id = c.Category_id
WHERE c.name = 'Electronics'
GROUP BY p.Product_id
ORDER BY TotalSold DESC;

SELECT c.Customer_id, c.first_name, c.last_name, COUNT(cart.Cart_id) as CartItemCount
FROM Customer c
LEFT JOIN Cart cart ON c.Customer_id = cart.Customer_id
GROUP BY c.Customer_id;

SELECT * FROM Shipment WHERE Shipment_data IN ('In Transit', 'Pending');

SELECT p.Category_id, p.Product_id, p.description, COUNT(oi.Order_item_id) AS order_count
FROM Product p
JOIN Order_item oi ON p.Product_id = oi.Product_id
GROUP BY p.Category_id, p.Product_id
ORDER BY p.Category_id, order_count DESC
LIMIT 3;

CREATE VIEW OrderDetails AS
SELECT o.Order_id, c.first_name, c.last_name, o.total_price, p.Payment_method
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Payment p ON o.Payment_id = p.Payment_id;
select * from orders;
UPDATE Orders
SET total_price = total_price * 0.9
WHERE total_price > 200;
select * from orders;

SELECT 
    o.Customer_id, 
    c.first_name, 
    c.last_name, 
    MAX(o.Order_date) AS LatestOrderDate
FROM 
    Orders o
INNER JOIN 
    Customer c ON o.Customer_id = c.Customer_id
GROUP BY 
    o.Customer_id;

SELECT 
  cat.name AS CategoryName,
  SUM(oi.price * oi.quantity) AS TotalRevenue
FROM Category cat
JOIN Product p ON cat.Category_id = p.Category_id
JOIN Order_item oi ON p.Product_id = oi.Product_id
GROUP BY cat.Category_id
ORDER BY TotalRevenue DESC;

SELECT 
  c.Customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS CustomerName
FROM Customer c
WHERE NOT EXISTS (
  SELECT 1
  FROM Orders o
  WHERE c.Customer_id = o.Customer_id AND o.Order_date >= CURDATE() - INTERVAL 1 YEAR
);

SELECT 
    c.Customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS CustomerName,
    SUM(o.total_price) AS TotalSpending,
    RANK() OVER (ORDER BY SUM(o.total_price) DESC) AS SpendingRank
FROM 
    Customer c
JOIN 
    Orders o ON c.Customer_id = o.Customer_id
GROUP BY 
    c.Customer_id, c.first_name, c.last_name
ORDER BY 
    TotalSpending DESC;
    
    SELECT 
    c.Customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS CustomerName,
    CASE
        WHEN COUNT(o.Order_id) >= 3 THEN 'Frequent Buyer'  
        WHEN COUNT(o.Order_id) BETWEEN 1 AND 2 THEN 'Moderate Buyer'  
        ELSE 'Rare Buyer'
    END AS CustomerSegment
FROM Customer c
LEFT JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_id
ORDER BY COUNT(o.Order_id) DESC;

SELECT 
    c.Customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS CustomerName,
    COUNT(DISTINCT cart.Cart_id) AS CartsCreated,
    COUNT(DISTINCT o.Order_id) AS OrdersCompleted,
    (COUNT(DISTINCT cart.Cart_id) - COUNT(DISTINCT o.Order_id)) / COUNT(DISTINCT cart.Cart_id) * 100 AS AbandonmentRate
FROM Customer c
LEFT JOIN Cart cart ON c.Customer_id = cart.Customer_id
LEFT JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_id
HAVING CartsCreated > 0
ORDER BY AbandonmentRate DESC;

SELECT 
    c.Customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS CustomerName,
    SUM(o.total_price) AS TotalSpent,
    COUNT(o.Order_id) AS OrderCount,
    SUM(o.total_price) / COUNT(o.Order_id) AS AvgOrderValue,
    CASE
        WHEN SUM(o.total_price) / COUNT(o.Order_id) > 200 THEN 'High Value'
        WHEN SUM(o.total_price) / COUNT(o.Order_id) BETWEEN 200 AND 0 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS CustomerSegment
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
GROUP BY c.Customer_id
ORDER BY TotalSpent DESC;

SELECT 
    DATE_FORMAT(Order_date, '%Y-%m') AS Month,
    COUNT(DISTINCT Customer_id) AS MonthlyActiveUsers
FROM Orders
GROUP BY Month
ORDER BY Month;

SELECT
    p.Product_id,
    p.description
FROM Product p

WHERE p.Product_id NOT IN (
    SELECT oi.Product_id
    FROM Order_item oi
    JOIN Orders o ON oi.Order_id = o.Order_id
    WHERE o.Order_date >= CURDATE() - INTERVAL 1 MONTH
)
ORDER BY p.Product_id;







