--������ ����
drop sequence emp_audit_row_no_seq;
create sequence emp_audit_row_no_seq
  start with 1
  increment by 1
  minvalue 1
<<<<<<< HEAD
  maxvalue 99999999
=======
  maxvalue 9999999999
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  nocycle
  nocache;
--���̺����
drop table emp_audit_row;
create table emp_audit_row(
  no          number(10),   --�⺻Ű
  uname       varchar2(20), --���̺� ������ �õ��� ������̸�
  event_type  varchar2(10), --�۾�����
  udate       date default sysdate,     --�۾��ð�
  empno       number(4), --�����ȣ
  old_sal     number(7,2),  --���� �޿�
  new_sal     number(7,2)   --���ŵ� �޿�
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
<<<<<<< HEAD
drop procedure exercise_1;
--322-1 EMP TABLE�� �̸�,���,�޿�,�μ���ȣ�� ���޹޾� ����ϴ� PROCEDURE�� �ۼ��Ͽ���.
create procedure exercise_1(
  p_empno   in emp.empno%type,
  p_ename   in emp.ename%type,
=======
  
--322-1  
create procedure exercise_1(
  p_ename   in emp.ename%type,
  p_empno   in emp.empno%type,
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  p_sal     in emp.sal%type,
  p_deptno  in emp.deptno%type
)
as

begin
<<<<<<< HEAD
  insert into emp(empno, ename, sal, deptno)
    values ( p_empno, p_ename, p_sal, p_deptno);
=======
  insert into emp (empno,ename,sal,deptno) 
    values (p_empno,p_ename,p_sal,p_deptno);
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  exception
    when others then
      dbms_output.put_line('��Ÿ�����߻�');     
end;

execute exercise_1(8000,'gildong',5000,10);
select * from emp;

<<<<<<< HEAD
--322-2 �����ȣ�� �Է¹޾� �޿��� �����ϴ� PROCEDURE�� �ۼ��Ͽ���.
=======
--322-2
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
create or replace procedure exercise_2(
  p_empno  in emp.empno%type,
  p_sal    in emp.sal%type
)
as
<<<<<<< HEAD
  
begin
  update emp
     set sal = p_sal
   where empno = p_empno; 
=======

begin
  update emp
     set sal = p_sal
   where empno = p_empno;
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  exception
    when others then
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLCODE || '-' || SQLERRM);
end;

exec exercise_2(8000,6000);
select * from emp where empno = 8000;
  
<<<<<<< HEAD
--322-3 �ְ��� ������ �޴� ����� ����� ���Ͽ� ����ϴ� PROCEDURE�� �ۼ��Ͽ���. 
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
  dbms_output.put_line('�ְ��� ������ �޴� �����ȣ : ' || la_empnos(idx));
  end loop;
=======
--322-3
create or replace procedure exercise_3
as
  type arry_empno_t is table of emp.empno%type
    index by binary_integer;
  la_empnos  arry_empno_t;
begin
  select empno bulk collect into la_empnos
    from emp
   where sal = (select max(sal) 
                  from emp);

  for idx in 1..la_empnos.count loop                    
  dbms_output.put_line('�ְ��� ������ �޴� �����ȣ : ' || la_empnos(idx));     
  end loop;
  
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  exception
    when others then
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLCODE || '-' || SQLERRM);
end;
set serveroutput on; 
exec exercise_3; 
 

<<<<<<< HEAD
--322-4 �̸��� �Է¹޾� �μ����� ���Ͽ� ����ϴ� PROCEDURE�� �ۼ��Ͽ���.
create or replace procedure exercise_4(
  p_ename  in emp.ename%type
)as
  lv_dname  dept.dname%type;
begin
  select t2.dname into lv_dname
    from emp t1,dept t2
=======
--322-4 
create or replace procedure exercise_4(
  p_ename  in emp.ename%type
)as
  lv_dname dept.dname%type;
begin
  select t2.dname into lv_dname
    from emp t1, dept t2
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
   where t1.deptno = t2.deptno
     and t1.ename = p_ename;
  dbms_output.put_line(p_ename || '���� �μ��� ' || lv_dname || '�Դϴ�');   
  exception
    when others then
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLCODE || '-' || SQLERRM);
end;

<<<<<<< HEAD
set serveroutput on; 
=======
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
exec exercise_4('gildong');


--322-5
create or replace function exercise_5(
<<<<<<< HEAD
  p_deptno in  emp.deptno%type
=======
  p_deptno  in  emp.deptno%type
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
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
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLCODE || '-' || SQLERRM);
end;

var g_max_sal number;
<<<<<<< HEAD
execute :g_max_sal := exercise_5(10);
=======
execute :g_max_sal := exercise_5(20);
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
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
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLCODE || '-' || SQLERRM);
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
  dbms_output.put_line('�μ��� �޿� �Ѿ� �ٽ� ���Ǿ����ϴ�');  
  exception
    when others then
      dbms_output.put_line ('��Ÿ���� �߻� : ' || SQLERRM(SQLCODE));
END;

select * from emp;
select * from emp_sal_tot;
update emp
   set sal = 8000
 where empno = 8000;  

delete from emp where empno = 8000;
<<<<<<< HEAD
insert into emp values (8000,'gildong','MANAGER',null,'20220621',5000,null,10);
=======
insert into emp values (8000,'gildong','MANAGER',null,'20220621',5000,null,10);
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
