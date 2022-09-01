--시퀀스 생성
drop sequence emp_audit_row_no_seq;
create sequence emp_audit_row_no_seq
  start with 1
  increment by 1
  minvalue 1
  maxvalue 99999999
  nocycle
  nocache;
--테이블생성
drop table emp_audit_row;
create table emp_audit_row(
  no          number(10),   --기본키
  uname       varchar2(20), --테이블 변경을 시도한 사용자이름
  event_type  varchar2(10), --작업구분
  udate       date default sysdate,     --작업시간
  empno       number(4), --사원번호
  old_sal     number(7,2),  --이전 급여
  new_sal     number(7,2)   --갱신된 급여
);

alter table emp_audit_row add constraint emp_audit_row_no_pk  primary key (no);


select * from emp;
insert into emp values (8000,'gildong','MANAGER',null,'20220621',5000,null,10);
select * from emp_audit_row;
update emp
   set sal = 6000
 where empno = 8000;
delete from emp where empno = 8000; 
rollback; 
select emp_audit_row_no_seq.currval
  from dual;
drop procedure exercise_1;
--322-1 EMP TABLE에 이름,사번,급여,부서번호를 전달받아 등록하는 PROCEDURE를 작성하여라.
create procedure exercise_1(
  p_empno   in emp.empno%type,
  p_ename   in emp.ename%type,
  p_sal     in emp.sal%type,
  p_deptno  in emp.deptno%type
)
as

begin
  insert into emp(empno, ename, sal, deptno)
    values ( p_empno, p_ename, p_sal, p_deptno);
  exception
    when others then
      dbms_output.put_line('기타오류발생');     
end;

execute exercise_1(8000,'gildong',5000,10);
select * from emp;

--322-2 사원번호를 입력받아 급여를 수정하는 PROCEDURE를 작성하여라.
create or replace procedure exercise_2(
  p_empno  in emp.empno%type,
  p_sal    in emp.sal%type
)
as
  
begin
  update emp
     set sal = p_sal
   where empno = p_empno; 
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLCODE || '-' || SQLERRM);
end;

exec exercise_2(8000,6000);
select * from emp where empno = 8000;
  
--322-3 최고의 월급을 받는 사원의 사번을 구하여 출력하는 PROCEDURE를 작성하여라. 
create or replace procedure exercise_3
as
  type array_empno_t is table of emp.empno%type
    index by binary_integer;
   la_empnos  array_empno_t;
begin
  select empno
    bulk collect into la_empnos
    from emp
   where sal = (select max(sal) 
                  from emp);
  for idx in 1..la_empnos.count loop
  dbms_output.put_line('최고의 월급을 받는 사원번호 : ' || la_empnos(idx));
  end loop;
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLCODE || '-' || SQLERRM);
end;
set serveroutput on; 
exec exercise_3; 
 

--322-4 이름을 입력받아 부서명을 구하여 출력하는 PROCEDURE를 작성하여라.
create or replace procedure exercise_4(
  p_ename  in emp.ename%type
)as
  lv_dname  dept.dname%type;
begin
  select t2.dname into lv_dname
    from emp t1,dept t2
   where t1.deptno = t2.deptno
     and t1.ename = p_ename;
  dbms_output.put_line(p_ename || '님의 부서는 ' || lv_dname || '입니다');   
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLCODE || '-' || SQLERRM);
end;

set serveroutput on; 
exec exercise_4('gildong');


--322-5
create or replace function exercise_5(
  p_deptno in  emp.deptno%type
)return emp.sal%type
as
  lv_max_sal  emp.sal%type; 
begin
  select max(sal) into lv_max_sal
    from emp
   where emp.deptno = p_deptno;
  
  return lv_max_sal; 
  
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLCODE || '-' || SQLERRM);
end;

var g_max_sal number;
execute :g_max_sal := exercise_5(10);
print g_max_sal;

create or replace procedure exercise_5_2(
  p_deptno  in  emp.deptno%type,
  r_sal out emp.sal%type
)
as
  
begin
  select max(sal) into r_sal
    from emp
   where emp.deptno = p_deptno;
  
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLCODE || '-' || SQLERRM);
end;
  
exec exercise_5_2(10,:g_max_sal);
print g_max_sal; 



--322-8  
drop table emp_sal_tot;
CREATE TABLE emp_sal_tot as
  SELECT deptno,SUM(sal) sal_tot
    FROM emp
GROUP BY deptno;

desc emp_sal_tot;
select * from emp_sal_tot;

--322-9
create or replace TRIGGER  emp_sal_tot_tr
after DELETE OR INSERT OR UPDATE ON EMP  
declare
BEGIN
  
  delete from emp_sal_tot;
  
  insert into emp_sal_tot
      select deptno,SUM(sal) sal_tot
        FROM emp
    GROUP BY deptno;
  dbms_output.put_line('부서별 급여 총액 다시 계산되었습니다');  
  exception
    when others then
      dbms_output.put_line ('기타오류 발생 : ' || SQLERRM(SQLCODE));
END;

select * from emp;
select * from emp_sal_tot;
update emp
   set sal = 8000
 where empno = 8000;  

delete from emp where empno = 8000;
insert into emp values (8000,'gildong','MANAGER',null,'20220621',5000,null,10);