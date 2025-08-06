CREATE DATABASE Bank;
USE Bank;
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2),
    transaction_type VARCHAR(10), -- 'deposit' or 'withdrawal'
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
INSERT INTO Customers (name, email, phone) VALUES
('John Doe', 'john@example.com', '1234567890'),
('Jane Smith', 'jane@example.com', '9876543210'),
('Alice Johnson', 'alice@example.com', '5551122334'),
('Bob Lee', 'bob@example.com', '6662233445'),
('Clara West', 'clara@example.com', '7773344556'),
('Daniel Craig', 'daniel@example.com', '8884455667'),
('Emily Stone', 'emily@example.com', '9995566778');
INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(1, 'Savings', 1000.00),
(2, 'Checking', 2000.00),
(3, 'Savings', 1500.00),
(4, 'Checking', 500.00),
(5, 'Savings', 3000.00),
(6, 'Checking', 1200.00),
(7, 'Savings', 800.00);
INSERT INTO Transactions (account_id, transaction_date, amount, transaction_type) VALUES
(1, '2025-08-01', 200.00, 'deposit'),
(1, '2025-08-02', 50.00, 'withdrawal'),
(2, '2025-08-01', 500.00, 'deposit'),
(3, '2025-08-03', 100.00, 'deposit'),
(3, '2025-08-04', 200.00, 'withdrawal'),
(4, '2025-08-01', 50.00, 'deposit'),
(4, '2025-08-02', 25.00, 'withdrawal'),
(5, '2025-08-02', 1000.00, 'deposit'),
(5, '2025-08-03', 500.00, 'withdrawal'),
(6, '2025-08-03', 300.00, 'deposit'),
(6, '2025-08-04', 100.00, 'withdrawal'),
(7, '2025-08-01', 150.00, 'deposit');
SELECT name, phone FROM Customers;
SELECT account_id, customer_id, balance FROM Accounts WHERE balance > 1000;
SELECT * FROM Accounts WHERE account_type = 'Savings';
SELECT * FROM Transactions WHERE account_id = 3;
SELECT SUM(amount) AS total_deposit FROM Transactions WHERE account_id = 5 AND transaction_type = 'deposit';
SELECT SUM(amount) AS total_deposit FROM Transactions WHERE account_id = 5 AND transaction_type = 'deposit';
SELECT customer_id, COUNT(*) AS account_count FROM Accounts GROUP BY customer_id;
SELECT c.name, a.balance FROM Customers c JOIN Accounts a ON c.customer_id = a.customer_id;
SELECT * FROM Transactions WHERE transaction_type = 'withdrawal' AND transaction_date = '2025-08-02';
SELECT MAX(amount) AS max_transaction FROM Transactions;
SELECT account_id, COUNT(*) AS transaction_count FROM Transactions GROUP BY account_id;