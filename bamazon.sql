DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE products(
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR NOT NULL,
  department_name VARCHAR NOT NULL,
  price INT default 0,
  stock_quantity INT,
  PRIMARY KEY (ID)
);

USE bamazon_DB;

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("iPhone", "Smartphones", 500, 800);
VALUES ("Nintendo Switch", "Video Games", 300, 500);
VALUES ("Nike Air Sneakers", "Footwear", 150, 250);
VALUES ("Coffee Table", "Furniture", 400, 600);
VALUES ("Boxing Gloves", "Sporting Goods", 40, 90);
VALUES ("Samsung TV", "Television", 700, 900);
VALUES ("LG Refrigerator", "Appliances", 800, 900);
VALUES ("Microsoft Zune", "Antiques", 700, 900);
VALUES ("Gerber Baby Food", "Infants/Toddlers", 80, 2000);
VALUES ("Avengers: Infinity War Blu-Ray", "Movies & Film", 20, 10000);
