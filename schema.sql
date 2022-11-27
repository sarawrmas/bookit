DROP DATABASE IF EXISTS bookit;

CREATE DATABASE bookit;

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
);

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `UnitPrice` float NOT NULL,
  CONSTRAINT PK_product PRIMARY KEY (ProductID, ISBN)
);

INSERT INTO `product` (`ProductID`, `ISBN`, `Title`, `Author`, `Genre`, `UnitPrice`) VALUES
(101, '978-1-4516-8652-4', 'The Italian Woman', 'Jean Plaidy', 'Historical Fiction', 16),
(102, '978-1-4516-8654-8', 'Queen Jezebel', 'Jean Plaidy', 'Historical Fiction', 16),
(103, '978-1-4516-8620-3', 'Madame Serpent', 'Jean Plaidy', 'Historical Fiction', 16),
(104, '978-0-345-80679-6', 'Salem\'s Lot', 'Stephen King', 'Horror', 18),
(105, '978-0-307-39027-1', 'The Ruins', 'Scott Smith', 'Horror', 16.95),
(106, '978-1-250-09238-0', 'No One Gets Out Alive', 'Adam Nevill', 'Horror', 19.99),
(107, '978-1-4391-5285-0', 'Disturbance', 'Jan Burke', 'Mystery', 7),
(108, '0-7434-4451-5', 'Goodnite, Irene', 'Jan Burke', 'Mystery', 6.99),
(109, '978-1-7832-9629-3', 'Crimson Peak', 'Nancy Holder', 'Horror', 7.99),
(110, '978-1-7890-9394-0', 'The Lights of Prague', 'Nicole Jarvis', 'Fantasy', 15.95),
(111, '978-0-06-44705-2', 'Ella Enchanted', 'Gail Carson Levine', 'Children\'s Fantasy', 6.5),
(112, '978-0-14-241034-9', 'Fantastic Mr. Fox', 'Roald Dahl', 'Children\'s Fantasy', 7.99),
(113, '978-0-688-04074-1', 'A Chair for My Mother', 'Vera B. Williams', 'Children\'s Fantasy', 7.99),
(114, '978-1-5247-6900-0', 'It\'s Bedtime Little Critter!', 'Mercer Mayer', 'Children\'s Fantasy', 5.99),
(115, '978-0-380-80734-5', 'Coraline', 'Neil GaiMan', 'Children\'s Horror', 6.99),
(119, '978-0-06-288705-4', 'Hindsight & All the Things I Can\'t See in Front of Me', 'Justin Timberlake', 'Autobiography', 40),
(120, '978-1-4516-1713-9', 'Pimp', 'Iceberg Slim', 'Autobiography', 15.99),
(121, '978-1-60386-738-2', 'The Mis-Education of the Negro', 'Carter Godwin Woodson', 'Afr.-Am Studies', 4.99);

CREATE TABLE `salesorder` (
  `SalesOrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  CONSTRAINT `PK_salesorder` PRIMARY KEY (`SalesOrderID`,`CustomerID`)
  CONSTRAINT `FK_salesorder_customerid` FOREIGN KEY (`CustomerID`) REFERENCES `customer`(`CustomerID`),
  CONSTRAINT `FK_salesorder_productid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
);

CREATE TABLE `salesorderdetail` (
  `SalesOrderID` int(11) NOT NULL,
  `LineItem` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ExtendedPrice` float GENERATED ALWAYS AS ((`UnitPrice` * `Quantity`)),
  CONSTRAINT `PK_salesorderdetail` PRIMARY KEY (`SalesOrderID`,`LineItem`),
  CONSTRAINT `FK_salesorderdetail_productid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FK_salesorderdeatil_salesorderid` FOREIGN KEY (`SalesOrderID`) REFERENCES `salesorder` (`SalesOrderID`)
);

ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

ALTER TABLE `salesorder`
  MODIFY `SalesOrderID` int(11) NOT NULL AUTO_INCREMENT;
