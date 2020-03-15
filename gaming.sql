/* 
1. Report:
	Who ordered the first article?
 */

 SELECT customer.first_name, customer.last_name, `order`.fk_order_item_id
FROM customer
INNER JOIN `order`
ON `order`.`fk_customer_id`=customer.customer_id
WHERE fk_order_item_id=1;