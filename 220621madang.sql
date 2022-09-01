create or replace procedure exce9_3
as
  cursor c1 is select t1.publisher, t1.bookname, t1.price
                 from book t1
                where t1.price > (select avg(price)
                                    from book
                                   where publisher = t1.publisher) 
             order by t1.publisher, t1.bookname, t1.price;
  lv_publisher    book.publisher%type;
  lv_bookname     book.bookname%type;
  lv_price        book.price%type;
begin
  open c1;
  loop
    fetch c1 into lv_publisher, lv_bookname, lv_price;
    exit when c1%notfound;
    
    dbms_output.put_line('출판사 : ' || lv_publisher || 
                         ' 책이름 : ' || lv_bookname ||
                         ' 가격 : ' || lv_price);
  end loop;
  exception
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;

set SERVEROUTPUT on;
exec exce9_3;

create or replace procedure exce9_3_2
as
  type book_info_t is record(
    publisher   book.publisher%type,
    bookname    book.bookname%type,
    price       book.price%type);  
    
  type books_info_t is table of book_info_t
    index by binary_integer;
    
  lt_books_info   books_info_t;  
  
begin
  select t1.publisher, t1.bookname, t1.price
    bulk collect into lt_books_info
    from book t1
   where t1.price > (select avg(price)
                       from book 
                      where publisher = t1.publisher)
order by t1.publisher, t1.bookname, t1.price;

    for idx in 1..lt_books_info.count loop
    dbms_output.put_line('출판사 : ' || lt_books_info(idx).publisher || 
                         ' 책이름 : ' || lt_books_info(idx).bookname || 
                         ' 가격 : ' || lt_books_info(idx).price );
                         
    end loop;
  exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;

set SERVEROUTPUT on;
exec exce9_3_2;

create or replace procedure exce9_4

as
  cursor c1 is select t2.name, count(*), sum(saleprice) 
                 from orders t1, customer t2
                where t1.custid = t2.custid
             group by t1.custid, t2.name; 
  lv_name      customer.name%type;
  lv_cnt       number;
  lv_saleprice number; 
begin
  open c1;
  loop
    fetch c1 into lv_name, lv_cnt, lv_saleprice;
    exit when c1%notfound;
    
    dbms_output.put_line('고객명 : ' || lv_name || ' 도서 수 : ' || lv_cnt || ' 총 구매액 : ' || lv_saleprice);
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
                     
                      