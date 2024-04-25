create database University;
use university;
create table student(studentId int NOT NULL,
SNAME nvarchar(50) NOT null,
EMAIL nvarchar(255) NOT NULL,
LAPTOP_ID INT NOT NULL);

select * from student;
alter table student
add constraint laptop_id foreign key (laptop_id)
references laptop (laptopid);

create table laptop(laptopID int NOT NULL,
brand nvarchar(50) NOT null,
price int NOT NULL,
dop date NOT NULL);

select * from laptop;
alter table laptop
add constraint laptop_id primary key (laptopid);

insert into student values (1,'Niket Mishra','niket@gmail.com',101);
insert into student values (2,'Mukesh Nittal','mukesh@gmail.com',102);
insert into student values (3,'Nitesh singh','niket@gmail.com',103);
update student set sname = 'suman sharma' , email = 'suman@abis.com' where studentid =5;
insert into student values (4,'Niket Mishra','niket@gmail.com',104);
insert into student values (5,'Niket Mishra','niket@gmail.com',105);

insert into laptop values (101,'Dell',50000,'2022-04-15');
insert into laptop values (102,'Lenovo',55000,'2023-04-15');
insert into laptop values (103,'HP',60000,'2022-06-15');
insert into laptop values (104,'Samsung',65000,'2022-10-15');
insert into laptop values (105,'Apple',70000,'2024-04-15');

select s.studentid, s.sname, l.laptopid, l.brand from Student s, laptop l where s.laptop_id = l.laptopid;

Create table courses(
id int primary key not null,
name varchar(90) not null,
start_date date not null,
end_date date not null,
teacher_id int not null
);
Create table teacher(
id int primary key not null,
name varchar(90) not null,
email varchar(100) not null,
doj date not null
);
alter table courses
add constraint teacher_id foreign key (teacher_id)
references teacher (id);

select * from courses;
select * from teacher;

insert into teacher values (1001,'Aju Sir', 'aju@gmail.com','2020-10-10');
insert into teacher values (1002,'Yash Sir', 'yash@gmail.com','2021-10-10');
insert into teacher values (1003,'Swapnil Sir', 'swapnil@gmail.com','2022-10-10');
insert into teacher values (1004,'Ramesh Sir', 'ramesh@gmail.com','2023-10-10');
insert into teacher values (1005,'Mahesh Sir', 'mahesh@gmail.com','2024-10-10');

insert into courses values (1101,'Java','2023-12-10','2024-05-10',1001);
insert into courses values (1102,'JavaScript','2023-12-10','2024-05-10',1001);
insert into courses values (1103,'Golang','2022-10-20','2023-10-12',1003);
insert into courses values (1104,'SpringBoot','2022-02-20','2023-10-12',1002);
insert into courses values (1105,'Html','2022-10-20','2023-10-12',1004);

create table student_courses (
sid int,
cid int,
primary key(sid,cid),
foreign key (sid)
references student (studentId),
foreign key (cid)
references courses (id)
);

insert into student_courses values(4,1104),(3,1104);
select s.studentid,s.sname,c.name from student s, courses c , student_courses sc where sc.sid = s.studentid and sc.cid = c.id;
-- select distinct s.sname from student s,student_courses sc , courses c where sc.sid <> s.studentid and c.id <> sc.cid;

select s.sname,sc.cid from student s left join student_courses sc on s.studentid=sc.sid where sc.cid is null;
