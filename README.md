# 🛒 E-Commerce Database — MySQL

A fully structured relational database for an E-Commerce platform, built with MySQL. Includes schema design, sample data, and SQL queries ranging from beginner to advanced.

---

## 📦 Database: `E_Commerce`

### Tables

| Table | Description |
|---|---|
| `Customers` | Stores customer personal and contact info |
| `Categories` | Product categories (Electronics, Clothing, etc.) |
| `Products` | Product listings with price and stock info |
| `Orders` | Customer orders with status and total amount |
| `Order_Items` | Individual items within each order |
| `Payments` | Payment records with method and status |
| `Reviews` | Customer ratings and comments on products |
| `Shipping` | Shipping details and delivery tracking |

---

## 🗂️ Schema Overview
```
Customers ──< Orders ──< Order_Items >── Products >── Categories
                  │
             Payments
                  │
             Shipping

Customers ──< Reviews >── Products
```

---

## 📊 Sample Data

- **10 Customers** from cities across Pakistan (Karachi, Lahore, Islamabad, Peshawar, Rawalpindi)
- **8 Categories** — Electronics, Clothing, Books, Home Appliances, Sports, Beauty, Toys, Furniture
- **15 Products** including phones, laptops, appliances, books, and more
- **12 Orders** with statuses: Delivered, Shipped, Pending, Cancelled
- **12 Payments** via JazzCash, EasyPaisa, Bank Transfer, Cash on Delivery
- **10 Reviews** with ratings and comments
- **12 Shipping** records with cities and delivery dates

---

## 🔍 Queries Included

### Easy
- Customers from Karachi
- Products priced above 10,000 (sorted by price)
- All delivered orders
- Payments made via JazzCash

### Moderate
- Customers with their orders (INNER JOIN)
- Products with their category names (JOIN)
- Total spending per customer (GROUP BY + SUM)
- Orders with payment details (JOIN)

### Hard
- Customers with their ordered item quantities (multi-table JOIN)
- Customers with more than one order (GROUP BY + HAVING)
- Top-rated product (MAX + ORDER BY + LIMIT)

---

## Getting Started

1. Make sure you have **MySQL** installed
2. Open your MySQL client (MySQL Workbench, DBeaver, or terminal)
3. Run the file:
```bash
mysql -u root -p < SQL7.sql
```

Or open `SQL7.sql` in MySQL Workbench and execute it.

---

## 🛠️ Tech Stack

- **Database**: MySQL
- **Language**: SQL

---

## 👤 Author

**Muhammad Ammar Saleem**
GitHub: [@m2ammar](https://github.com/m2ammar)
