select C.customer_name from BANK_CUSTOMER C where exists (
select D.customer_name, count(D.customer_name) from DEPOSITER D, BANK_ACCOUNT BA where D.accno=BA.accno and C.customer_name=D.customer_name and BA.branch_name='SBI_ResidencyRoad' group by D.customer_name having count(D.customer_name)>=2);

select D.customer_name from DEPOSITER D, BANK_ACCOUNT BA, BRANCH B where D.accno=BA.accno and BA.branch_name=B.branch_name and B.branch_city='Delhi' group by D.customer_name having count(distinct(B.branch_name))=(select count(branch_name) from branch where branch_city='Delhi');

create table BORROWER (customer_name varchar(30), loan_no int primary key, foreign key(customer_name) references BANK_CUSTOMER(customer_name));
insert into borrower (customer_name, loan_no) values
('Avinash',1),('Dinesh',2),('Mohan',3),('Nikil',4),('Ravi',5);

select distinct(customer_name) from borrower where customer_name not in (select customer_name from depositer);

select customer_name from borrower bo,loan l where bo.loan_no =l.loan_no and l.branch_name in ( select branch_name from depositer D, bank_account BA where D.accno=BA.accno and BA.branch_name in (select branch_name from branch where branch_city ='Bangalore'));

insert into branch values ('SBI_MantriMarg','Delhi',200000);
insert into bank_account values (12,'SBI_MantriMarg',2000);

delete from bank_account where branch_name in (select branch_name from branch where branch_city='Bombay');
select * from bank_account;

update bank_account set balance=balance+(0.05*balance);
select * from bank_account;