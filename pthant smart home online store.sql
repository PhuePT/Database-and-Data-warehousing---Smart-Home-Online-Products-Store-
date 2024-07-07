 CREATE TABLE Customer
(
Customer_Id VARCHAR2(20) NOT NULL,
Customer_FName VARCHAR2(25) NOT NULL,
Customer_LName VARCHAR2(25) NOT NULL,
Customer_DOB CHAR(30),
Customer_Gender CHAR(20),
Customer_Address VARCHAR(100),
Customer_City VARCHAR(50),
Customer_State CHAR(2),
Customer_Zip VARCHAR(9),
Customer_Phone CHAR(10),
Customer_Email VARCHAR(256) NOT NULL,
CONSTRAINT CustomerPK PRIMARY KEY(Customer_Id),
CONSTRAINT Customer_UK_CustomerEmail UNIQUE (Customer_Email) );

INSERT INTO Customer VALUES('CUST_01','John','Will','01-Jan-1885','M','50 Crossstreet','Tucson','AZ',99040,'9689526365','johnwill@gmail.com');
INSERT INTO Customer VALUES('CUST_02','Smith','Jonas','02-Feb-1889','M','6000 Walkway Hwy','Tempa','FL',90945,'9605257863','smijoh@gmail.com');
INSERT INTO Customer VALUES('CUST_03','Sky','Sharma','08-Mar-1990','F','Hollywood Walk','LA','CA',99040,'9689980765','skysharma@gmail.com');
INSERT INTO Customer VALUES('CUST_04','Hanna','Williams','26-OCt-1976','F','90 Manhattan Hwy','Brooklyn','NY',98346,'9045095670','hannawilliam@gmail.com');
INSERT INTO Customer VALUES('CUST_05','Jwoo','Woo','15-April-1879','M','8901 Norway Fwy','Philadelphia','PA',95110,'9636926365','jwoowoo@gmail.com');

CREATE TABLE Employee
(
Employee_Id VARCHAR(20) NOT NULL,
Employee_FName VARCHAR2(25) NOT NULL,
Employee_LName VARCHAR2(25) NOT NULL,
Employee_DOB CHAR(30),
Employee_Gender CHAR(20),
Employee_Address VARCHAR2(100),
Employee_City VARCHAR2(50),
Employee_State CHAR(2),
Employee_Zip VARCHAR2(9),
Employee_Phone CHAR(10),
Employee_Email VARCHAR2(256) NOT NULL,
Designation VARCHAR2(15),
Department VARCHAR2(15) NOT NULL,
CONSTRAINT EmployeePK PRIMARY KEY (Employee_Id),
CONSTRAINT Employee_UK_Employee_Email UNIQUE (Employee_Email),
CONSTRAINT Employee_UK_Department UNIQUE (Department)
);

INSERT INTO Employee VALUES('EMP_01','Pratiksha','Yadav','02-Dec-1992','F','100 Imp Hwy','Norwalk','CA',90243,'5625526365','prat02@gmail.com','Engineer','IT');
INSERT INTO Employee VALUES('EMP_02','Phue','Thant','19-Dec-1991','F','324 Spark Street','Fullerton','CA',92123,'5625567805','phue@gmail.com','Analyst','Finance'); 
INSERT INTO Employee VALUES('EMP_03','Dhwani','Vaishnav','01-Dec-1990','F','100 Burbank Street','Los Angeles','CA',90283,'5622251111','dhwani@gmail.com','Team Leader','Sales');   
INSERT INTO Employee VALUES('EMP_04','Ruta','Antaliya','27-Sep-1995','F','3000 Bear Street','Malibu','CA',98843,'5520000085','ruta@gmail.com','HR','HRM');
INSERT INTO Employee VALUES('EMP_05','Ash','Parhad','05-Nov-1991','M','Adam Street','Long Beach','CA',90443,'5629329705','ash@gmail.com','Manager','Marketing');

CREATE TABLE Orders 
(
Order_ID VARCHAR(10) NOT NULL, 
Order_Date DATE, 
Order_Category VARCHAR(50) NOT NULL, 
Order_Price FLOAT, 
Order_Status VARCHAR(20) NOT NULL, 
Warranty_StartDate DATE, 
Warranty_EndDate DATE, 
Cust_ID VARCHAR(10) NOT NULL, 
Emp_ID VARCHAR(10) NOT NULL,
CONSTRAINT Orders_pk PRIMARY KEY (Order_ID),
CONSTRAINT Orders_Cust_fk FOREIGN KEY (Cust_ID) REFERENCES Customer (Customer_ID),
CONSTRAINT Orders_Emp_fk FOREIGN KEY (Emp_ID) REFERENCES Employee (Employee_ID));

INSERT INTO Orders VALUES ('ORD_01','01-JAN-2','Standard ',200.99,'Completed',
'01-JAN-23','01-JAN-24','CUST_01','EMP_05'); 

INSERT INTO Orders VALUES ('ORD_02', '09-JAN-23', 'Pre-Order', 450.50, 'Delivered',
'09-JAN-23', '09-JAN-24','CUST_03', 'EMP_01');

INSERT INTO Orders VALUES ('ORD_03', '27-MAR-23', 'Custom Order', 150.99, 'Shipped',
'27-MAR-23', '27-AUG-23', 'CUST_02','EMP_02');

INSERT INTO Orders VALUES ('ORD_04', '19-DEC-22', 'Subscription', 150.99, 'Completed', 
'19-DEC-22', '01-DEC-23', 'CUST_04','EMP_03'); 

INSERT INTO Orders VALUES ('ORD_05', '27-NOV-22', 'Standard', 480.00, 'Completed', 
'27-NOV-22', '27-NOV-23','CUST_05', 'EMP_04');

CREATE TABLE Product 
( 
Product_ID VARCHAR(10) NOT NULL,
Product_Name VARCHAR(30) NOT NULL,
Product_Category VARCHAR(30) NOT NULL,
Description VARCHAR(50) NOT NULL,
Brand VARCHAR(30) NOT NULL,
Product_Price FLOAT,
Product_Length DECIMAL,
Product_Width DECIMAL,
Product_Height DECIMAL,
Product_Color VARCHAR(15),
Warranty_Period NUMBER,
Product_Type VARCHAR(30),
CONSTRAINT Product_ID_pk PRIMARY KEY (Product_ID) );

INSERT INTO Product VALUES ('Prod_01', 'PH Smart Lights', 'Smart Lighting', ' Color Changing LED Lamps', 'Philips Hue', 24.47, 6, 3, 2, 'White', 6, 'Color and Turnable');

INSERT INTO Product VALUES ('Prod_02', 'Google Thermostat', 'Smart Wifi Thermostat', ' Wifi Thermostat system', 'Nest', 129.99, 3, 3, 1, 'Silver', 12, 'Nest Learning');

INSERT INTO Product VALUES ('Prod_03', 'Echo Show', 'Entertainment', ' Smart Display with FireTV Built-in', 'Amazon Echo', 279.99, 21, 18, 2, 'Black',24, 'HD Smart Display');

INSERT INTO Product VALUES ('Prod_04', 'Ring Video Bell', 'Home Security', ' Easy Installation security', 'Ring', 149.99, 2, 4, 1, 'Silver', 12, 'Doorbell');

INSERT INTO Product VALUES ('Prod_05', 'Google Nest Hub', 'Entertainment', ' Your Home at a glance', 'Google', 249.98, 12, 8, 1, 'Black', 6, 'Nest Hub 2nd Gen');

CREATE TABLE Manufactured_Product
( MProduct_ID VARCHAR(10) NOT NULL, 
Manufacturing_Site_City VARCHAR(50), 
Manufacturing_Site_State VARCHAR(2), 
Manufacturing_Site_ZIP VARCHAR(9) NOT NULL, 
Manufactured_Qty INT NOT NULL,  
Product_ID VARCHAR(10) NOT NULL, 
CONSTRAINT Manufactured_Product_PK PRIMARY KEY (MProduct_ID),
CONSTRAINT Manufactured_Product_FK FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID));

INSERT INTO Manufactured_Product VALUES('MProd_1','California','CA','91505',10000,'Prod_02');
INSERT INTO Manufactured_Product VALUES('MProd_2','North Carolina','NC','27513',15000,'Prod_04');

CREATE TABLE Purchased_Product
( PProduct_ID VARCHAR(10) NOT NULL, 
Supplier_Name VARCHAR(20) NOT NULL,
Supplier_City VARCHAR(50), 
Supplier_State VARCHAR(2), 
Supplier_ZIP VARCHAR(9) NOT NULL, 
Supplied_Brand VARCHAR(50) NOT NULL,
Supplier_Phone VARCHAR(15),
Supplier_Email VARCHAR(256) NOT NULL,
Supplied_Qty INT NOT NULL,
Product_ID VARCHAR(10) NOT NULL, 
CONSTRAINT Purchased_Product_PK PRIMARY KEY (PProduct_ID),
CONSTRAINT Purchased_Product_FK FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID));

INSERT INTO Purchased_Product VALUES('PProd_1','Signify N.V.','Beaverton','OR','97005','Phillips','+19998889990','david_johns@phillips.com',100000,'Prod_01');
INSERT INTO Purchased_Product VALUES('PProd_2','Amazon Inc','Hengyang','','411225','Amazon','+868585854545','anna_williams@amazon.cn',50000,'Prod_03');
INSERT INTO Purchased_Product VALUES('PProd_3','Google Nest','Palo Alto','CA','94304','Google','+15554448822','shoun_brown_support@google.com',75000,'Prod_05');

CREATE TABLE OrderItem 
(
OrderItem_ID VARCHAR(10) NOT NULL,
Ord_ID VARCHAR(10) NOT NULL,
Prod_ID VARCHAR(10) NOT NULL,
Ordered_Qty NUMBER,
CONSTRAINT OrderItem_pk PRIMARY KEY (OrderItem_ID),
CONSTRAINT OrderItem_Order_fk FOREIGN KEY (Ord_ID) REFERENCES Orders (Order_ID),
CONSTRAINT Orders_ProdID_fk FOREIGN KEY (Prod_ID) REFERENCES Product (Product_ID));

INSERT INTO OrderItem VALUES ('OItem_01','ORD_03','Prod_04',3); 
INSERT INTO OrderItem VALUES ('OItem_02','ORD_05','Prod_05',8); 
INSERT INTO OrderItem VALUES ('OItem_03','ORD_04','Prod_03',5); 
INSERT INTO OrderItem VALUES ('OItem_04','ORD_01','Prod_02',9); 
INSERT INTO OrderItem VALUES ('OItem_05','ORD_02','Prod_01',12); 

INSERT INTO Orders VALUES ('ORD_06','25-Mar-23','Standard ',460.99,'Pending','25-MAR-23','25-MAR-24','CUST_01','EMP_03'); 
INSERT INTO Orders VALUES ('ORD_07', '28-MAR-23', 'Standard', 480.50, 'Pending', '28-MAR-23', '28-MAR-24','CUST_05', 'EMP_01');
INSERT INTO Orders VALUES ('ORD_08', '15-MAR-23', 'Standard', 299.50, 'Completed', '15-MAR-23', '15-AUG-23','CUST_01', 'EMP_01');

UPDATE MANUFACTURED_PRODUCT SET Manufacturing_Site_City = 'Los Angeles'
WHERE PRODUCT_ID = 'Prod_02';

UPDATE PURCHASED_PRODUCT SET Supplier_City = 'Denver', Supplier_State = 'CO' 
WHERE PProduct_ID = 'PProd_2';

UPDATE PURCHASED_PRODUCT SET supplier_email = 'anna_williams@amazon.com' WHERE PProduct_ID = 'PProd_2' 

ALTER TABLE Customer
RENAME COLUMN CUSTOMER_Address TO Customer_Street;

ALTER TABLE Employee
RENAME COLUMN Employee_Address TO Employee_Street;

DELETE FROM OrderItem WHERE OrderItem_ID = 'OItem_05';

SELECT * FROM ORDERITEM;

SELECT Product_Name, Product_Price
FROM Product
WHERE Product_Price BETWEEN 100 AND 200;

SELECT COUNT(Order_ID)AS Number_of_Orders , Order_Status
FROM Orders
GROUP BY Order_Status
Having Order_Status = 'Pending';

SELECT Product.Product_ID, Product.Product_Name, Product.Brand,Product.Product_Color
FROM Product 
INNER JOIN Manufactured_Product ON 
Product.Product_ID = Manufactured_Product.Product_ID
WHERE Product_Color = 'Silver';

