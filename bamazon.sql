DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE products(
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(255) NOT NULL,
  department_name VARCHAR(255) NOT NULL,
  price INT default 0,
  stock_quantity INT default 0,
  PRIMARY KEY (ID)
);

USE bamazon_DB;

INSERT INTO products (product_name, department_name, price, stock_quantity)

VALUES 
("iPhone", "Smartphones", 500, 800),
("Nintendo Switch", "Video Games", 300, 500),
("Nike Air Sneakers", "Footwear", 150, 250),
("Coffee Table", "Furniture", 400, 600),
("Boxing Gloves", "Sporting Goods", 40, 90),
("Samsung TV", "Television", 700, 900),
("LG Refrigerator", "Appliances", 800, 900),
("Microsoft Zune", "Antiques", 700, 900),
("Gerber Baby Food", "Infants/Toddlers", 80, 2000),
("Avengers: Infinity War Blu-Ray", "Movies & Film", 20, 10000);
