--companie names-products names
SELECT companie.Name, product.Name FROM companie INNER JOIN famazon on companie.Companie_id = famazon.fk_companie_id INNER JOIN product on famazon.fk_product_id = product.product_id;
--compani "Ric"-product names
SELECT product.* FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN companie on famazon.fk_companie_id = companie.Companie_id WHERE companie.Name = "Ric";
--companie "Ric"-how many products
SELECT COUNT(product_id) FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN companie on famazon.fk_companie_id = companie.Companie_id WHERE companie.Name = "Ric";

--who purchased products on this date
SELECT customer.lName, customer.fName, customer.Customer_id FROM customer INNER JOIN `order` on customer.fk_order_id = `order`.`Order_id` WHERE `order`.OrderDate = "2022-03-01";

--what  products were sent between this and that date 
SELECT product.*, `order`.`ShipDate` FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer ON famazon.fk_customer_id = customer.Customer_id INNER JOIN `order` on customer.fk_order_id = `order`.Order_id WHERE `order`.ShipDate BETWEEN "2022-01-01" and "2022-03-10";
--or between this and today 
SELECT product.*, `order`.`ShipDate` FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer ON famazon.fk_customer_id = customer.Customer_id INNER JOIN `order` on customer.fk_order_id = `order`.Order_id WHERE `order`.ShipDate BETWEEN "2022-01-01" and CURRENT_DATE;

--how many products were sent to a specific city etc. 
SELECT COUNT(product_id) FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer on famazon.fk_customer_id = customer.Customer_id INNER JOIN `order` on customer.fk_order_id = `order`.`Order_id` INNER JOIN shiping on `order`.Fk_ship_id = shiping.shiping_id WHERE shiping.EndLocation = "Salzburg";

--
SELECT product.Name, product.Price, `order`.OrderDate, `order`.DeliveryDate, shiping.EndLocation FROM product INNER JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer on famazon.fk_customer_id = customer.Customer_id INNER JOIN `order` on customer.fk_order_id = `order`.`Order_id` INNER JOIN shiping on `order`.Fk_ship_id = shiping.shiping_id WHERE shiping.EndLocation = "Salzburg";

SELECT product.Name, product.Price, `order`.OrderDate, `order`.DeliveryDate, shiping.EndLocation FROM product LEFT JOIN famazon ON product.product_id = famazon.fk_product_id LEFT JOIN customer on famazon.fk_customer_id = customer.Customer_id LEFT JOIN `order` on customer.fk_order_id = `order`.`Order_id` LEFT JOIN shiping on `order`.Fk_ship_id = shiping.shiping_id;
SELECT product.Name, product.Price, `order`.OrderDate, `order`.DeliveryDate, shiping.EndLocation FROM product RIGHT JOIN famazon ON product.product_id = famazon.fk_product_id RIGHT JOIN customer on famazon.fk_customer_id = customer.Customer_id RIGHT JOIN `order` on customer.fk_order_id = `order`.`Order_id` RIGHT JOIN shiping on `order`.Fk_ship_id = shiping.shiping_id WHERE shiping.EndLocation = "Salzburg";

--subquery
SELECT * FROM `set` WHERE `set`.set_id in(SELECT p.fk_set_id from product p WHERE `set`.`set_id` = 5);
SELECT * FROM `order` WHERE `order`.Order_id in(SELECT c.fk_order_id from customer c WHERE `order`.PriceSum >= 250);

