COPY aisles
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\aisles.csv'
DELIMITER ',' CSV HEADER;

COPY departments
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\departments.csv'
DELIMITER ',' CSV HEADER;

COPY order_products__prior
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\order_products__prior.csv'
DELIMITER ',' CSV HEADER;

COPY order_products__train
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\order_products__train.csv'
DELIMITER ',' CSV HEADER;

COPY orders
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\orders.csv'
DELIMITER ',' CSV HEADER;

COPY products
FROM 'C:\DataNerd\Instacart_Data_Analysis_Project\csv_files\products.csv'
DELIMITER ',' CSV HEADER;
