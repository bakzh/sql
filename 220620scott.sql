SET VERIFY OFF;
SET SERVEROUTPUT ON;
ACCEPT  p_name   PROMPT  ' 이    름: ';
DECLARE
	v_empno	emp.empno%TYPE;
	v_name	emp.ename%TYPE := UPPER('&p_name');
	v_sal	emp.sal%TYPE;
	v_job	emp.job%TYPE;	
  c_TMP const number := 10;  --상수
BEGIN
	SELECT empno,job,sal
		INTO v_empno,v_job,v_sal
		FROM emp
		WHERE ename = v_name;
	IF v_job IN ('MANAGER','ANALYST') THEN
		v_sal := v_sal * 1.5;
	ELSE
		v_sal := v_sal * 1.2;
	END IF;
	UPDATE emp
		SET sal = v_sal
		WHERE empno = v_empno;
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||'개의 행이 갱신되었습니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('갱신된 자료가 없습니다.');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 자료가 없습니다.');		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 동명 이인입니다.');		
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러가 발생 했습니다.');		
END;


select * from emp;



DROP SEQUENCE emp_row_seq;
CREATE SEQUENCE emp_row_seq
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;
DROP TABLE emp_row_tab;
CREATE TABLE emp_row_tab(
	e_id		NUMBER(6)
		CONSTRAINT emp_row_pk PRIMARY KEY,
	e_name		VARCHAR2(30),
	e_gubun		VARCHAR2(10),
	e_date		DATE);
CREATE OR REPLACE TRIGGER emp_row_aud
	AFTER insert OR update OR delete ON emp
	FOR EACH ROW
BEGIN
	IF INSERTING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'inserting',SYSDATE);
	ELSIF UPDATING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'updating',SYSDATE);
	ELSIF DELETING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'deleting',SYSDATE);
	END IF;
END;

select * from emp;
select * from emp_row_tab;


insert into emp values (8000,'GILDONG','CLERK',null,'20220101',5000,null,10);
update emp
   set sal = 6000
 where empno = 8000;
delete from emp where empno = 8000;

