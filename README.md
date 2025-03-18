# Database Design Project

## Overview

This project involves designing a database system for a company that provides services to bus companies. The system covers two main services:

1. **Driver Outsourcing** - Managing the assignment and tracking of outsourced drivers.
2. **Trip, Maintenance, and Ticket Management** - Recording bus trips, maintenance activities, and ticket sales.

The project is structured into three essential stages:

1. **Conceptual Model** - High-level representation using ER diagrams.
2. **Logical Model** - Translating the conceptual model into a relational schema.
3. **Physical Model** - Implementing the database using SQL.

## Project Structure

- `/conceptual-model/` - Contains ER diagrams and documentation.
- `/logical-model/` - Includes relational schemas and normalization process.
- `/physical-model/` - SQL scripts for database creation and sample data.

## Steps

### 1. Conceptual Model

- Define entities, attributes, and relationships.
- Create an Entity-Relationship (ER) diagram.

### 2. Logical Model

- Convert the ER diagram into a relational schema.
- Normalize tables to reduce redundancy and improve integrity.

### 3. Physical Model

- Write SQL scripts to create tables, constraints, and indexes.
- Insert sample data for testing.

## Technologies Used

- **Database Management System**: \_
- **Diagram Tools**: [EERCASE](https://sites.google.com/a/cin.ufpe.br/eercase)
- **SQL**: DDL (Data Definition Language), DML (Data Manipulation Language)

## Getting Started

1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/linebus-database.git
   ```
2. Navigate to the project directory:
   ```sh
   cd linebus-database
   ```
3. Execute the SQL scripts in your preferred DBMS:
   ```sh
   psql -U user -d database -f physical-model/create_database.sql
   ```

## Contributing

Feel free to fork the repository and submit pull requests to improve the project!

## License

This project is licensed under the MIT License.
