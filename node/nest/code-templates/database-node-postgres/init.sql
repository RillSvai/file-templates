-- Only for demo. Should not be commited

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    weight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, description, price, stock_quantity, weight)
VALUES
    ('Product 1', 'Description of Product 1', 10.99, 100, 1.5),
    ('Product 2', 'Description of Product 2', 19.99, 50, 2.0),
    ('Product 3', 'Description of Product 3', 5.99, 200, 0.75),
    ('Product 4', NULL, 29.99, 80, 1.8),
    ('Product 5', 'Description of Product 5', 15.49, 120, 1.0),
    ('Product 6', 'Description of Product 6', 8.99, 300, 1.2),
    ('Product 7', 'Description of Product 7', 12.99, 70, 1.6),
    ('Product 8', 'Description of Product 8', 24.99, 150, 2.3),
    ('Product 9', NULL, 18.79, 90, 1.9),
    ('Product 10', 'Description of Product 10', 6.59, 180, 1.0);