# Bank Management System 

A simple relational database project using **MySQL** to manage customer accounts and financial transactions. This project simulates a basic banking system with features like customer records, account types, and transaction history (deposits and withdrawals).

## Features

- Customer profile management
- Account creation with types (Savings, Checking, etc.)
- Transaction tracking (deposit, withdrawal)
- Data integrity using foreign keys
- Sample data for Customers, Accounts, and Transactions
- SQL queries to:
  - View balances
  - Get account-wise transaction reports
  - Monitor deposits/withdrawals
  - Track inactive accounts or low balances

## Database Structure

### 1. Customers Table
Stores customer personal details.

```sql
CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20)
);
