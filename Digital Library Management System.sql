create database college_library_management_system;
use college_library_management_system;

create table book_details
(
book_id int,
book_title varchar(50),
author varchar(50),
edition int,
copies int,
other_books int,
deptcode_id int,
primary key(book_id),
foreign key(deptcode_id) references department(deptcode_id)
);

create table department
(deptcode_id int,
dept_name varchar(50),
dept_block varchar(50),
primary key(deptcode_id)
);

create table students
( student_roll_NO int,
student_name varchar(50),
deptcode_id int,
year_Of_study int,
mobile_NO bigint,
email_id varchar(50),
Address varchar(50),
gender varchar(50),
primary key(student_roll_NO),
foreign key(deptcode_id) references department(deptcode_id)
);

create table student_details
( id int,
year_of_study varchar(50),
semster varchar(50),
deptcode_id int,
student_roll_NO int,
primary key(id),
foreign key(student_roll_NO) references students(student_roll_NO),
foreign key(deptcode_id) references department(deptcode_id)
);

create table borrowing_details
( borrowing_id int,
book_title varchar(50),
book_id int,
borrowed_date_out datetime,
date_return datetime,
student_roll_NO int,
primary key(borrowing_id),
foreign key(student_roll_NO) references students(student_roll_NO),
foreign key(book_id) references book_details(book_id)
);

create table bookbank_details
(bookbank_id int,
book_id int,
student_roll_NO int,
student_name varchar(50),
primary key(bookbank_id),
foreign key(book_id) references book_details(book_id)
);

create table transection
( trans_id int,
trans_name varchar(50),
borrowing_id int,
student_roll_NO int,
trans_date datetime,
primary key(trans_id),
foreign key(student_roll_NO) references students(student_roll_NO),
foreign key(borrowing_id) references borrowing_details (borrowing_id)
);

create table report
(report_id int,
borrowing_id int,
report_date datetime,
fine int,
trans_id int,
primary key(report_id),
foreign key(borrowing_id) references borrowing_details (borrowing_id),
foreign key (trans_id) references transection(trans_id)
);


























