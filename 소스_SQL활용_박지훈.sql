drop table department;
drop table employee;
drop table project;
drop table works;

--1)
--department ���̺� ����
create table department(
  deptno    number(2),
  deptname  varchar2(20),
  manager   number(4)
);
--department �⺻Ű deptno
alter table department add constraint department_deptno_pk primary key (deptno);
--deptname�� not null
alter table department modify deptname constraint department_deptname_nn not null;
alter table department add constraint department_manager_fk foreign key (manager)
references employee (empno);

--employee ���̺� ����
create table employee(
  empno     number(4),
  name      varchar2(20),
  phoneno   varchar2(20),
  address   varchar2(20),
  sex       char(3),
  position  varchar2(20),
  salary    number(7),
  deptno    number(2)
);
--empno�� �⺻Ű
alter table employee add constraint employee_empno_pk primary key (empno);
--name�� not null
alter table employee modify name constraint employee_name_nn not null;
--deptno�� �ܷ�Ű
alter table employee add constraint employee_deptno_fk foreign key (deptno)
references department (deptno);
--employee.sex�� �� or �� ���� ���� ����
alter table employee add constraint employee_sex_ch check (sex = '��' or sex = '��');


--project ���̺� ����
create table project(
  projno    number(3),
  projname  varchar2(20),
  deptno    number(2)
);
--projno�� �⺻Ű
alter table project add constraint project_projno_pk primary key (projno);
--projname�� not null
alter table project modify projname constraint project_projname_nn not null;
--deptno�� �ܷ�Ű
alter table project add constraint project_deptno_fk foreign key (deptno)
references department (deptno);

--works ���̺� ����
create table works(
  empno   number(4),
  projno  number(3),
  hoursworked number(3)
);
--empno,projno�� �⺻Ű
alter table works add constraint works_combo_pk primary key (empno,projno);
--empno�� �ܷ�Ű
alter table works add constraint works_empno_fk foreign key (empno)
references employee (empno);
--projno�� �ܷ�Ű
alter table works add constraint works_projno_fk foreign key (projno)
references project (projno);
--howrsworked�� �������
alter table works add constraint works_hoursworked_ch check (hoursworked > 0);

desc department;
desc employee;
desc project;
desc works;

select constraint_name,constraint_type
  from user_constraints
 where table_name = 'EMPLOYEE';

select constraint_name,constraint_type
  from user_constraints
 where table_name = 'DEPARTMENT';

select constraint_name,constraint_type
  from user_constraints
 where table_name = 'PROJECT';

select constraint_name,constraint_type
  from user_constraints
 where table_name = 'WORKS'; 

--2)
--���� ������ ���� department
insert into department values (10,'������',1001);
insert into department values (20,'ȸ����',1004);
insert into department values (30,'������',1007);
insert into department values (40,'�ѹ���',1011);
insert into department values (50,'�λ���',1013);

--update department
--  set manager = (select empno
--                   from employee
--                  where position = '����'
--                    and employee.deptno = department.deptno);
--���� ������ ���� employee
insert into employee values (1001,'ȫ�浿1','010-111-1001','���1','��','����',7000000,10);
insert into employee values (1002,'ȫ�浿2','010-111-1002','���2','��','����1',4000000,10);
insert into employee values (1003,'ȫ�浿3','010-111-1003','���3','��','����2',3000000,10);
insert into employee values (1004,'ȫ�浿4','010-111-1004','�λ�1','��','����',6000000,20);
insert into employee values (1005,'ȫ�浿5','010-111-1005','�λ�2','��','����1',3500000,20);
insert into employee values (1006,'ȫ�浿6','010-111-1006','�λ�3','��','����2',2500000,20);
insert into employee values (1007,'ȫ�浿7','010-111-1007','����1','��','����',5000000,30);
insert into employee values (1008,'ȫ�浿8','010-111-1008','����2','��','����1',4000000,30);
insert into employee values (1009,'ȫ�浿9','010-111-1009','����3','��','����2',3000000,30);
insert into employee (empno,name,address,sex,position,salary,deptno) values (1010,'ȫ�浿10','����4','��','����3',2000000,30);
insert into employee values (1011,'ȫ�浿11','010-111-1011','�뱸1','��','����',5500000,40);
insert into employee values (1012,'ȫ�浿12','010-111-1012','�뱸2','��','����1',2000000,40);
insert into employee values (1013,'ȫ�浿13','010-111-1013','����1','��','����',6500000,50);
insert into employee values (1014,'ȫ�浿14','010-111-1014','����2','��','����1',3500000,50);
--���� ������ ���� project
insert into project values (101,'�����ͱ���',10);
insert into project values (102,'IFRS',20);
insert into project values (103,'������',30);
--���� ������ ���� works
insert into works values (1001,101,800);
insert into works values (1002,101,400);
insert into works values (1003,101,300);
insert into works values (1004,102,700);
insert into works values (1005,102,500);
insert into works values (1006,102,200);
insert into works values (1007,103,500);
insert into works values (1008,103,400);
insert into works values (1009,103,300);
insert into works values (1010,103,200);

commit;

select * from department;
select * from employee;
select * from project;
select * from works;

--3)
  select name "�̸�",phoneno "����ó",address "�ּ�"
    from employee
   where sex = '��'; 

--4)
update employee set salary = salary * 1.1 
 where empno in (select manager
                   from department);
commit;
select * from employee where position = '����';
--5)
  select substr(name,1,1) "��", count(*) "�ο� ��"
    from employee
group by substr(name,1,1) ;

--6)
  select t1.name "�̸�",
         nvl2 (phoneno,substr(phoneno,1,8) || '**' || substr(phoneno,11,12),'����ó����') "����ó" ,t1.address "�ּ�"
    from employee t1, department t2
   where t1.deptno = t2.deptno
     and t2.deptname = '������'; 

--7)
  select count(*) "ȫ�浿7 ���� �μ����� ���ϴ� ����� ��" 
    from employee
   where deptno in (select deptno
                      from employee
                     where name = 'ȫ�浿7'); 

--8)
  select name "������Ʈ�� �������� ���� ����� �̸�"
    from employee t1, project t2
   where t1.deptno = t2.deptno(+)
     and t2.deptno is null;
     
--9)
  select rownum "����",t.*
    from (select *
            from employee
        order by salary desc) t
   where rownum <= 3;      
   
--10)
  select t3.deptname "�μ��̸�",t2.name "����̸�",t1.hoursworked "���� �ð� ��"
    from works t1, employee t2, department t3
   where t1.empno = t2.empno and t2.deptno = t3.deptno
order by t3.deptname asc, t2.name asc;

--11)
  select t2.projno "������Ʈ ��ȣ",t2.projname "������Ʈ��", count(*) "����� ��"
    from employee t1, project t2
   where t1.deptno = t2.deptno
group by t2.projno,t2.projname
  having count(*) >= 2;
      
--12)
select t2.deptname "�μ���", t1.name "�����"
  from employee t1, department t2
 where t1.deptno = t2.deptno 
   and t1.deptno in (select deptno
                       from employee
                   group by deptno 
                     having count(*) >= 3);
          
--13)
  
--14)
create view vw_project (name,projname,hoursworked)
as select t2.name "�����", t3.projname "������Ʈ��", t1.hoursworked "�����ð�"
     from works t1, employee t2, project t3
    where t1.empno = t2.empno and t1.projno = t3.projno;
    
select * from vw_project;    
--15)
  select t1.name "�����ͱ��� ������Ʈ�� �����ϴ� ����� �̸�"
    from employee t1
   where exists (select name
                   from project t2
                  where t1.deptno = t2.deptno
                    and projname = '�����ͱ���'); 
  
--16)
create index ix_employee2 on employee (name,phoneno);

select index_name, column_name
  from user_ind_columns
 where table_name = 'EMPLOYEE'; 
  
--17)

--18)


