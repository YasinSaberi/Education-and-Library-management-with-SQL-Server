# University Database Management System

## Project Overview

This project implements a comprehensive relational database management system designed to manage core operations for a modern university. It is meticulously structured into two primary interconnected schemas: **Education** and **Library**, providing a holistic solution for academic and resource management.

The database is built on **SQL Server** and its codebase has undergone a significant "appearance overhaul." While preserving all original logical functionalities and core business rules, the SQL scripts have been refactored with new naming conventions, consistent formatting, and newly generated realistic test data, making the codebase clean, organized, and easily navigable.

## Key Features

### Modular Design
* **Education Schema:** Manages all academic aspects, including students, instructors, departments, courses, enrollments, and academic progress.
* **Library Schema:** Handles library resources, including books, authors, publishers, book copies, member borrowings, returns, and fines.

### Cross-Schema Interactivity
* **Automatic Library Account Creation:** Student registration in the Education schema automatically creates a corresponding library member account.
* **Library Access Deactivation:** Student status changes (e.g., graduation, expulsion) in the Education schema automatically deactivate their library borrowing privileges.
* **National ID Validation:** Ensures the integrity of national identification codes for all new student, instructor, and admin registrations.

### Smart Recommendation Systems
* **Course Suggestion:** Recommends courses to students based on their major's curriculum plan, unpassed courses, and term acquisition priority.
* **Book Recommendation:** Implements a collaborative filtering algorithm to suggest books to library members based on the borrowing patterns of similar users.

### Robust Data Management
* **Normalized Design:** Tables are designed following normalization principles to minimize data redundancy and improve integrity.
* **Comprehensive Data Operations:** Includes DDL (Data Definition Language) for schema and table creation, as well as DML (Data Manipulation Language) for data insertion, deletion, and updates.
* **Transactional Integrity:** Critical operations are encapsulated within transactions to ensure atomicity and data consistency.

### Role-Based Access Control
* Database roles (Admin, Librarian, Student) are defined with specific granular permissions (e.g., `INSERT` for Admins, `EXECUTE` for Librarians on borrowing procedures, `SELECT` on relevant views for Students) to enforce security and separation of duties.

### Code Transformation & Organization
* **Unified Naming Conventions:** All tables, columns, functions, stored procedures, and triggers adhere to a consistent, descriptive naming standard.
* **Clean Codebase:** All SQL scripts are free of comments and follow a uniform formatting style for improved readability.
* **Structured Project Layout:** Files are logically grouped into folders by schema and script type, simplifying navigation and maintenance.

## Technologies Used

* **Database System:** Microsoft SQL Server
* **Management Tool:** SQL Server Management Studio (SSMS)
* **Language:** T-SQL

## Project Structure

The project is organized into a clear directory structure:
Your_Project_Root/
├── Database_Setup/              # Scripts for initial database and security setup
├── Education_Schema/            # Scripts for the academic and administrative schema
│   ├── DDL/                     # Table definitions
│   ├── Data_Inserts/            # Scripts to insert test data
│   ├── Data_Deletes/            # Scripts to delete existing data
│   ├── Functions/               # User-defined functions
│   ├── Stored_Procedures/       # Stored procedures
│   └── Triggers/                # Database triggers
└── Library_Schema/              # Scripts for the university library schema
├── DDL/                     # Table definitions
├── Data_Inserts/            # Scripts to insert test data
├── Data_Deletes/            # Scripts to delete existing data
├── Functions/               # User-defined functions
├── Stored_Procedures/       # Stored procedures
└── Triggers/                # Database triggers

## Setup and Installation

To set up and run this database project, follow these steps:

### Prerequisites
* Microsoft SQL Server (e.g., Express, Developer Edition)
* SQL Server Management Studio (SSMS)

### Installation Steps

1.  **Create the Database:**
    Open SSMS, connect to your SQL Server instance, and execute the script:
    `Database_Setup/01_Create_Database.sql`

2.  **Create Schemas:**
    Execute the following scripts:
    * `Database_Setup/02_Create_Education_Schema.sql`
    * `Database_Setup/03_Create_Library_Schema.sql`

3.  **Create Tables (DDL):**
    Navigate to the `Education_Schema/DDL/` and `Library_Schema/DDL/` folders. **Execute the `.sql` files in a logical order to satisfy foreign key dependencies.** A general recommended order is:
    * `EDU_01_Admins_Table.sql`
    * `EDU_03_Departments_Table.sql`
    * `EDU_04_Majors_Table.sql`
    * `EDU_05_Students_Table.sql` (depends on Departments, Majors)
    * `EDU_06_Instructors_Table.sql` (depends on Departments)
    * `EDU_15_Userlink_Table.sql`
    * `EDU_16_UserAccounts_Table.sql` (depends on Userlink)
    * `EDU_02_Addresses_Table.sql`
    * `EDU_07_Courses_Table.sql` (depends on Majors, Departments)
    * `EDU_08_Semesters_Table.sql`
    * `EDU_09_CourseOfferings_Table.sql` (depends on Courses, Instructors, Semesters)
    * `EDU_10_ClassSchedules_Table.sql` (depends on CourseOfferings)
    * `EDU_11_ExamSchedules_Table.sql` (depends on CourseOfferings)
    * `EDU_12_Enrollments_Table.sql` (depends on Students, CourseOfferings)
    * `EDU_13_StudentCourses_Table.sql` (depends on Enrollments)
    * `EDU_14_StudentStatusChanges_Table.sql` (depends on Students, Semesters)
    * `EDU_17_EventLogs_Table.sql`
    * `EDU_18_CurriculumPlan_Table.sql` (depends on Majors, Courses)
    * `LIB_01_Authors_Table.sql`
    * `LIB_02_Publishers_Table.sql`
    * `LIB_03_Categories_Table.sql`
    * `LIB_04_Books_Table.sql` (depends on Publishers, Categories)
    * `LIB_05_BookAuthors_Table.sql` (depends on Books, Authors)
    * `LIB_06_BookCopies_Table.sql` (depends on Books)
    * `LIB_07_Members_Table.sql` (depends on Education.Students)
    * `LIB_08_Borrowing_Table.sql` (depends on Members, BookCopies)
    * `LIB_09_Returns_Table.sql` (depends on Borrowing)
    * `LIB_10_Fines_Table.sql` (depends on Members)
    * `LIB_11_BorrowingActivityLog_Table.sql`

4.  **Create Functions, Stored Procedures, and Triggers:**
    Execute all `.sql` files within the respective `Functions`, `Stored_Procedures`, and `Triggers` folders for both `Education_Schema` and `Library_Schema`. The order within these sub-folders generally doesn't matter for creation, as they refer to tables that are already created.

5.  **Insert Test Data:**
    Execute the `.sql` files within the `Education_Schema/Data_Inserts/` and `Library_Schema/Data_Inserts/` folders. **Pay close attention to the numerical prefixes (`01_`, `02_`, etc.) for Education data insertion, as the order is crucial due to foreign key dependencies.** For Library data, follow the order specified below as well.
    * **Education Data:** `EDU_Data_01_Departments_Insert.sql` -> `EDU_Data_02_Majors_Insert.sql` -> `EDU_Data_03_Courses_Insert.sql` -> `EDU_Data_04_Semesters_Insert.sql` -> `EDU_Data_05_Admins_Addresses_Insert.sql` -> `EDU_Data_06_Instructors_Addresses_Insert.sql` -> `EDU_Data_07_Students_Addresses_Insert.sql` -> `EDU_Data_08_UserAccounts_Insert.sql` -> `EDU_Data_09_Advisors_Insert.sql` -> `EDU_Data_10_CurriculumPlan_Insert.sql` -> `EDU_Data_11_CourseOfferings_Insert.sql` -> `EDU_Data_12_ClassSchedules_Insert.sql` -> `EDU_Data_13_ExamSchedules_Insert.sql` -> `EDU_Data_14_Enrollments_Insert.sql` -> `EDU_Data_15_Update_Random_Grades_StudentCourses.sql`
    * **Library Data:** `LIB_Data_01_Authors_Insert.sql` -> `LIB_Data_02_Publishers_Insert.sql` -> `LIB_Data_03_Categories_Insert.sql` -> `LIB_Data_04_Books_Insert.sql` -> `LIB_Data_05_BookAuthors_Insert.sql` -> `LIB_Data_06_BookCopies_Insert.sql` -> `LIB_Data_07_Members_Insert.sql` -> `LIB_Data_08_Borrowing_Insert.sql`

6.  **Set up Roles and Security:**
    Execute the script: `Database_Setup/04_Role_Security_Setup.sql`

## Usage and Testing

After setting up the database, you can run the provided test scripts to verify functionality:

* **`Final_Project_Test_Script.sql`**: This comprehensive script in your project root tests various functionalities across your Education schema, including data retrieval and stored procedure executions.
* **`Library_Test_Script.sql`**: This script tests the core functionalities of your Library schema.

You can connect to the database using the test logins created in `04_Role_Security_Setup.sql` (e.g., `TestAdminLogin`, `TestLibrarianLogin`, `TestStudentLogin`) to observe role-based access.


This transformation highlights the ability to maintain robust functionality while significantly improving the maintainability and presentation of a complex database solution.

## Acknowledgments

This database project was developed as part of a university course requirement.
