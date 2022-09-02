create table department(
    deptno   number,
    deptname varchar2(20),
    manager  varchar2(20)
);
alter table department add constraint department_deptno_pk primary key(deptno);

create table employee(
    empno    number,
    name     varchar2(20),
    phoneno  varchar2(40),
    address  varchar2(20),
    sex      varchar2(20),
    position varchar2(20),
    deptno   number
); 
alter table employee add constraint employee_empno_pk primary key (empno);
alter table employee add constraint employee_deptno_fk foreign key (deptno)
references department (deptno);

create table project(
    projno   number,
    projname varchar2(20),
    deptno   number
);
alter table project add constraint project_projno_pk primary key (projno);
alter table project add constraint project_deptno_fk foreign key (deptno)
references department (deptno);

create table works(
    empno    number,
    projno   number,
    hours_worked    number
);
alter table works add constraint works_combo_pk primary key (empno,projno);


insert into department values(1,'it','홍길동');
insert into department values(2,'marketing','홍길순'); 

insert into employee values(1,'손흥민','010-1111-1111','춘천','남자','과장',1);
insert into employee values(2,'박지성','010-2222-2222','영국','남자','계장',1);
insert into employee values(3,'마동석','010-3333-3333','서울','남자','차장',1);
insert into employee values(4,'권나라','010-4444-4444','서울','여자','주임',2);


insert into project values(1,'skt',1);
insert into project values(2,'lg',2);

insert into works values(1,1,30);
insert into works values(2,1,25);
insert into works values(3,1,20);
insert into works values(4,2,15);

select * from employee;
select * from department;
select * from project;
select * from works;

select name
  from employee;
  
select name
  from employee
 where sex = '여자';
 
select manager
  from department;
  
  select t2.name, t2.address
    from department t1, employee t2
   where t1.deptno = t2.deptno
     and t1.deptname = 'it';
     
  select count(t2.name)
    from department t1, employee t2
   where t1.deptno = t2.deptno
     and t1.manager = '홍길동';  
     
  select t3.deptno, t2.name, t1.hours_worked
    from works t1, employee t2, department t3
   where t1.empno = t2.empno 
     and t2.deptno = t3.deptno
group by t3.deptno, t2.name, t1.hours_worked
order by t1.hours_worked;

  select t2.projno, t2.projname, count(*)
    from employee t1, project t2
   where t1.deptno = t2.deptno
group by t2.projno, t2.projname
  having count(*) >= 2;
  
  select t2.name,count(t1.deptno)
    from department t1, employee t2
   where t1.deptno = t2.deptno
group by t2.name;

