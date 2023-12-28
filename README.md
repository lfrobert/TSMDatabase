# 1. TSM Database Project

# 2. Business Case

## a. Business Overview

The Senior Movers is a moving company that specializes in relocating senior citizens, mostly to senior living communities and it is based in Troy, MI. The company started operations in 2013, and they have been steadily growing the number of customers and communities that they have been servicing every year. The Senior Movers build a trusting relationship with their clients and with the community that they are often rehired to assist in additional transfers into enhanced, assisted living, or memory care facilities that they built special relationships with. Each phase requires different deliberations as to how to perform the task as smoothly as possible.

## b. Scenario Overview

The Senior Movers currently tracks all of the company's information on excel spreadsheets. They want a piece of software that can record and relate all of the important information used by the business.

## c. Project Objective

To create a normalized Oracle database that allows the business to record necessary information about each job order. This database will be taken by a software engineer to develop a small custom Enterprise application for The Senior Movers.

## d. Project Requirements

* The database should be normalized. Third normal form is ideal for most tables.
* The information should revolve around and relate to job orders (Moves). After all, this is a moving company!
* The design of the database should be properly documented with the business rules/logic, an ERD, Logical Design, & Data Type + Range Constraints Table.
* The database should contain sequences for each of the tables to automatically assign primary key values where needed.
* Create View that can be used to simplify reporting in the application.
* After the database is documented and coded, hand everything off to the software developer to create the business application that uses the database.

# 3. Project Steps

## a. Gather the Business Rules

* Every vehicle must have equipment and every piece of equipment must be assigned to a vehicle.
* The relationship between vehicle and equipment keeps track of the quantity of each type of equipment on each vehicle.
* A vehicle has to be either a truck or a car but cannot be both at the same time.
* A vehicle may be used on a job order (move) and a job order requires at least one vehicle.
* The relationship between vehicle and job order keeps track of the miles actually driven by each vehicle.
* An employee may have worked on one or more job orders and a job order requires at least one employee.
* An employee has to be either a mover or an office worker but they can be both at the same time too.
* A mover may have acquired an hourly paycheck and an hourly paycheck must be attached to only one mover.
* A customer must be attached to at least one job order and a job order must involve at least one customer.
* A customer has to be either a resident or a guardian but cannot be both at the same time.
* A resident may have at least one guardian and a guardian must have at least one resident.
* A senior community may be the destination for at least one job order and a job order must move a resident to at least one senior community.
* An executive director must work for at least one senior community and a senior community must have only one executive director.

# b. Create a Conceptual Model (ERD)

![This is a Conceptual Model (ERD).](images/TSM%20ERD%20SCREENSHOT.jpg)

Conceptual Design Model Descriptions

* Senior Community- This table contains the data for each senior community that the company moves customers to.
* Executive Director - This table contains the personal information for each of the executive directors within the company.
* Job Order - This table contains all of the data for each order and the specifications of each order.
* Customer - This table contains the personal information of each customer of the company. This table is supertype for the resident and guardian tables. The subtypes resident and guardian have total specialization and the disjoint rule.
* Resident - This table contains the information for all of the resident customers. This table is a subtype of the guardian table.
* Guardian - This table contains the information for all of the guardian customers. This table is a subtype of the guardian table.
* Equipment - This table contains the information for the equipment used by the company.
* Vehicle- This table contains all of the data for the vehicles owned by the company and their details. This table is the supertype for truck and car tables. The subtypes car and truck have total specialization and the disjoint rule.
* Truck - This table contains the information for the trucks in use by the company. This table is a subtype of the vehicle table.
* Car- This table contains the information for the cars in use by the company. This table is a subtype of the vehicle table.
* Employee - This table contains the data for all of the employees in the company as well as job identifying information. This table is the supertype for mover and office worker. The subtypes mover and office worker have total specialization and the overlap rule.
* Mover - This table contains the information for the movers hired by the company. This table is a subtype of the employee table.
* Office Worker - This table contains the information for the office workers hired by the company. This table is a subtype of the employee table.
* Hourly Payroll - This table contains the data for the employee payroll for all the employees of the company

# c. Create a Logical Design (**Bold = PK** and <ins>Underline = FK</ins>)
* Equipment(**Equipment_ID,** Equipment_Name, Equipment_Description)
* Vehicle(**Vehicle_ID, Vehicle_Type,** Vehicle_Male, Vehicle_Model, Vehicle, Year, Color, Operational_Y)
* Car(<ins>**Vehicle_ID, Vehicle_Type**,</ins> Car_Purpose)
* Truck(<ins>**Vehicle_ID, Vehicle_Type**,</ins> Truck_length_FT,Truck_height_FT)
* Employee(**Employee_ID,** First_Name, Middle_Initial, Last_Name, Street, City, State,Zip_code,DOB Cell-Phone, Email, Gender,**Mover_YN,Office_Worker_YN**)
* Mover(<ins>**Employee_ID,**</ins> Driver_YN, Packing_Skills_YN, Hourly_Wage, <ins>**Mover_YN, Office_Worker_YN**</ins>)
* Officer_Worker(<ins>**Employee_ID,**</ins>Office_Position,Yearly_Salary,<ins>**Mover_YN, Office_Worker_YN**</ins>)
* Hourly_Payroll(**Payroll_ID,** <ins>Employee_ID,</ins> Work_week_Start, Work_week_End, Pay_Date, Hours_Worked, <ins>Mover_YN, Office_Worker_YN</ins>)
* Customer(**Customer_ID,Customer_Type,** First_Name,Middle_Initial, Last_name_DOB,Cell-Phone,Home_Phone,Email, Gender, Responsible_For_Payment_YN, Comments)
* Resident(<ins>**Customer_ID, Customer_Type,**</ins> Able_To_Consent_YN, Street, City, State, Zip_code, Room_Number)
* Guardian(<ins>**Customer_ID, Customer_Type,**</ins>Relation_To_Resident)
* Exeuctive_Director(**Executive_ID,** First_Name, Last_Name, Phone_Number, Email)
* Senior_Community(**Community_ID,** <ins>Executive_ID,</ins> Community_Name, Street, City, State. Zip_Code, Num_Of_Floors, Assissted_or_Memory_YN)
* Job_Order(**Job_ID,**<ins>Community_ID,</ins>Start_Date,Finish_Date,Salvation_Army_Dropoff_YN,Expected_Miles_to_Drive,Order_Status,Job_Cost,Bill_Amt_Paid,Comments)

Junction Tables
* Equipment_Vehicle(<ins>**Equipment_ID,Vehicle_ID,Vehicle_Type,**</ins>Equipment_Quantity)
* Resident_Guardian(<ins>**Resident_ID,Customer_Type_R,Guardian_ID,Customer_Type_G**</ins>)
* Vehicle_Job_Order(<ins>**Vehicle_ID, Vehicle_Type, Job_ID,**</ins> Miles_Driven)
* Employee_Job_Order(<ins>**Employee_ID, Mover_YN, Officer_Worker_YN, Job_ID**</ins>)
* Customer_Job_Order(<ins>**Customer_ID, Customer_Type,Job_ID**</ins>)

# d. Display Table/Data Type Info and Range Constraints

<details>
<summary>TSM_Equipment</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EQUIPMENT_ID|(PK)|NUMBER(6)|No|
|EQUIPMENT_NAME|VARCHAR2(30)|No|
|EQUIPMENT_DESCRIPTION|VARCHAR2(100)|Yes|

</details>


<details>
<summary>TSM_Vehicle</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|VEHICLE_ID (PK)|NUMBER(6)|No|
|VEHICLE_TYPE (PK)|VARCHAR2(5)|No|
|VEHICLE_MAKE|VARCHAR2(10)|No|
|VEHICLE_MODEL|VARCHAR2(10)|No|
|VEHICLE_YEAR|NUMBER(4)|No|
|COLOR|VARCHAR2(10)|No|
|OPERATIONAL_YN|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|VEHICLE_YEAR | Greater Than Or Equal to 1900 (>= 1900)|
|OPERATIONAL_YN | ‘Yes’ or ‘No’|
|VEHICLE_TYPE | ‘Truck’ or ‘Car’|


</details>


<details>
<summary>TSM_Car</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|Field/Column|Data|Type|Null|(Yes/No)|
|VEHICLE_ID (PK) (FK)|NUMBER(6)|No|
|VEHICLE_TYPE (PK) (FK)|VARCHAR2(5)|No|
|CAR_PURPOSE|VARCHAR2(40)|No|

|Field | Range Constraint|
|--|--|
VEHICLE_TYPE | Check vehicle is a ‘Car’|

</details>


<details>
<summary>TSM_Truck</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|VEHICLE_ID (PK) (FK)|NUMBER(6)|No|
|VEHICLE_TYPE (PK) (FK)|VARCHAR2(5)|No|
|TRUCK_LENGTH_FT|NUMBER(3,1)|No|
|TRUCK_HEIGHT_FT|NUMBER(3,1)|No|

|Field | Range Constraint|
|--|--|
|VEHICLE_TYPE | Check vehicle is a ‘Truck’|
|TRUCK_LENGTH_FT | Greater Than or equal to 8 (>= 8)|
|TRUCK_HEIGHT_FT | Greater Than or equal to 8 (>= 8)|

</details>


<details>
<summary>TSM_Employee</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EMPLOYEE_ID (PK)|NUMBER(6)|No|
|FIRST_NAME|VARCHAR2(20)|No|
|MIDDLE_INITAL|CHAR(1)|Yes|
|LAST_NAME|VARCHAR2(30)|No|
|STREET|VARCHAR2(40)|No|
|CITY|VARCHAR2(20)|No|
|STATE|CHAR(2)|No|
|ZIP_CODE|CHAR(5)|No|
|DOB|DATE|No|
|CELL_PHONE|CHAR(13)|No|
|EMAIL|VARCHAR2(40)|No|
|GENDER|VARCHAR2(6)|No|
|MOVER_YN (PK)|VARCHAR2(3)|No|
|OFFICE_WORKER_YN (PK)|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|DOB| Greater Than Or Equal to January 1, 1900 (>= '01-JAN-1900')|
|GENDER| ‘Male’, ‘Female’, or ‘Other’|
|MOVER_YN| ‘Yes’ or ‘No’|
|OFFICE_WORKER_YN| ‘Yes’ or ‘No’|

</details>


<details>
<summary>TSM_Mover</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EMPLOYEE_ID (PK) (FK)|NUMBER(6)|No|
|DRIVER_YN|VARCHAR2(3)|No|
|PACKING_SKILLS_YN|VARCHAR2(3)|No|
|HOURLY_WAGE|NUMBER(4,2)|Yes|
|MOVER_YN (PK) (FK)|VARCHAR2(3)|No|
|OFFICE_WORKER_YN (PK) (FK)|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|MOVER_YN| ‘Yes’|
|DRIVER_YN| ‘Yes’ or ‘No’|
|PACKING_SKILLS_YN| ‘Yes’ or ‘No’|
|HOURLY_WAGE| Greater Than or equal to 10 (>= 10)|

</details>


<details>
<summary>TSM_Office_Worker</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EMPLOYEE_ID (PK) (FK)|NUMBER(6)|No|
|OFFICE_POSITION|VARCHAR2(30)|No|
|YEARLY_SALARY|NUMBER(6)|Yes|
|MOVER_YN (PK) (FK)|VARCHAR2(3)|No|
|OFFICE_WORKER_YN (PK) (FK)|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|OFFICE_WORKER_YN| ‘Yes’|
|YEARLY_SALARY| Between 20,000 and 150,000|

</details>


<details>
<summary>TSM_Hourly_Payroll</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|PAYROLL_ID (PK)|NUMBER(6)|No|
|EMPLOYEE_ID (FK)|NUMBER(6)|No|
|WORK_WEEK_START|DATE|No|
|WORK_WEEK_END|DATE|No|
|PAY_DATE|DATE|No|
|HOURS_WORKED|NUMBER(3)|No|
|MOVER_YN (FK)|VARCHAR2(3)|No|
|OFFICE_WORKER_YN (FK)|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|WORK_WEEK_START| Is less than or before WORK_WEEK_END (WORK_WEEK_START < WORK_WEEK_END)|
|WORK_WEEK_END Is| less than or before PAY_DATE (WORK_WEEK_END < PAY_DATE)|
|HOURS_WORKED| Is greater than 0 (> 0)|

</details>


<details>
<summary>TSM_Customer</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|Field/Column|Data|Type|Null|(Yes/No)|
|CUSTOMER_ID (PK)|NUMBER(6)|No|
|CUSTOMER_TYPE (PK)|VARCHAR2(8)|No|
|FIRST_NAME|VARCHAR2(20)|No|
|MIDDLE_INITAL|CHAR(1)|No|
|LAST_NAME|VARCHAR2(30)|No|
|DOB|DATE|No|
|CELL_PHONE|CHAR(13)|Yes|
|HOME_PHONE|CHAR(13)|Yes|
|EMAIL|VARCHAR2(40)|Yes|
|GENDER|VARCHAR2(6)|No|
|RESPONSABLE_FOR_PAYMENT_YN|VARCHAR2(3)|No|
|COMMENTS|VARCHAR2(80)|Yes|


|Field | Range Constraint|
|--|--|
|DOB| Greater Than Or Equal to January 1, 1900 (>= '01-JAN-1900')|
|GENDER| ‘Male’, ‘Female’, or ‘Other’|
|RESPONSABLE_FOR_PAYMENT_YN| ‘Yes’ or ‘No’|
|CUSTOMER_TYPE| ‘Resident’ or ‘Guardian’|


</details>


<details>
<summary>TSM_Resident</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|CUSTOMER_ID (PK) (FK)|NUMBER(6)|No|
|CUSTOMER_TYPE (PK) (FK)|VARCHAR2(8)|No|
|ABLE_TO_CONSENT_YN|VARCHAR2(3)|No|
|STREET|VARCHAR2(20)|No|
|CITY|VARCHAR2(20)|No|
|STATE|CHAR(2)|No|
|ZIP_CODE|CHAR(5)|No|
|ROOM_NUMBER|VARCHAR2(4)|Yes|


|Field | Range Constraint|
|--|--|
|CUSTOMER_TYPE| ‘Resident’|
|ABLE_TO_CONSENT_YN| ‘Yes’ or ‘No’|

</details>


<details>
<summary>TSM_Guardian</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|CUSTOMER_ID (PK) (FK)|NUMBER(6)|No|
|CUSTOMER_TYPE (PK) (FK)|VARCHAR2(8)|No|
|RELATION_TO_RESIDENT|VARCHAR2(20)|No|


|Field | Range Constraint|
|--|--|
|CUSTOMER_TYPE| ‘Guardian’|

</details>


<details>
<summary>TSM_Executive_Director</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EXECUTIVE_ID|NUMBER(6)|No|
|FIRST_NAME|VARCHAR2(20)|No|
|LAST_NAME|VARCHAR2(30)|No|
|PHONE_NUMBER|CHAR(13)|No|
|EMAIL|VARCHAR2(40)|No|


</details>


<details>
<summary>TSM_Senior_Community</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|COMMUNITY_ID (PK)|NUMBER(6)|No|
|EXECUTIVE_ID (FK)|NUMBER(6)|No|
|COMMUNITY_NAME|VARCHAR2(50)|No|
|STREET|VARCHAR2(40)|No|
|CITY|VARCHAR2(20)|No|
|STATE|CHAR(2)|No|
|ZIP_CODE|CHAR(5)|No|
|NUM_OF_FLOORS|NUMBER(2)|No|
|ASSISTED_OR_MEMORY_YN|VARCHAR2(3)|No|


|Field | Range Constraint|
|--|--|
|ASSISTED_OR_MEMORY_YN| ‘Yes’ or ‘No’|

</details>


<details>
<summary>TSM_Job_Order</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|JOB_ID (PK)|NUMBER(6)|No|
|COMMUNITY_ID (FK)|NUMBER(6)|No|
|START_DATE|DATE|No|
|FINISH_DATE|DATE|No|
|SALVATION_ARMY_DROPOFF_YN|VARCHAR2(3)|No|
|EXPECTED_MILES_TO_DRIVE|NUMBER(4)|No|
|ORDER_STATUS|VARCHAR2(15)|No|
|JOB_COST|NUMBER(8,2)|No|
|BILL_AMT_PAID|NUMBER(8,2)|Yes|
|COMMENTS|VARCHAR2(50)|Yes|


|Field | Range Constraint|
|--|--|
|START_DATE| Is before or equal to the FINISH_DATE (START_DATE <= FINISH_DATE)|
|EXPECTED_MILES_TO_DRIVE| Is greater than 0 (>0)|
|ORDER_STATUS| 'NOT STARTED', 'STARTED', 'COMPLETED', 'CANCELLED'|
|JOB_COST| Is greater than or equal to BILL_AMT_PAID (JOB_COST >= BILL_AMT_PAID)|


</details>


<details>
<summary>TSM_Equipment_Vehicle</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EQUIPMENT_ID (PK) (FK)|NUMBER(6)|No|
|VEHICLE_ID (PK) (FK)|NUMBER(6)|No|
|VEHICLE_TYPE (PK) (FK)|VARCHAR2(5)|No|
|EQUIPMENT_QUANTITY|NUMBER(3)|No|


|Field | Range Constraint|
|--|--|
|EQUIPMENT_QUANTITY| Is greater than or equal to 1 (>= 1)|

</details>


<details>
<summary>TSM_Resident_Guardian</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|RESIDENT_ID (PK) (FK)|NUMBER(6)|No|
|CUSTOMER_TYPE_R (PK) (FK)|VARCHAR2|No|
|GUARDIAN_ID (PK) (FK)|NUMBER(6)|No|
|CUSTOMER_TYPE_G (PK) (FK)|VARCHAR2|No|


</details>


<details>
<summary>TSM_Vehicle_Job_Order</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|VEHICLE_ID|(PK)|(FK)|NUMBER(6)|No|
|VEHICLE_TYPE|(PK)|(FK)|VARCHAR2(5)|No|
|JOB_ID|(PK)|(FK)|NUMBER(6)|No|
|MILES_DRIVEN|NUMBER(4)|No|

</details>


<details>
<summary>TSM_Employee_Job_Order</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|EMPLOYEE_ID (PK) (FK)|NUMBER(6)|No|
|MOVER_YN (PK) (FK)|VARCHAR2(3)|No|
|OFFICE_WORKER_YN (PK) (FK)|VARCHAR2(3)|No|
|JOB_ID (PK) (FK)|NUMBER(6)|No|

</details>


<details>
<summary>TSM_Customer_Job_Order</summary>

| Field/Column | Data Type | Null Allowed(Yes/No) |
|--|--|--|
|CUSTOMER_ID (PK) (FK)|NUMBER(6)|No|
|CUSTOMER_TYPE (PK) (FK)|VARCHAR2|No|
|JOB_ID (PK) (FK)|NUMBER(6)|No|

</details>


## e. Create a SQL Script that Creates the Database Tables, Creates the Sequences, and Inserts the Data into the Tables

[Link to the Create Tables, Sequences, & Data script](/TSM%20Create%20Tables%20Sequences%20&%20Insert%20Data.sql)

## f. Create a SQL Script that the Views for the Database

[Link to the Create Views script](/TSM%20CREATE%20VIEWS.sql)

## g. Create a SQL Script that Drops All the Tables, Sequences, & Views in the Database

[Link to the Drop Tables, Sequences, & Views script](/TSM%20Erase%20Tables%20Sequences%20&%20Views.sql)

# 4. Results

![TSMDB Objects Image](images/TSMDB%20Objects.jpg)



# 5. Technical Concepts Used

 * PLSQL - Create, Read, Drop, Delete, Insert, Select Statements, Sequences, Constraints, Primary Key, Foreign Key, Relationships, Joins, Views, Functions, Data Types, Replace/Alter, Supertypes & Subtypes, Disjoint & Overlap, Subqueries, Common Table Expressions (CTE's), & Database Design.

# 6. How to Run the Database on Your Computer

## a. Install Oracle SQL Developer Instance & Create a Database (Connection)

Note: These steps below (1-16) helped me install a SQL Developer Instance on my computer when I was was having issues with it.  I recomend trying to follow a youtube tutorial first to create a Database Connesction. If you have trouble with the offical documentation or youtube tutorials like me, then steps 1-16 below may be helpful to you. It should be a lot smoother for your instalation hopefully.
1.	Install Oracle Database 18c Express Edition. The installation is kept in a folder called app in your C drive or other installation location. (Make sure to keep track of your database server password that you used for the SYS, SYSTEM, and PDBADMIN accounts from the database installation process.) [When the Oracle Database is installed successfully, keep note of the information on that dialogue box, because it contains important information for forming a connection to the database server.] 
2.	Install Oracle SQL Developer.
3.	Click the green plus to create a datbase connection.
4.	Enter a name for your new database.
5.	Enter in one of the usernames SYS, SYSTEM, or PDBADMIN in the username field.
6.	Enter in the server password that you created when you installed the database server.
7.	Change the role field to SYSDBA.
8.	Enter in localhost as the hostname.
9.	Enter in 1521 for the Port field. This signifies the use of port 1521 for this connection.
10.	Enter in xe for the SID field.
11.	Click Test connection.
12.	If the status reads success, click the save button to save your connection the click the connect button to connect to your new database.
13.	If there is an error when you test the connection, it is probably because when you installed Oracle Database 18c Express Edition, the listener.ora and tnsnames.ora files used your computer’s private IP address (ie: 10.0.0.140) instead of localhost. Therefore, you need to open these files with a text editor and change every instance where it says (HOST = 10.0.0.140) to (HOST = localhost) The file paths for both of these files will look like (C:\app\larry\product\18.0.0\dbhomeXE\NETWORK\ADMIN\listener.ora) for the listener.ora file and (C:\app\larry\product\18.0.0\dbhomeXE\NETWORK\ADMIN\tnsnames.ora) for the tnslistener.ora file.
14.	On Windows, go into the services app and stop the OracleOraDB18Home1MTSRecoveryService, OracleOraDBHome1TNSListener, and OracleServiceXE services.
15.	Then start the services in this order: OracleServiceXE, OracleOraDBHome1TNSListener, then OracleOraDB18Home1MTSRecoveryService.
16.	Repeat steps 3-12 and you should be able to connect to your database now.


## b. Run These Scripts to Create All the Database Tables, Sequences, Views, & to Insert All the Data.

[Link to the Tables, Sequences, & Data script](/TSM%20Create%20Tables%20Sequences%20&%20Insert%20Data.sql)

[Link to the Create Views script](/TSM%20CREATE%20VIEWS.sql)

# 7. Links to Code

[Link to the Create Tables, Sequences, & Data script](/TSM%20Create%20Tables%20Sequences%20&%20Insert%20Data.sql)

[Link to the Create Views script](/TSM%20CREATE%20VIEWS.sql)

[Link to the Drop Tables, Sequences, & Views script](/TSM%20Erase%20Tables%20Sequences%20&%20Views.sql)