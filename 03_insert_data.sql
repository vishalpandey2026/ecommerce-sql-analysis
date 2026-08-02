USE ecommerce_analytics;

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Home & Kitchen'),
(3, 'Fashion'),
(4, 'Books'),
(5, 'Fitness');

INSERT INTO customers VALUES
(101, 'Aarav Sharma', 'Mumbai', 'Maharashtra', '2025-01-12'),
(102, 'Priya Verma', 'Delhi', 'Delhi', '2025-01-20'),
(103, 'Rohan Gupta', 'Bengaluru', 'Karnataka', '2025-02-05'),
(104, 'Sneha Patel', 'Ahmedabad', 'Gujarat', '2025-02-18'),
(105, 'Vikram Singh', 'Lucknow', 'Uttar Pradesh', '2025-03-02'),
(106, 'Ananya Das', 'Kolkata', 'West Bengal', '2025-03-15'),
(107, 'Kunal Mehta', 'Pune', 'Maharashtra', '2025-04-01'),
(108, 'Neha Joshi', 'Jaipur', 'Rajasthan', '2025-04-12'),
(109, 'Aditya Rao', 'Hyderabad', 'Telangana', '2025-05-03'),
(110, 'Pooja Nair', 'Kochi', 'Kerala', '2025-05-19'),
(111, 'Rahul Yadav', 'Noida', 'Uttar Pradesh', '2025-06-07'),
(112, 'Meera Iyer', 'Chennai', 'Tamil Nadu', '2025-06-21');

INSERT INTO products VALUES
(201, 'Wireless Mouse', 1, 799.00, 120),
(202, 'Bluetooth Speaker', 1, 1499.00, 80),
(203, 'USB-C Hub', 1, 1299.00, 65),
(204, 'Mixer Grinder', 2, 2499.00, 45),
(205, 'Electric Kettle', 2, 1199.00, 70),
(206, 'Cotton Bedsheet', 2, 999.00, 90),
(207, 'Running Shoes', 3, 2299.00, 55),
(208, 'Casual Shirt', 3, 1299.00, 75),
(209, 'Data Analytics Book', 4, 699.00, 100),
(210, 'SQL Practice Guide', 4, 599.00, 110),
(211, 'Yoga Mat', 5, 899.00, 60),
(212, 'Resistance Bands', 5, 499.00, 85);

INSERT INTO orders VALUES
(1001, 101, '2025-06-01', 'Delivered'),
(1002, 102, '2025-06-03', 'Delivered'),
(1003, 103, '2025-06-05', 'Delivered'),
(1004, 101, '2025-06-12', 'Delivered'),
(1005, 104, '2025-06-15', 'Cancelled'),
(1006, 105, '2025-06-18', 'Delivered'),
(1007, 106, '2025-06-21', 'Delivered'),
(1008, 107, '2025-06-25', 'Shipped'),
(1009, 108, '2025-07-02', 'Delivered'),
(1010, 109, '2025-07-05', 'Delivered'),
(1011, 110, '2025-07-08', 'Delivered'),
(1012, 102, '2025-07-12', 'Delivered'),
(1013, 111, '2025-07-15', 'Delivered'),
(1014, 112, '2025-07-20', 'Delivered'),
(1015, 103, '2025-07-25', 'Delivered'),
(1016, 101, '2025-08-01', 'Delivered'),
(1017, 107, '2025-08-04', 'Delivered'),
(1018, 109, '2025-08-08', 'Cancelled');

INSERT INTO order_items VALUES
(1, 1001, 201, 2, 799.00),
(2, 1001, 210, 1, 599.00),
(3, 1002, 202, 1, 1499.00),
(4, 1002, 211, 1, 899.00),
(5, 1003, 207, 1, 2299.00),
(6, 1003, 209, 2, 699.00),
(7, 1004, 203, 1, 1299.00),
(8, 1004, 201, 1, 799.00),
(9, 1005, 204, 1, 2499.00),
(10, 1006, 205, 2, 1199.00),
(11, 1007, 206, 2, 999.00),
(12, 1008, 208, 2, 1299.00),
(13, 1009, 212, 3, 499.00),
(14, 1010, 202, 2, 1499.00),
(15, 1011, 211, 2, 899.00),
(16, 1012, 210, 2, 599.00),
(17, 1013, 207, 1, 2299.00),
(18, 1014, 204, 1, 2499.00),
(19, 1015, 203, 2, 1299.00),
(20, 1016, 201, 3, 799.00),
(21, 1017, 205, 1, 1199.00),
(22, 1018, 202, 1, 1499.00);
