# Hospital Management System

A relational database system built with Oracle SQL and PL/SQL to manage core 
hospital operations including patient registration, appointment scheduling, 
inventory management, and billing/payment processing.

## Features
- Patient registration, search, and record management
- Appointment scheduling with availability validation
- Inventory tracking and automated stock updates
- Payment processing and billing verification
- Automated workflows via PL/SQL stored procedures, functions, and triggers

## Tech Stack
- Oracle SQL
- PL/SQL (stored procedures, triggers, functions, cursors)
- PostgreSQL-compatible schema design

## Project Structure
- `/scripts` — All SQL DDL and DML scripts for table creation, procedures, and test data
- `/docs` — Full project documentation including ERD, schema design, and test cases

## How to Run
1. Connect to an Oracle SQL or compatible database instance
2. Run `Database_tables_objects_creation.txt` first to create all tables and objects
3. Execute individual `/scripts` files to load procedures and test scenarios
4. Use `Samples_Testing.txt` to validate functionality

## Academic Context
Built as a term project for COMP214 — Advanced Database Concepts at Centennial College (2024).
Team project demonstrating normalized schema design, referential integrity, and enterprise-grade 
PL/SQL automation for a multi-department hospital environment.
