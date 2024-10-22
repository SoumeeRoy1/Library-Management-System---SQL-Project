DROP DATABASE IF EXISTS Data_Storage_Management_System;
CREATE DATABASE Data_Storage_Management_System;
USE Data_Storage_Management_System;


/*First checking table and droping it first*/
/*Publication room transcations */
/**/
DROP TABLE IF EXISTS Groupm_T;
/*Creating Group Member table*/
CREATE TABLE If Not Exists Groupm_T( GroupmID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						GroupmName VARCHAR(50),
                        Groupm_EmailId VARCHAR(50),
                        Groupm_Num BIGINT,
                        Groupm_PreferredContactMethod VARCHAR(10) 
						);
ALTER TABLE Groupm_T AUTO_INCREMENT=1;

 /*Inserting data into the table created above*/ 
                      
INSERT INTO Groupm_T(GroupmName, Groupm_EmailId, Groupm_Num, Groupm_PreferredContactMethod) VALUES
					("Ayush Sharma", "ayush.sharma@gmail.com",9564563214, "Mobile"),
                     ("Prakhar Gupta",  "prakhar.gupta@gmail.com",8529669258, "Email"),
                     ("Soumy Roy",  "soumee.roy@gmail.com",7412552147, "Mobile"),
                     ("Benji Thomas",  "benji.thomas@gmail.com",9632552369, "Email"),
                     ("Pravali Chandragiri",  "pravali.chandragiri@gmail.com",7206958110, "Mobile"),
                     ("Duy Nguyen",  "duy.nguyen@gmail.com",7894554987, "Email");

ALTER TABLE Groupm_T ADD is_active INT NOT NULL DEFAULT 1;


CREATE PROCEDURE delete_Groupm(IN Groupm_ID INT)
UPDATE Groupm_T
SET is_active = 0
WHERE Groupm_ID = GroupmID;

/* Add the delete PROCEDURE query to run*/

#Members_audit
CREATE TABLE Groupm_audit( GroupmID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						GroupmName VARCHAR(50),
                        Groupm_EmailId VARCHAR(50),
                        Groupm_Num BIGINT,
                        Groupm_PreferredContactMethod VARCHAR(10),
                        LastUpdated DATE,
                        action varchar(20)
						);


/*update_trigger for Group Members*/
DELIMITER //                       
CREATE TRIGGER Groupm_audit 
	AFTER UPDATE ON Groupm_T
    FOR EACH ROW
    BEGIN
	INSERT INTO  Groupm_audit
    SET LastUpdated = NOW(),
		action = "Updated",
        GroupmID = OLD.GroupmID,
	    GroupmName = OLD.GroupmName,
		Groupm_Num = OLD.Groupm_Num,
	    Groupm_EmailId = OLD.Groupm_EmailId,
		Groupm_PreferredContactMethod = OLD.Groupm_PreferredContactMethod;
END//
DELIMITER ;


                   
/*First checking table and droping it first*/

DROP TABLE IF EXISTS Writer_T;
/*Creating Writer table*/
CREATE TABLE If Not Exists Writer_T( Writer_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
					  WriterName VARCHAR(50)
                      );
ALTER TABLE Writer_T AUTO_INCREMENT=1;
/*Inserting data into the table created above*/

INSERT INTO Writer_T (WriterName) VALUES 
					("Stephen King"),("Paulo Coelho"),("Emily Dickinson"),("J.K. Rowling"), ("Agatha Christie"),
                    ("Mark Twain"),("Anne Rice"),("Jane Austen"),("William Shakespeare"),("Leo Tolstoy"),("Emily Temple"),
                    ("George Orwell"),("Douglas Adams"),("EB White"),("Harper Lee"),("Virginia Woolf"),("F. Scott Fitzgerald"),
                    ("J.R.R. Tolkien"),("Gabriel Garcia Marquez"),("Ernest Hemingway"),
					("Margaret Atwood"),("James Baldwin"),("John Steinbeck"),("Sylvia Plath"),("Charles Dickens"),
					("Toni Morrison"),("J.D. Salinger"),("Kurt Vonnegut"),("Franz Kafka"),("Virginia Woolf"),
					("Chimamanda Ngozi Adichie"),("Mary Shelley"),("Maya Angelou"),("Hermann Hesse"),("Kazuo Ishiguro"),
					("George R.R. Martin"),("Octavia Butler"),("Isaac Asimov"),("Neil Gaiman"),("Donna Tartt"),
					("Ralph Waldo Emerson"),("Edgar Allan Poe"),("John Keats"),("Percy Bysshe Shelley"),("Lord Byron");

/* Dropping Inventory_T if it exists in the database*/
DROP TABLE IF EXISTS Inventory_T;

/* Creating Inventory_T in the database*/      
CREATE TABLE If Not Exists Inventory_T
(Item_ID   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 Item_Category VARCHAR(20),
 Item_Quantity INT DEFAULT 50,
 Latest_ItemDate_Received  DATETIME);

/*the first auto-incremented primary key value assigned 
to a new record will be 1000, the second will be 1001 and so on.*/                                     
ALTER TABLE Inventory_T AUTO_INCREMENT=1;

/*Inserting values to the table Inventory_T*/
INSERT INTO Inventory_T(Item_Category, Item_Quantity, Latest_ItemDate_Received)
VALUES ("Adventure", "67", NOW()),
       ("Romance", "300", NOW()),
       ("History", "23", NOW()),
       ("Fictional", "567", NOW()),
       ("Horror", "768", NOW()),
       ("Mystry", "257", NOW()),
       ("Non-fictional", "299", NOW()),
       ("Tragedy", "523", NOW()),
       ("Fantasy", "876", NOW()),
	("Science Fiction", "456", NOW()),
	("Memoir", "234", NOW()),
	("Biography", "342", NOW()),
	("Self-Help", "123", NOW()),
	("Spirituality", "89", NOW()),
	("Comedy", "456", NOW()),
	("Drama", "234", NOW()),
	("Thriller", "876", NOW()),
	("Crime", "345", NOW()),
	("Western", "56", NOW()),
	("Poetry", "789", NOW()),
	("Autobiography", "234", NOW()),
	("Satire", "87", NOW()),
	("Psychology", "234", NOW()),
	("Philosophy", "342", NOW()),
	("Business", "123", NOW()),
	("Economics", "456", NOW()),
	("Travel", "67", NOW()),
	("Cooking", "78", NOW()),
	("Art", "345", NOW()),
	("Music", "234", NOW()),
	("Science", "567", NOW()),
	("Mathematics", "123", NOW()),
	("Religion", "456", NOW()),
	("Politics", "89", NOW()),
	("Law", "234", NOW()),
	("Education", "342", NOW()),
	("Health", "123", NOW()),
	("Fitness", "56", NOW()),
	("Sports", "789", NOW()),
	("Nature", "234", NOW()),
		("Animals", "345", NOW()),
		("Parenting", "87", NOW()),
	("Relationships", "234", NOW()),
	("Technology", "456", NOW()),
	("Gardening", "78", NOW()),
	("Crafts", "123", NOW());
       
       
CREATE TABLE If Not Exists Publications_T(PublicationID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
							PublicationName VARCHAR(50)
                            );
ALTER TABLE Publications_T AUTO_INCREMENT = 1;

INSERT INTO Publications_T (PublicationName) VALUES
						("Penguin"),("Pandas"),("WritingCompany"),("GoodFolks"), ("StoryTeller"),("BlueBird"),
                        ("HarperCollins"),("Simon & Schuster"),("Hachette Book Group"),("Random House"),("Macmillan Publishers"),
("Scholastic Corporation"),("Oxford University Press"),("Cambridge University Press"),("Barnes & Noble"),
("Faber and Faber"),("Bloomsbury Publishing"),("Perseus Books Group"),("Wiley"),("Chronicle Books"),
("Candlewick Press"),("MIT Press"),("University of Chicago Press"),("Grove Atlantic"),("The New Press"),
("Graywolf Press"),("Melville House"),("Verso Books"),("Haymarket Books"),("Seven Stories Press"),
("Beacon Press"),("Akashic Books"),("Coffee House Press"),("Europa Editions"),("City Lights Publishers"),
("New Directions Publishing"),("And Other Stories"),("Black Inc."),("Alfred A. Knopf"),("Vintage Books"),
("Ballantine Books"),("Doubleday"),("Little, Brown and Company"),("Riverhead Books"),("W. W. Norton & Company"),
("Harvard University Press"),("Yale University Press"),("Princeton University Press"),("Duke University Press"),
("Johns Hopkins University Press");
                        
CREATE TABLE If Not Exists Book_T( B_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
					  B_Name VARCHAR(300),
                      Writer_id INT,
                      Pub_id INT,
                      Inv_id INT,
                      is_available INT NOT NULL DEFAULT 0,
                      CONSTRAINT Writer_id_fk1 FOREIGN KEY(Writer_id) REFERENCES Writer_T(Writer_ID),
					  CONSTRAINT Pub_id_fk FOREIGN KEY(Pub_id) REFERENCES publications_t(PublicationID)
                      );
      
ALTER TABLE Book_T AUTO_INCREMENT=1;

/*Inserting values to the Book_entity table*/

INSERT INTO  Book_T(B_id, B_Name, Writer_id, Pub_id,Inv_id,is_available) VALUES
					(1, "The Shining", 1, 2,5,0),
                    (2, "Pet Sematary", 1, 6,15,0),
                    (3, "The Alchemist", 2,3, 4,0),
                    (4, "Veronika Decides to Die", 36, 36,14,0),
                    (5, "The Zahir", 2, 5,24,1),
                    (6, "By the River Piedra I Sat Down and Wept", 37, 50,34,1),
                    (7, "The Poems of Emily Dickinson", 3, 40,44,0),
                    (8, "Harry Potter", 4, 45,1,0),
                    (9, "Murder on the Orient Express", 5, 1,16,0),
                    (10, "Death on the Nile", 5, 19,6,1),
                    (11, "The Adventures of Huckleberry Finn", 6, 25,1,0),
                    (12, "The Adventures of Tom Sawyer", 6, 35,11,0),
                    (13, "Interview with the Vampire", 7, 22,25,0),
                    (14, "The Vampire Lestat", 7, 23,35,1),
                    (15, "Pride and Prejudice", 8, 36,12,1),
                    (16, "Sense and Sensibility", 38, 27,12,1),
                    (17, "Romeo and Juliet", 9, 29,8,0),
                    (18, "Hamlet", 9, 31,8,0),
                    (19, "War and Peace", 10, 31,23,0),
                    (20, "The Lightness", 11, 35,42,0),
                    (21, "1984", 12, 1,4,0),
                    (22, "The Hitchhiker's Guide to the Galaxy", 13, 3,4,0),
                    (23, "Charlotte's Web", 14, 5,17,0),
                    (24, "To Kill a Mockingbird", 15, 5,24,0),
                    (25, "Crime and Punishment", 16, 4,3,0),
(26, "The Brothers Karamazov", 17, 4,3,0),
(27, "The Great Gatsby", 18, 6,2,0),
(28, "The Catcher in the Rye", 19, 41,2,0),
(29, "The Bell Jar", 20, 37,34,0),
(30, "The Picture of Dorian Gray", 21, 25,35,0),
(31, "The Count of Monte Cristo", 22, 17,36,1),
(32, "The Three Musketeers", 23, 1,26,0),
(33, "The Hobbit", 24, 3,4,0),
(34, "The Lord of the Rings", 25, 3,14,1),
(35, "The Hunger Games", 26, 47,25,0),
(36, "To Kill a Kingdom", 27, 43,5,1),
(37, "The Joy Luck Club", 28, 28,2,1),
(38, "The Color Purple", 29, 29,12,1),
(39, "The Immortal Life of Henrietta Lacks", 30, 37,3,1),
(40, "The Origin of Species", 31, 42,3,0),
(41, "The Adventures of Sherlock Holmes", 32, 18,26,1),
(42, "The Memoirs of Sherlock Holmes", 33, 11,6,1),
(43, "The Girl with the Dragon Tattoo", 34, 28,15,0),
(44, "The Girl Who Played with Fire", 35, 22,35,0);






/* Dropping the table Emp_T if it exists. */
Drop Table if exists Emp_T;

/* Creating the table Emp_T. */
CREATE TABLE Emp_T( Emp_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						  Emp_FirstName VARCHAR(300),
                          Emp_LastName VARCHAR(300),
                          Emp_Address VARCHAR(300),
                          Emp_City VARCHAR(400),
                          Emp_St VARCHAR(10),
                          Emp_Zip VARCHAR(20),
                          Emp_Num BIGINT,
                          Emp_isAvailable INT NOT NULL DEFAULT 1
                          );
/*The first auto-incremented primary key value assigned 
to a new record will be 1, the second will be 2 and so on.*/ 
ALTER TABLE Emp_T AUTO_INCREMENT=1;

/* Inserting values to the Emp_T. */
INSERT INTO Emp_T (Emp_FirstName, Emp_LastName, Emp_Address, Emp_City, Emp_St,Emp_Zip, Emp_Num, Emp_isAvailable) 
VALUES ("Prakhar", "Gupta", "280 W Renner Rd", "Richardson", "TX", '75080', "94526362636", "1"),
	   ("Kislay", "Trivedi", "New Hampshire", "Chicago", "IL", '67587', "94526362636", "0"),
	   ("Abhay", "Singh", "250 Preston Rd", "Richardson", "TX", '75080', "2464571234", "0"),
       ("Divij", "Karwasara", "980 Horsehoe Drive", "New York City", "NY", '82467', "7562471358", "1"),
       ("Puneet", "Sangwan", "25th Ave Road", "Seattle", "WA", '98121', "9452636167", "1"),
        ("Christopher", "Lee", "864 Cherry Lane", "Seattle", "WA", '98794', "9873216549", "1"),
         ("Samantha", "Clark", "975 Oakwood Boulevard", "Seattle", "WA", '98165', "9456123785", "0"),
         ("Allen", "Garcia", "7650 McCallum Blvd", "Dallas", "TX", '75007', "9564543214", "1"),
         ("Jayt", "Brown", "1830 Post OAK Lane", "Carrolton", "TX", '78447', "9856231475", "1"),
         ("Earnest", "Drone", "12400 Montana Dr", "Firsco", "TX", '97458', "99154623784", "0"),
         ("Aeiron", "Washington", "9301 Fairmont Dr", "Denton", "TX", '67845', "9685741239", "1"),
         ("John", "Doe", "8400 Blackthorn Trl", "Houston", "TX", '654123', "9764312587", "0"),
         ("Ava", "Gonzales", "123 Main St", "Los Angeles", "CA", '90001', "2135551234", "1"),
("Jared", "Rivera", "456 Elm St", "San Francisco", "CA", '94105', "4155555678", "0"),
("Brianna", "Taylor", "789 Oak St", "San Diego", "CA", '92101', "6195559876", "1"),
("Elijah", "Lee", "321 Pine St", "Sacramento", "CA", '95814', "9165555555", "0"),
("Sophia", "Nguyen", "567 Birch St", "San Jose", "CA", '95110', "4085551234", "1"),
("Adam", "Clark", "890 Maple St", "Fresno", "CA", '93721', "5595555555", "0"),
("Maya", "Perez", "234 Cedar St", "Long Beach", "CA", '90802', "5625555555", "1"),
("Lucas", "Smith", "567 Walnut St", "Oakland", "CA", '94607', "5105555555", "0"),
("Aria", "Garcia", "901 Broadway", "Santa Ana", "CA", '92701', "7145555555", "1"),
("Nathan", "Johnson", "345 Cherry St", "Bakersfield", "CA", '93301', "6615555555", "0"),
("Isabella", "Martinez", "678 Pine St", "Riverside", "CA", '92501', "9515555555", "1"),
("Joshua", "Brown", "123 Main St", "Las Vegas", "NV", '89101', "7025551234", "1"),
("Ella", "Gonzalez", "456 Elm St", "Henderson", "NV", '89014', "7025555678", "0"),
("Ryan", "Rodriguez", "789 Oak St", "Reno", "NV", '89501', "7755559876", "1"),
("Liam", "Lee", "321 Pine St", "Carson City", "NV", '89701', "7755555555", "0"),
("Chloe", "Nguyen", "567 Birch St", "Sparks", "NV", '89431', "7755551234", "1"),
("Mason", "Clark", "890 Maple St", "Elko", "NV", '89801', "7755555555", "0"),
("Mia", "Perez", "234 Cedar St", "Winnemucca", "NV", '89445', "7755556555", "1"),
("Ethan", "Smith", "567 Walnut St", "Boulder City", "NV", '89005', "7025555555", "0"),
("Emma", "Garcia", "901 Broadway", "Mesquite", "NV", '89027', "7025557555", "1"),
("Noah", "Johnson", "345 Cherry St", "Ely", "NV", '89301', "7755555555", "0"),
("Emma", "Lee", "1234 Elm Street", "San Francisco", "CA", '94102', "4151234567", "0"),
("Lucas", "Chen", "5678 Pine Avenue", "Los Angeles", "CA", '90001', "2139876543", "1"),
("Sophie", "Miller", "4321 Maple Drive", "San Diego", "CA", '92101', "6195551234", "1"),
("Matthew", "Garcia", "9101 Beach Boulevard", "Miami", "FL", '33139', "3059876543", "0"),
("Isabella", "Lopez", "4567 Ocean Avenue", "Tampa", "FL", '33602', "8135551234", "1"),
("William", "Nguyen", "8901 Forest Drive", "Houston", "TX", '77002', "7139876543", "1"),
("Ella", "Rivera", "3456 Bay Street", "Austin", "TX", '78701', "5125551234", "0"),
("Michael", "Kim", "6789 Hillcrest Road", "Dallas", "TX", '75205', "2149876543", "1"),
("Olivia", "Patel", "2468 Main Street", "New York", "NY", '10001', "2125551234", "1"),
("Benjamin", "Wu", "1357 Broadway", "Chicago", "IL", '60602', "3129876543", "0"),
("Ava", "Singh", "369 Elmwood Avenue", "Boston", "MA", '02115', "6175551234", "1"),
("Jacob", "Chung", "2587 Massachusetts Avenue", "Cambridge", "MA", '02138', "6179876543", "1"),
("Mia", "Park", "1471 Webster Street", "San Francisco", "CA", '94115', "4155551234", "0"),
("Ethan", "Lee", "7532 Olive Street", "Los Angeles", "CA", '90012', "2139876543", "1"),
("Charlotte", "Gonzalez", "2468 Pine Street", "San Diego", "CA", '92103', "6195551234", "1"),
("Alexander", "Chen", "9123 Grove Avenue", "Miami", "FL", '33133', "3059876543", "0"),
("Sofia", "Lopez", "5678 Palm Boulevard", "Tampa", "FL", '33606', "8135551234", "1"),
("Daniel", "Nguyen", "8901 Bayshore Drive", "Houston", "TX", '77006', "7139876543", "1"),
("Avery", "Rivera", "2345 Ocean View Drive", "Austin", "TX", '78703', "5125551234", "0"),
("Madison", "Kim", "7890 Main Street", "Dallas", "TX", '75201', "2149876543", "1"),
("Liam", "Patel", "3214 Lexington Avenue", "New York", "NY", '10016', "2125551234", "1");


/*Drop Chamber_Details if it exists*/
DROP TABLE IF EXISTS Chamber_Details_T; 

/*Creating table Chamber details, to store the rooms or offices available in the organization */
CREATE TABLE Chamber_Details_T(ChamberID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
					 ChamberType VARCHAR(300),
					 Chamber_Cap INT,
                     Chamber_availability int NOT NULL);

ALTER TABLE Chamber_Details_T AUTO_INCREMENT=1;
                     
/*Storing values to the respective columns of Chamber details.*/                    
INSERT INTO Chamber_Details_T(ChamberType, Chamber_Cap, Chamber_availability)VALUES
				   ('Alamo, MC 3.442-Study Rooms', 4, 0),
				   ('Bluebonnet, MC 3.618-Study Rooms', 6, 1),
				   ('Honeybee, MC 3.710-Study Rooms', 8, 1),
                   ('Horned Lizard, MC 3.228-Study Rooms', 4, 1),
                   ('Mindfulness Room (MC 2.518)-Mindfulness Room Spaces', 2, 0),
                   ('Smart Armadillo Room (MC 2.512)-Technology Spaces', 10, 0),
                   ('Smart Chili Room (MC 3.701)-Technology Spaces', 4, 1),
                   ('Smart Tejas Room (MC 3.704)-Technology Spaces', 10, 1),
                   ('Smart Friendship Room (MC 2.530)-Technology Spaces', 14, 0),
                   ('Prickly Pear, MC 2.520-Study Rooms', 5, 0),
                   ('Topaz, MC 3.236-Study Rooms', 4, 1),
                   ('Rodeo, MC 3.230-Study Rooms', 5, 0);
                   
                   
/*Dropping table Accounting_Table, if in case it exists in the database*/
DROP TABLE IF Exists Accounting_T;

/*Creating table Accounting_Tables, to store the details 
of the types of accounts available from where we record the finances */
CREATE TABLE Accounting_T(Acc_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Account_Type VARCHAR(100),
						Tariffindollars INT);

ALTER TABLE Accounting_T AUTO_INCREMENT=1;
		
/*Storing values to the respective columns of Accounting_Table.*/    					
INSERT INTO Accounting_T(Account_Type, Tariffindollars) VALUES 
						("Overdue", 50),
("Non attendance", 30),
("Vandalised", 40),
("Lost", 80),
("New Member Fee", 30),
("Membership renewal", 25),
("Existing Member", 0),
("Late fee", 20),
("Delivery fee", 10),
("Processing fee", 15),
("Reservation fee", 5),
("Return fee", 15),
("Interlibrary loan fee", 20),
("Damage fee", 25),
("Membership card replacement fee", 5),
("Account reactivation fee", 20),
("Copy/print fee", 0.1),
("Fax fee", 1),
("Meeting room reservation fee", 50),
("Computer use fee", 1),
("Research fee", 10),
("Microfilm/microfiche printing fee", 0.25),
("Lost key replacement fee", 10),
("Audio book rental fee", 2),
("DVD rental fee", 1.5),
("Blu-ray rental fee", 2),
("Magazine rental fee", 0.5),
("Newspaper rental fee", 0.25),
("Interlibrary loan processing fee", 10),
("Library card replacement fee", 2),
("Expedited shipping fee", 30),
("International shipping fee", 50),
("Overnight shipping fee", 40),
("Express delivery fee", 20),
("Priority mail fee", 15),
("Media mail fee", 5),
("Book processing fee", 10),
("Cataloging fee", 5),
("Acquisition fee", 20),
("Database access fee", 25),
("Remote access fee", 15),
("Technology fee", 10);
/*Drop Transaction_T if it exists*/
Drop table if exists Transaction_T;

/*Create Transaction_T table*/
CREATE TABLE Transaction_T (Transaction_ID INT PRIMARY KEY auto_increment,
                            Transaction_Type VARCHAR(200),
                            Fees_Type VARCHAR(200),
                            Groupm_ID INT); 

ALTER TABLE Transaction_T AUTO_INCREMENT=1;

Insert into Transaction_T (Transaction_Type,Fees_Type,Groupm_ID) values 
							  ("Checkout", "Late fee", 1),
							  ("Check-in", "Processing fee", 2),
							  ("Renewal", "Lost item fee", 3),
							  ("Reservation", "Late fee", 4),
							  ("Checkout" , "Processing fee", 5),
							  ("Check-in", "Lost item fee", 6),
							  ("Renewal", "Late fee",7),
							  ("Reservation","Processing fee",8),
							  ("Checkout", "Late fee", 9),
							  ("Check-in", "Lost item fee",10),
							  ("Renewal", "Processing fee", 11),
							  ("Reservation", "Late fee", 12),
							  ("Checkout", "Lost item fee",13),
							  ("Check-in","Processing fee",14),
							  ("Renewal", "Late fee", 15),
							  ("Reservation", "Processing fee", 16),
							  ("Checkout", "Late fee", 17),
							  ("Check-in",  "Lost item fee",18),
							  ("Renewal",  "Processing fee", 19),
							  ("Reservation", "Late fee",  20),
							  ("Checkout",  "Processing fee",  21),
							  ("Check-in", "Late fee", 22),
							  ("Renewal","Lost item fee",23),
							  ("Reservation", "Processing fee",24),
							  ("Checkout" ,"Late fee",  25),
							  ("Check-in","Lost item fee",26),
							  ("Renewal","Processing fee", 27),
							  ("Reservation", "Late fee", 28),
							  ("Checkout", "Processing fee",29),
							  ("Check-in",  "Late fee",  30),
							  ("Renewal", "Lost item fee", 31),
							  ("Reservation",  "Processing fee",32),
							  ("Checkout","Late fee",33),
							  ("Check-in", "Lost item fee", 34),
							  ("Renewal","Processing fee", 35),
							  ("Reservation","Late fee",36),
							  ("Checkout", "Processing fee", 37),
							  ("Check-in", "Late fee",38),
							  ("Renewal","Lost item fee",39),
							  ("Reservation","Processing fee",40),
							  ("Checkout", "Late fee",41),
							  ("Check-in", "Lost item fee", 42),
							  ("Renewal","Processing fee", 43),
							  ("Reservation","Late fee", 44),
							  ("Checkout","Processing fee",45),
							  ("Check-in","Late fee",46),
							  ("Renewal","Lost item fee",47),
							  ("Reservation", "Processing fee", 48),
							  ("Checkout", "Late fee",  49),
							  ("Check-in", "Lost item fee", 50);


/*Dropping Core_Table if it exists*/
Drop table if exists Core_T;

/*Create Core_Table table, will act as a master table*/
CREATE TABLE if not exists Core_T (GroupmID INT, 
			   B_ID INT,
               Emp_id  INT,
               Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
               Acc_ID INT,
               Transaction_Type VARCHAR(20) DEFAULT "Free",
               Borrowed INT NOT NULL DEFAULT 0,
               Returned INT NOT NULL DEFAULT 0,
               DateofIssue DATETIME,
               DateofReturned DATETIME,
               CONSTRAINT GroupmID_fk FOREIGN KEY(GroupmID) REFERENCES Groupm_T(GroupmID) ON DELETE CASCADE,
               CONSTRAINT B_ID_fk1 FOREIGN KEY(B_ID) REFERENCES book_T(B_ID),
               CONSTRAINT Emp_id_fk FOREIGN KEY(Emp_id) REFERENCES Emp_T(Emp_id),
               CONSTRAINT Acc_ID_fk FOREIGN KEY(Acc_ID ) REFERENCES accounting_t (Acc_ID)
                           
               );

/*The first auto-incremented primary key value assigned 
to a new record will be 1, the second will be 2 and so on.*/ 
ALTER TABLE Core_T AUTO_INCREMENT=1;

INSERT INTO Core_T (GroupmID, B_ID, Emp_id, Acc_ID, Transaction_Type, Borrowed, Returned, DateofIssue, DateofReturned) 
VALUES 
(1, 1, 1, 1, 'Checkout', 0, 0, '2023-04-10 10:00:00', '2023-04-15 10:00:00'),
(1, 2, 3, 14, 'Check-in', 0, 0, '2023-04-5 09:00:00', '2023-04-15 12:30:00'),
(1, 5, 5, 7, 'Renewal', 0, 0, '2023-04-10 10:00:00', '2023-04-15 10:00:00');

SELECT * from book_t;
SELECT * from inventory_t

DELIMITER //
CREATE PROCEDURE delete_books(IN Book_ID INT ) 
BEGIN
UPDATE book_t
SET is_available = 1
WHERE Book_ID = B_id;
UPDATE Inventory_T
SET   Item_Quantity= 0,
	  Latest_ItemDate_Received= NOW()
WHERE  Item_ID = Book_ID;
END//


DELIMITER //
CREATE PROCEDURE add_books(
IN Book_Name varchar(20), Writer_Name varchar(20), Publisher_name VARCHAR(20) 
)
BEGIN
DECLARE pid INT; 
DECLARE wid INT;

IF pid NOT IN (SELECT PublicationID FROM Publications_T)
THEN
INSERT INTO Publications_T(PublicationName) VALUES (Publisher_name);
SET @pid = (SELECT PublicationID FROM Publications_T WHERE PublicationName = Publisher_name );
ELSE
SET @pid = (SELECT PublicationID FROM Publications_T WHERE PublicationName = Publisher_name );
END IF;

IF wid NOT IN (SELECT Writer_ID FROM writer_t)
THEN
INSERT INTO writer_t(WriterName) VALUES (Writer_Name);
SET @wid = (SELECT Writer_ID FROM writer_t WHERE  WriterName= Writer_Name );
ELSE
SET @wid = (SELECT Writer_ID FROM writer_t WHERE WriterName = Writer_Name );
END IF;

/*IF Book_Name NOT IN (SELECT Item_Category from inventory_t)
THEN
INSERT INTO Inventory_T(Item_Category, LastUpdated) VALUES (Book_Name, NOW());
ELSE
SELECT "Book already in database";
END IF;*/

IF Book_Name NOT IN (SELECT B_Name from book_t)
THEN
INSERT INTO book_t(BookName, Writer_id, Pub_id) VALUES (Book_Name, @wid, @pid);
ELSE
SELECT "Book already in database";
END IF;
END//





DELIMITER //
CREATE PROCEDURE delete_employee(
IN Employee_ID INT 
)
BEGIN 
UPDATE emp_t
SET Emp_isAvailable = 0
WHERE Employee_ID = Emp_id;
END//




CREATE TABLE employee_audit(Emp_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						  Emp_FirstName VARCHAR(300),
                          Emp_LastName VARCHAR(300),
                          Emp_Address VARCHAR(300),
                          Emp_City VARCHAR(400),
                          Emp_St VARCHAR(10),
                          Emp_Zip VARCHAR(20),
                          Emp_Num BIGINT,
                          LastUpdated DATE,
                          action varchar(20));
                          
/*DROP TABLE employee_audit;*/
#trigger_UPDATE for Employees_T

CREATE TRIGGER employee_audit
	AFTER UPDATE ON emp_t
    FOR EACH ROW
    BEGIN
	INSERT INTO employee_audit
    SET LastUpdated = NOW(),
		action = "Updated",
        Emp_id = OLD.Emp_id,
		Emp_FirstName = OLD.Emp_FirstName,
		Emp_LastName = OLD.Emp_LastName,
        Emp_Address = OLD.Emp_Address,
		Emp_City = OLD.Emp_City,
		Emp_St = OLD.Emp_St,
	    Emp_Zip =  OLD.Emp_Zip,
		Emp_Num = OLD.Emp_Num;
/* DROP TRIGGER employee_audit;       */
END//




DELIMITER //
CREATE PROCEDURE Core_Entry_Borrowed_books(
IN 	Groupm_ID INT, 
	Book_ID INT,
	Employee_ID INT
)
BEGIN
IF (SELECT Item_Quantity FROM Inventory_T where Item_ID = Book_ID) >=1 AND Book_ID IN (SELECT Item_ID from Inventory_T)
THEN

INSERT INTO core_t(GroupmID, B_ID, Emp_id,Borrowed , DateofIssue) values
(Groupm_ID ,Book_ID, Employee_ID, 1, NOW());

UPDATE Inventory_T 
SET Item_Quantity = Item_Quantity - 1,
Latest_ItemDate_Received = NOW();

ELSE
Select "Book out of stock";

END IF;
END//

DELIMITER ;


/*As soon as the request for 5 books with same book name comes then the trigger would be there*/

CREATE TABLE Requests_T(RequestID INT PRIMARY KEY AUTO_INCREMENT,
						 GroupmID INT,
                        Book_Name varchar(30),
                        CONSTRAINT GroupmID_fk2 FOREIGN KEY(GroupmID) REFERENCES groupm_t(GroupmID)
                      );

INSERT INTO Requests_T (GroupmID,Book_Name) VALUES 
                       (1, "The Shining"),
                    (2, "Pet Sematary"),
                    (3, "The Alchemist"),
                    (4, "Veronika Decides to Die"),
                    (5, "The Zahir");

CREATE TABLE BookToOrder_T(OrderID INT PRIMARY KEY AUTO_INCREMENT,
                        Book_Name varchar(30)
                      );
ALTER TABLE BookToOrder_T AUTO_INCREMENT = 100;
	
DELIMITER //
create TRIGGER insert_into_bookto_order
after insert on Requests_T for each row begin
DECLARE updatecount INT;
set updatecount = (SELECT COUNT(Book_Name) FROM Requests_T where book_name = new.book_name);
if updatecount >= 5 and new.book_name not in (select book_name from booktoorder_T)
    then
	insert into booktoorder_T(book_name) values (new.book_name);
  end if;
end//
DELIMITER ;

/* Functions*/

/* Room Available function*/

DELIMITER $$
CREATE FUNCTION GetAvailableRooms() RETURNS INT
BEGIN
    DECLARE available_rooms INT;
    SELECT COUNT(*) INTO available_rooms
    FROM chamber_details_t
    WHERE  Chamber_availability = 1;
    RETURN available_rooms;
END $$
DELIMITER ;

/* Getting Member books*/
DELIMITER $$
CREATE FUNCTION GetMemberBooks(GroupmID INT) RETURNS VARCHAR(1000)
BEGIN
    DECLARE books VARCHAR(1000);
    SELECT GROUP_CONCAT(b.B_Name SEPARATOR ', ')
    INTO books
    FROM  core_t m
    JOIN book_t b ON m.B_ID = b.B_id
    WHERE m.GroupmID = GroupmID;
    RETURN books;
END $$
DELIMITER ;

/*Getting Books according to publisher*/

DELIMITER $$
CREATE FUNCTION GetPublisherBooks(publisher_id INT) RETURNS VARCHAR(1000)
BEGIN
    DECLARE books VARCHAR(1000);
    SELECT GROUP_CONCAT(b.B_Name SEPARATOR '\n ')
    INTO books
    FROM book_t b
    JOIN publications_t p on b.Pub_id = p.PublicationID
    WHERE b.Pub_id = publisher_id;
    RETURN books;
END $$
DELIMITER ;

/*View*/
/*created a view that lists the details of all books that are currently available in the library, 
along with the name of the author who wrote them and the name of the publisher who published them*/


CREATE VIEW AvailableBooks AS
SELECT b.B_id, b.B_Name AS book_name, w.WriterName AS Writer_name, p.PublicationName AS publisher_name
FROM book_t b
JOIN writer_t w ON b.Writer_id = w.Writer_ID
JOIN publications_t p ON b.Pub_id = p.PublicationID
WHERE b.is_available = 1;



