drop table department;
drop table employee;
drop table project;
drop table works;

--1)
--department 테이블 생성
create table department(
  deptno    number(2),
  deptname  varchar2(20),
  manager   number(4)
);
--department 기본키 deptno
alter table department add constraint department_deptno_pk primary key (deptno);
--deptname은 not null
alter table department modify deptname constraint department_deptname_nn not null;
alter table department add constraint department_manager_fk foreign key (manager)
references employee (empno);

--employee 테이블 생성
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
--empno은 기본키
alter table employee add constraint employee_empno_pk primary key (empno);
--name은 not null
alter table employee modify name constraint employee_name_nn not null;
--deptno는 외래키
alter table employee add constraint employee_deptno_fk foreign key (deptno)
references department (deptno);
--employee.sex는 남 or 여 값만 저장 가능
alter table employee add constraint employee_sex_ch check (sex = '남' or sex = '여');


--project 테이블 생성
create table project(
  projno    number(3),
  projname  varchar2(20),
  deptno    number(2)
);
--projno는 기본키
alter table project add constraint project_projno_pk primary key (projno);
--projname은 not null
alter table project modify projname constraint project_projname_nn not null;
--deptno는 외래키
alter table project add constraint project_deptno_fk foreign key (deptno)
references department (deptno);

--works 테이블 생성
create table works(
  empno   number(4),
  projno  number(3),
  hoursworked number(3)
);
--empno,projno은 기본키
alter table works add constraint works_combo_pk primary key (empno,projno);
--empno는 외래키
alter table works add constraint works_empno_fk foreign key (empno)
references employee (empno);
--projno는 외래키
alter table works add constraint works_projno_fk foreign key (projno)
references project (projno);
--howrsworked는 양수값만
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
--샘플 데이터 삽입 department
insert into department values (10,'전산팀',1001);
insert into department values (20,'회계팀',1004);
insert into department values (30,'영업팀',1007);
insert into department values (40,'총무팀',1011);
insert into department values (50,'인사팀',1013);

--update department
--  set manager = (select empno
--                   from employee
--                  where position = '팀장'
--                    and employee.deptno = department.deptno);
--샘플 데이터 삽입 employee
insert into employee values (1001,'홍길동1','010-111-1001','울산1','남','팀장',7000000,10);
insert into employee values (1002,'홍길동2','010-111-1002','울산2','남','팀원1',4000000,10);
insert into employee values (1003,'홍길동3','010-111-1003','울산3','남','팀원2',3000000,10);
insert into employee values (1004,'홍길동4','010-111-1004','부산1','여','팀장',6000000,20);
insert into employee values (1005,'홍길동5','010-111-1005','부산2','남','팀원1',3500000,20);
insert into employee values (1006,'홍길동6','010-111-1006','부산3','남','팀원2',2500000,20);
insert into employee values (1007,'홍길동7','010-111-1007','서울1','남','팀장',5000000,30);
insert into employee values (1008,'홍길동8','010-111-1008','서울2','남','팀원1',4000000,30);
insert into employee values (1009,'홍길동9','010-111-1009','서울3','남','팀원2',3000000,30);
insert into employee (empno,name,address,sex,position,salary,deptno) values (1010,'홍길동10','서울4','남','팀원3',2000000,30);
insert into employee values (1011,'홍길동11','010-111-1011','대구1','여','팀장',5500000,40);
insert into employee values (1012,'홍길동12','010-111-1012','대구2','남','팀원1',2000000,40);
insert into employee values (1013,'홍길동13','010-111-1013','제주1','남','팀장',6500000,50);
insert into employee values (1014,'홍길동14','010-111-1014','제주2','남','팀원1',3500000,50);
--샘플 데이터 삽입 project
insert into project values (101,'빅데이터구축',10);
insert into project values (102,'IFRS',20);
insert into project values (103,'마케팅',30);
--샘플 데이터 삽입 works
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
  select name "이름",phoneno "연락처",address "주소"
    from employee
   where sex = '여'; 

--4)
update employee set salary = salary * 1.1 
 where empno in (select manager
                   from department);
commit;
select * from employee where position = '팀장';
--5)
  select substr(name,1,1) "성", count(*) "인원 수"
    from employee
group by substr(name,1,1) ;

--6)
  select t1.name "이름",
         nvl2 (phoneno,substr(phoneno,1,8) || '**' || substr(phoneno,11,12),'연락처없음') "연락처" ,t1.address "주소"
    from employee t1, department t2
   where t1.deptno = t2.deptno
     and t2.deptname = '영업팀'; 

--7)
  select count(*) "홍길동7 팀장 부서에서 일하는 사원의 수" 
    from employee
   where deptno in (select deptno
                      from employee
                     where name = '홍길동7'); 

--8)
  select name "프로젝트에 참여하지 않은 사원의 이름"
    from employee t1, project t2
   where t1.deptno = t2.deptno(+)
     and t2.deptno is null;
     
--9)
  select rownum "순위",t.*
    from (select *
            from employee
        order by salary desc) t
   where rownum <= 3;      
   
--10)
  select t3.deptname "부서이름",t2.name "사원이름",t1.hoursworked "일한 시간 수"
    from works t1, employee t2, department t3
   where t1.empno = t2.empno and t2.deptno = t3.deptno
order by t3.deptname asc, t2.name asc;

--11)
  select t2.projno "프로젝트 번호",t2.projname "프로젝트명", count(*) "사원의 수"
    from employee t1, project t2
   where t1.deptno = t2.deptno
group by t2.projno,t2.projname
  having count(*) >= 2;
      
--12)
select t2.deptname "부서명", t1.name "사원명"
  from employee t1, department t2
 where t1.deptno = t2.deptno 
   and t1.deptno in (select deptno
                       from employee
                   group by deptno 
                     having count(*) >= 3);
          
--13)
  
--14)
create view vw_project (name,projname,hoursworked)
as select t2.name "사원명", t3.projname "프로젝트명", t1.hoursworked "참여시간"
     from works t1, employee t2, project t3
    where t1.empno = t2.empno and t1.projno = t3.projno;
    
select * from vw_project;    
--15)
  select t1.name "빅데이터구축 프로젝트에 참여하는 사원의 이름"
    from employee t1
   where exists (select name
                   from project t2
                  where t1.deptno = t2.deptno
                    and projname = '빅데이터구축'); 
  
--16)
create index ix_employee2 on employee (name,phoneno);

select index_name, column_name
  from user_ind_columns
 where table_name = 'EMPLOYEE'; 
  
--17)

--18)


