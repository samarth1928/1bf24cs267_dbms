create database emp;
use emp;
CREATE TABLE dept (
deptno int primary key,
dname varchar(20) default NULL,
loc varchar(20) default NULL
);
INSERT INTO dept VALUES(10,'ACCOUNTING','MUMBAI');
INSERT INTO dept VALUES (20,'RESEARCH','BENGALURU');
INSERT INTO dept VALUES (30,'SALES','DELHI');
INSERT INTO dept VALUES (40,'OPERATIONS','CHENNAI');
select * from dept;

 drop table emp;
 CREATE TABLE emp(empno int primary key,
ename varchar(10) default NULL,
mgr_no int default NULL,
hiredate date default NULL,
sal int default NULL,
deptno int references dept(deptno)on delete cascade on update cascade );

INSERT INTO emp VALUES(300,'ADARSH',500,'2012-12-17',80000,20);
INSERT INTO emp VALUES(301,'SHRUTHI',501,'2013-02-20',16000,20);
INSERT INTO emp VALUES(302,'ANVITHA',502,'2015-02-22',12500,20);
INSERT INTO emp VALUES(303,'TANVIR',503,'2008-04-02',29700,20);
INSERT INTO emp VALUES(304,'RAMESH',504,'2014-09-28',12500,20);
INSERT INTO emp VALUES (7698,'Kumar',7839,'2015-05-01',28500,30);
INSERT INTO emp VALUES (7782,'CLARK',7839,'2017-06-09',24500,10);	
INSERT INTO emp VALUES (7788,'SCOTT',7566,'2010-12-09',30000,20);
INSERT INTO emp VALUES (7839,'KING',NULL,'2009-11-17',500000,10);
INSERT INTO emp VALUES (7844,'TURNER',7698,'2010-09-08',15000,30);
INSERT INTO emp VALUES (7876,'ADAMS',7788,'2013-01-12',11000,20);
INSERT INTO emp VALUES (7900,'JAMES',7698,'2017-12-03',9500,30);
INSERT INTO emp VALUES (7902,'FORD',7566,'2010-12-03',30000,20);
select * from emp;
create table incentives (
empno int references emp(empno) on delete cascade on update cascade,
incentive_date date,
incentive_amount int,
primary key(empno,incentive_date));

INSERT INTO incentives VALUES(7499,'2019-02-01',5000);
INSERT INTO incentives VALUES(7521,'2019-03-01',2500);
INSERT INTO incentives VALUES(7566,'2022-02-01',5070);
INSERT INTO incentives VALUES(7654,'2020-02-01',2000);
INSERT INTO incentives VALUES(7654,'2022-04-01',879);
select * from incentives;
Create table project (
pno int primary key,
pname varchar(30) not null,
ploc varchar(30));	
INSERT INTO project VALUES(101,'AI Project','BENGALURU');
INSERT INTO project VALUES(102,'IOT','HYDERABAD');
INSERT INTO project VALUES(103,'BLOCKCHAIN','BENGALURU');
INSERT INTO project VALUES(104,'DATA SCIENCE','MYSURU');
INSERT INTO project VALUES(105,'AUTONOMUS SYSTEMS','PUNE');
select * from project;
Create table assigned_to (
empno int references emp(empno) on delete cascade on update cascade,
pno int references project(pno) on delete cascade on update cascade,
job_role varchar(30),
primary key(empno,pno));

INSERT INTO assigned_to VALUES(7499,101,'Software Engineer');
INSERT INTO assigned_to VALUES(7521,101,'Software Architect');
INSERT INTO assigned_to VALUES(7566,101,'Project Manager');
INSERT INTO assigned_to VALUES(7654,102,'Sales');
INSERT INTO assigned_to VALUES(7521,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7499,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7654,103,'Cyber Security');
select * from assigned_to;

