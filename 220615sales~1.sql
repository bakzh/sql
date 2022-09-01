create table salesperson(
  name    varchar2(20),
  age     number,
  salary  number
);
alter table salesperson add constraint salesperson_pk primary key (name);
desc salesperson;

create table customer(
  name    varchar2(20),
  city    varchar2(20),
  industrytype  varchar2(20)
);
alter table customer add constraint customer_pk primary key (name);
desc customer;

create table orders(
  order_number    number,
  custname  varchar2(20),
  salesperson varchar2(20),
  amount    number
);
alter table orders add constraint order_combo_pk primary key(custname,salesperson);
alter table orders add constraint order_custname_fk foreign key(custname)
references customer (name);
alter table orders add constraint order_salesperson_fk foreign key(salesperson)
references salesperson (name);

insert into salesperson values ('TOM',31,10000);
insert into salesperson values ('SIA',25,9200);
insert into salesperson values ('KIM',23,9160);

insert into customer values ('john','LA','cop');
insert into customer values ('harry','Illinois','artist');
insert into customer values ('bob','Illinois','baker');

insert into orders values (1,'john','TOM',1);
insert into orders values (2,'bob','TOM',2);
insert into orders values (3,'harry','SIA',3);
insert into orders values (4,'harry','KIM',4);

select DISTINCT name,salary
  from salesperson;
  
select name
  from salesperson
 where age < 30;
 
select city,name
  from customer
 where city like '%s';
 
  select count(DISTINCT custname)
    from orders;
    
  select salesperson, COUNT(*)
    from orders
group by salesperson;

select name,age
  from salesperson
 where name in ( select salesperson
                   from orders 
                  where custname in (select name
                                       from customer
                                      where city = 'LA'));  
 
select t2.name,t2.age
  from orders t1, salesperson t2, customer t3
 where t1.salesperson = t2.name and t1.custname = t3.name
   and t3.city = 'LA';
  
  select salesperson
    from orders
group by salesperson
  having count(*) >= 2;
  
update salesperson set salary = 45000 where name = 'TOM';
select * from salesperson;
