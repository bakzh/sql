--익명 프로시저
set serveroutput on;
declare
  averageval number;
begin
  averageprice(averageval);
  dbms_output.put_line ('책 값 평균: ' || averageval);
end;

drop procedure averageprice;