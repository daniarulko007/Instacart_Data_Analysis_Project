CREATE TABLE public.aisles
(
    aisles_id INT PRIMARY KEY,
    aisle TEXT
);

CREATE TABLE public.departments
(
    department_id INT PRIMARY KEY,
    department TEXT
);

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name TEXT,
    aisle_id INT,
    department_id INT,
    FOREIGN KEY (aisle_id) REFERENCES public.aisles (aisles_id),
    FOREIGN KEY (department_id) REFERENCES public.departments (department_id)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set TEXT,
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order REAL
);

CREATE TABLE order_products__prior
(
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

DROP table order_products__prior

CREATE TABLE order_products__train
(
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.aisles OWNER to postgres;
ALTER TABLE public.departments OWNER to postgres;
ALTER TABLE public.products OWNER to postgres;
ALTER TABLE public.orders OWNER to postgres;
ALTER TABLE public.order_products__prior OWNER to postgres;
ALTER TABLE public.order_products__train OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_aisle_id ON public.products (aisle_id);
CREATE INDEX idx_department_id ON public.products (department_id);

