create or replace procedure exce9_4

as
   cursor c1 is select t2.name, count(*), sum(saleprice)
                 from orders t1, customer t2
                where t1.custid = t2.custid
             group by t1.custid,t2.name;
  lv_name      customer.name%type;
  lv_cnt       number;
  lv_saleprice number;
             
begin
  open c1;
  loop
    fetch c1 into lv_name,lv_cnt,lv_saleprice;
    exit when c1%notfound;
    
    dbms_output.put_line('고객명 : ' || lv_name || ' 도서 수 : ' || lv_cnt || ' 총 구매액 : '|| lv_saleprice);
  end loop;  
  exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;

set serveroutput on;
exec exce9_4;

create or replace procedure exce9_4_2

as
  type order_info_t is record(
    name      customer.name%type,
    cnt       number,
    saleprice number);
  
  type orders_info_t is table of order_info_t
    index by binary_integer;
               
  lt_orders_info orders_info_t;             
begin

  select t2.name, count(*), sum(saleprice)
    bulk collect into lt_orders_info
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t1.custid,t2.name;

    for idx in 1..lt_orders_info.count loop
    dbms_output.put_line('고객명 : ' || lt_orders_info(idx).name ||
                         ' 도서 수 : ' || lt_orders_info(idx).cnt || 
                         ' 총 구매액 : '|| lt_orders_info(idx).saleprice);
    end loop;
  exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;

set serveroutput on;
exec exce9_4_2;


create or replace procedure exce9_5
  
as
  cursor c1 is select t1.name, sum(saleprice)
                 from customer t1, orders t2
                where t1.custid = t2.custid(+)
             group by t1.name; 
  lv_name       customer.name%type;
  lv_saleprice  orders.saleprice%type;
begin
  open c1;
  loop
    fetch c1 into lv_name,lv_saleprice;
    exit when c1%notfound;
  if lv_saleprice != 0 then
    dbms_output.put_line('고객명 : ' || lv_name || ' 주문 총액 : ' || lv_saleprice);
  else
        dbms_output.put_line('고객명 : ' || lv_name);
  end if;
  end loop;
 exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));

end;

set serveroutput on;
exec exce9_5;



