/*
SQL 1 : Consecutive Numbers
Task
Write a SQL query to find all numbers that appear at least 3 times in a row.

The input will be a table named input_table and has 2 columns:

'id' column, a unique ID of each row, showing the order
'num' column, a number for each ID
Your output will be a table with only 1 column and display the number that appear at least 3 times (or more) in a row. Don't output a duplicate number.

Your output should be in ascending order.

The id column in input_table will always be in the form of an INTEGER, and the next row is always +1 from the previous row.
*/
create table input_table(
  id serial primary key,
  num int);

insert into input_table values (1, 1);  
insert into input_table values (2, 1);
insert into input_table values (3, 1);
insert into input_table values (4, 2);
insert into input_table values (5, 1);
insert into input_table values (6, 2);
insert into input_table values (7, 2);
insert into input_table values (8, 1);

SELECT DISTINCT num
FROM input_table current
WHERE num = ALL (
    SELECT num
    FROM input_table next
    WHERE next.id BETWEEN current.id AND current.id + 2
)
ORDER BY num;

/*SQL 2 : Email Duplicates
Task
Write a SQL query to find all duplicate emails that is given in the input.

The input will be a table named email_list consisting of two columns:

The first column is the ID
The second column is the email address
Your output should consist of one column, and inside that column is the email address(es) that is/are duplicated.
*/
create table email_list (
  ID serial primary key,
  email varchar (30));

insert into email_list values (1, 'abcd@gmail.com');
insert into email_list values (2, 'def@gmail.com');
insert into email_list values (3, 'abcd@gmail.com');
insert into email_list values (4, 'abcd@gmail.com');
insert into email_list values (5, 'def@gmail.com');

SELECT email
FROM email_list
GROUP BY email
HAVING COUNT(*) > 1;