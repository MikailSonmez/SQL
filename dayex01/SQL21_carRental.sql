CREATE DATABASE springbootwebapp;
use springbootwebapp;
use sys;
select * from student;
select * from table_employees;
delete from student where id in('18','19','20','21','22','23');
alter table student drop column age;

CREATE TABLE students
    (
        id LONG,
        DOB DATETIME,
        EMAİL VARCHAR(50),
        NAME VARCHAR(50) ,
        AGE int ,
        ERR_MSG VARCHAR(100)
    );
 INSERT INTO students VALUES( "101","1974-04-03","hb@cimeyıl.com", "haluk bilgin",null,"batı yakası sakin dewamkeee..." );
 INSERT INTO students VALUES( "102","1979-05-04", "ib@cimeyıl.com","ipek bilgin",null,"batı yakası sakin dewamkeee..." );
 INSERT INTO students VALUES( "103", "1974-06-05", "hbl@cimeyıl.com","harun bilir",null,"batı yakası sakin dewamkeee..." );
 INSERT INTO students VALUES( "104", "1974-07-08" ,"tbl@cimeyıl.com","tarık bilmis",null,"batı yakası sakin dewamkeee..." );
 
 select * from students;
SELECT id,dob,email,name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age, err_msg from students;