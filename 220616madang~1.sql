--�͸� ���ν���
set serveroutput on;
declare
  averageval number;
begin
  averageprice(averageval);
  dbms_output.put_line ('å �� ���: ' || averageval);
end;

drop procedure averageprice;