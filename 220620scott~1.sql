DECLARE
	TYPE  ename_table_type IS TABLE OF emp.ename%TYPE
		INDEX BY BINARY_INTEGER;
	TYPE  job_table_type IS TABLE OF emp.job%TYPE
		INDEX BY BINARY_INTEGER;
	ename_table	ename_table_type;
	job_table	job_table_type;
	i		BINARY_INTEGER := 0;
BEGIN
	FOR  k IN (SELECT ename,job FROM emp) LOOP
		i := i + 1;
		ename_table(i) := k.ename;
		job_table(i) := k.job;
	END LOOP;
	FOR j IN 1..i LOOP
		DBMS_OUTPUT.PUT_LINE(RPAD(ename_table(j),12) ||
			RPAD(job_table(j),9));
	END LOOP;

END;