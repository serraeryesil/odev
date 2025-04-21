# Online Education Platform - PostgreSQL Database FINAL Project 

This project was developed as part of the TurkStudentCo Data Science Bootcamp SQL Final Assignment. The goal of the project is to design and implement a relational database schema for an **Online Education Platform** using PostgreSQL. The database supports user registration, course participation, certification, and a blogging system for users.

## Project Scope

The database design covers the following core functionalities:

- **User Registration and Profile Management**
- **Course Catalog with Category Classification**
- **User Enrollments in Courses**
- **Issuing and Assigning Certificates to Users**
- **User-generated Blog Posts**
- **Timestamped activity tracking (registration, enrollment, publication, etc.)**

---

## Tables Overview

| Table Name             | Purpose |
|------------------------|---------|
| `Members`              | Stores user profile and login information |
| `Categories`           | Stores course categories (e.g. AI, Cybersecurity) |
| `Courses`              | Stores course metadata, linked to categories |
| `Enrollments`          | Tracks which users are enrolled in which courses |
| `Certificates`         | Stores issued certificates for completed courses |
| `CertificateAssignments` | Links users to their earned certificates |
| `BlogPosts`            | Stores user-generated blog content |

All tables use **primary keys**, and appropriate **foreign key constraints** are implemented to ensure referential integrity. Unique constraints are also applied where necessary (e.g., `username`, `email`, `certificate_code`).

---

## 🔧 Technologies Used

- **PostgreSQL**
- **pgAdmin 4** (for executing queries and ERD visualization)
- **SQL (DDL & DML)**

---

## Files in this Repository

| File | Description |
|------|-------------|
| `online_education_platform.sql` | Complete SQL script to create all tables, constraints, and insert sample data |
| `schema_diagram.png`           | Visual entity-relationship diagram (ERD) showing table structure and relations |
| `README.md`                    | Project description and documentation (this file) |

---

## How to Run

1. Open **pgAdmin** and connect to your PostgreSQL server.
2. Create a new database (e.g., `education_platform`).
3. Open the `online_education_platform.sql` file in Query Tool.
4. Run the script to create the schema and populate it with sample data.
5. View the tables and try custom queries!

---

## Notes

- The schema is designed to be scalable and normalized.
- Sample data is included for each table to assist with testing and demonstration.
- The project follows good practices in database design: use of data types, constraint definitions, timestamp fields, and data integrity.

---

## Deliverable Summary

- ✔️ All required tables are created
- ✔️ Primary & foreign key relationships established
- ✔️ Sample data provided
- ✔️ ERD screenshot included
- ✔️ GitHub repo created and made public

---

Thank you for reviewing this project!  
Feel free to explore the schema and extend it for advanced features such as quizzes, messaging, or admin dashboards.
