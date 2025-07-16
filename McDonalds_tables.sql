create schema business

-- PRODUCTS
CREATE TABLE business.products (
    product_id VARCHAR(20) PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    calories INT,
    is_vegetarian BOOLEAN,
    is_available BOOLEAN,
    launch_date DATE
);

-- STORES
CREATE TABLE business.stores (
    store_id VARCHAR(20) PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    opening_date DATE,
    is_franchise BOOLEAN
);

-- CUSTOMERS
CREATE TABLE business.customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    loyalty_status VARCHAR(20),
    join_date DATE
);

-- SALES
CREATE TABLE business.sales (
    sale_id VARCHAR(20) PRIMARY KEY,
    product_id VARCHAR(20),
    store_id VARCHAR(20),
    customer_id VARCHAR(20),
    quantity INT,
    sale_date DATE,
    sale_time TIME,
    payment_method VARCHAR(20),
    discount DECIMAL(5,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES business.products(product_id),
    FOREIGN KEY (store_id) REFERENCES business.stores(store_id),
    FOREIGN KEY (customer_id) REFERENCES business.customers(customer_id)
);

-- INVENTORY
CREATE TABLE business.inventory (
    inventory_id VARCHAR(20) PRIMARY KEY,
    store_id VARCHAR(20),
    product_id VARCHAR(20),
    stock_level INT,
    reorder_level INT,
    last_restocked DATE,
    supplier_name VARCHAR(100),
    FOREIGN KEY (store_id) REFERENCES business.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES business.products(product_id)
);

-- EMPLOYEES
CREATE TABLE business.employees (
    employee_id VARCHAR(20) PRIMARY KEY,
    store_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2),
    status VARCHAR(20), -- Active, On Leave, Resigned
    shift_type VARCHAR(20), -- Morning, Evening, Night
    performance_rating DECIMAL(3,2),
    last_appraisal_date DATE,
    FOREIGN KEY (store_id) REFERENCES business.stores(store_id)
);

-- SUPPLIERS
CREATE TABLE business.suppliers (
    supplier_id VARCHAR(20) PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    rating DECIMAL(3,2)
);

-- DELIVERIES
CREATE TABLE business.deliveries (
    delivery_id VARCHAR(20) PRIMARY KEY,
    supplier_id VARCHAR(20),
    store_id VARCHAR(20),
    delivery_date DATE,
    expected_date DATE,
    delivery_status VARCHAR(20), -- Delivered, Delayed, Cancelled
    total_items INT,
    total_cost DECIMAL(12,2),
    received_by VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES business.suppliers(supplier_id),
    FOREIGN KEY (store_id) REFERENCES business.stores(store_id)
);

-- DIGITAL ENGAGEMENT
CREATE TABLE business.digital_engagement (
    engagement_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    engagement_date DATE,
    platform VARCHAR(20), -- App, Web
    activity_type VARCHAR(50), -- Click, Promo View, App Order
    campaign_name VARCHAR(100),
    time_spent_seconds INT,
    converted BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES business.customers(customer_id)
);

-- FEEDBACK
CREATE TABLE business.feedback (
    feedback_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    store_id VARCHAR(20),
    product_id VARCHAR(20),
    feedback_date DATE,
    rating INT,
    feedback_text TEXT,
    sentiment_score DECIMAL(3,2), -- 1.0 positive, 0.0 neutral, -1.0 negative
    FOREIGN KEY (customer_id) REFERENCES business.customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES business.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES business.products(product_id)
);

