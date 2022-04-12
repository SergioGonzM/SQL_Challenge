create table product (
	id SERIAL PRIMARY KEY,
	product VARCHAR(50) NOT NULL,
	stock INT,
	available_for_selling VARCHAR(50) NOT NULL
);

create table customers (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
	email VARCHAR(50),
	address VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
	product_id INT,
	customer_id INT,
    quantity_sold INT,
	CONSTRAINT fk_product
		FOREIGN KEY(product_id)
			REFERENCES product (id),
	CONSTRAINT fk_customers
		FOREIGN KEY(customer_id)
			REFERENCES customers (id)
);