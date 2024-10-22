USE Data_Storage_Management_System;


Select * from accounting_t;
Select * from book_t;
Select * from booktoorder_t;
Select * from chamber_details_t;
Select * from core_t;
Select * from emp_t;
Select * from employee_audit;

Select * from groupm_audit;
Select * from groupm_t;
Select * from inventory_t;
Select * from publications_t;
Select * from requests_t;
Select * from transaction_t;
Select * from writer_t;

/*Delete group member from the list*/
CALL delete_Groupm(4);
SELECT * FROM Groupm_T;


/*Using trigger for updating the table*/
UPDATE Groupm_T
SET 
	GroupmName = "Soumee Roy"
WHERE 
	GroupmID = 3;

SELECT * FROM Groupm_T;

SELECT * FROM Groupm_audit ;


/*Adding new book and also checking if it exsists*/
CALL add_books("Pet Sematary", "Stephen King", "Pandas");
CALL delete_books(1);

select * from writer_t;
select * from publications_T;
SELECT * FROM book_t;
SELECT * FROM  inventory_t;


CALL delete_employee(2);
SELECT * FROM emp_t;


UPDATE emp_t
SET 
	Emp_FirstName = "Jared" ,
     Emp_LastName = "Smith"
WHERE 
	Emp_id = 3;

SELECT * FROM employee_audit;
      
SELECT * FROM emp_t;


Call Core_Entry_Borrowed_books(1,1,1);
/*TRUNCATE TABLE core_t;*/
select * from core_t;
          
SELECT * FROM transaction_t;



/* Function*/
/*To find the number of available rooms*/
SELECT * from chamber_details_t;

SELECT GetAvailableRooms() as number_of_rooms_Available;

/*Get the books for a particular group member*/
SELECT GetMemberBooks(1);

/*Get books that are published by a particular publisher*/
SELECT GetPublisherBooks(3);

/*View*/

SELECT * FROM AvailableBooks;

/*General queries*/
/*the query to select the book ID, book name, writer ID, 
and availability status of books in the book table that have corresponding entries in the core table*/

Select b.B_id, b.B_name, b.Writer_id, b.is_available
FROM book_t b
Join core_t c ON b.B_ID = c.B_ID;


/* The names and email IDs of the group members who have borrowed a book and 
not returned it yet, along with the book ID, transaction ID, and the expected return date*/
select Groupm_T.GroupmName,Groupm_T.Groupm_EmailID, Core_T.B_ID,Transaction_T.Transaction_ID, Core_T.DateofReturned
From Transaction_T
right join Groupm_T on Transaction_T.Groupm_ID=Groupm_T.GroupmID
natural join Core_T
where Core_T.Returned = 0;

/*Get the total number of books in the database that were published by "Penguin" and have a genre of "Romance"*/
SELECT COUNT(*) AS total_books
FROM book_t
WHERE Pub_id = (SELECT PublicationID FROM publications_t WHERE PublicationName = 'GoodFolks');





SELECT Book_T.*, Publications_T.PublicationName
FROM Book_T
NATURAL JOIN Publications_T;

SELECT Writer_T.*, Book_T.B_Name
FROM Writer_T
RIGHT JOIN Book_T
ON Writer_T.Writer_ID = Book_T.Writer_id;



/* Query to get data of the books borrowed
select Groupm_T.GroupmName,Groupm_T.Groupm_EmailID, Core_T.B_ID,Transaction_T.Transaction_ID, Core_T.DateofIssue
From Transaction_T
right join Groupm_T on Transaction_T.Groupm_ID=Groupm_T.GroupmID
natural join Core_T
where Core_T.Borrowed = 0;*/


/*query to retrive the group member name, menber id and the book he has taken*/

select g.groupmName, g.groupm_emailID,b.b_name from groupm_t g
left join core_t c on g.groupmID=c.groupmID
left join book_t b on c.b_id=b.b_id;


SELECT i.item_id, i.Item_category, COUNT(*) AS num_books_available
FROM inventory_t i
left join book_t b ON b.Inv_id = i.Item_ID
GROUP BY i.item_id, i.Item_category;



SELECT COUNT(*) AS total_books
FROM book_t
WHERE
Inv_id = (SELECT Item_ID FROM inventory_t WHERE Item_Category = 'History');