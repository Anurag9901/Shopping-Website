create database test;
use test;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from users;

-- Categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from categories;


-- Products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(500),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Insert sample data
INSERT INTO categories (name, description) VALUES 
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Clothing and fashion items'),
('Books', 'Books and educational materials');

INSERT INTO products (name, description, price, image_url, category_id) VALUES 
('Laptop', 'High-performance laptop for work and gaming', 999.99, 'laptop.jpg', 1),
('Smartphone', 'Latest smartphone with advanced features', 699.99, 'phone.jpg', 1),
('T-Shirt', 'Comfortable cotton t-shirt', 19.99, 'tshirt.jpg', 2),
('Java Programming Book', 'Complete guide to Java programming', 49.99, 'java-book.jpg', 3);

INSERT INTO products (name, description, price, image_url) VALUES ('Premium Wireless Headphones', 'High-quality noise-cancelling headphones with 30-hour battery life', 299.99, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Smart Fitness Watch', 'Track your workouts, heart rate, and daily activities', 199.99, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Leather Laptop Bag', 'Premium genuine leather laptop bag for professionals', 149.99, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Bluetooth Speaker', 'Portable waterproof speaker with crystal clear sound', 79.99, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Gaming Mouse', 'High-precision gaming mouse with RGB lighting', 89.99, 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Wireless Keyboard', 'Mechanical wireless keyboard for productivity', 129.99, 'https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Smart Phone Stand', 'Adjustable phone stand for desk and bedside', 24.99, 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Coffee Maker', 'Automatic drip coffee maker with programmable timer', 159.99, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Desk Lamp', 'LED desk lamp with adjustable brightness and color', 49.99, 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Travel Backpack', 'Durable travel backpack with laptop compartment', 119.99, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Wireless Charger', 'Fast wireless charging pad for smartphones', 39.99, 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Water Bottle', 'Insulated stainless steel water bottle', 29.99, 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Reading Glasses', 'Blue light blocking glasses for computer use', 34.99, 'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Yoga Mat', 'Non-slip exercise yoga mat with carrying strap', 45.99, 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Tablet Stand', 'Adjustable aluminum stand for tablets and iPads', 59.99, 'https://images.unsplash.com/photo-1527443195645-1133f7f28990?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Wireless Earbuds', 'True wireless earbuds with noise cancellation', 179.99, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Desk Organizer', 'Bamboo desk organizer with multiple compartments', 39.99, 'https://images.unsplash.com/photo-1586953208448-b95a79798f07?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Power Bank', 'Portable 20000mAh power bank with fast charging', 49.99, 'https://images.unsplash.com/photo-1609592160530-b4ce64961d06?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Phone Case', 'Protective clear case with reinforced corners', 19.99, 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Bluetooth Tracker', 'Small tracking device for keys and valuables', 29.99, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Desk Chair', 'Ergonomic office chair with lumbar support', 299.99, 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Monitor Stand', 'Wooden monitor stand with storage space', 69.99, 'https://images.unsplash.com/photo-1527443195645-1133f7f28990?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Cable Management', 'Under-desk cable tray for organization', 24.99, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Plant Pot', 'Ceramic plant pot with drainage saucer', 34.99, 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=400');
INSERT INTO products (name, description, price, image_url) VALUES ('Air Purifier', 'HEPA air purifier for home and office', 199.99, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400');

select * from products;

UPDATE products
SET image_url='https://m.media-amazon.com/images/I/61kYmRqjzaL._AC_UL640_QL65_.jpg',
name='LEOTUDE Casual Half Sleeve Cottonblend Printed Round Neck Drop Shoulder Oversized Tshirt for Man (Color Brown)', price= 269, 
description='Oversized T-shirt, loose fit, so very comfortable to wear, also looks very trendy & classy'
WHERE id = 3;



