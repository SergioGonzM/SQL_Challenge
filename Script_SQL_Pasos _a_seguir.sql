BEGIN;

\set product_id 457;
\set product_quantity 10;
\set customer_id 123;

--1. QUE EL PRODUCTO ESTE DISPONIBLE PARA LA VENTA Y QUE HAYA EXISTENCIAS
SELECT * FROM product
WHERE id = :product_id AND available_for_selling='true' AND stock > :product_quantity;

--2. ACTUALIZANDO EXISTENCIAS DESPUES DE LA VENTA
UPDATE product 
SET stock = stock - :product_quantity
WHERE id = :id_producto;

--3. INSERTANDO VENTA EN LA TABLA DE ORDERS
INSERT INTO orders (product_id, customer_id, quantity_sold)
VALUES (:product_id, :customer_id, :product_quantity);

--4. ACTUALIZANDO LA DISPONIBILIDAD PARA VENTA SI SE AGOTA EL PRODUCTO
UPDATE product 
SET available_for_selling ='false'
WHERE id = :product_id AND stock <= 0;


COMMIT;







BEGIN;

--1. QUE EL PRODUCTO ESTE DISPONIBLE PARA LA VENTA
SELECT * FROM product
WHERE id = 457 AND available_for_selling='true' AND stock > 10;

--2. ACTUALIZANDO EXISTENCIAS DESPUES DE LA VENTA
UPDATE product 
SET stock = stock - 10
WHERE id = 457;

--3. INSERTANDO VENTA EN LA TABLA DE ORDERS
INSERT INTO orders (product_id, customer_id, quantity_sold)
VALUES (457, 123, 10);

--4. ACTUALIZANDO LA DISPONIBILIDAD PARA VENTA SI SE AGOTA EL PRODUCTO
UPDATE product 
SET available_for_selling ='false'
WHERE id = 457 AND STOCK <= 0;

COMMIT;