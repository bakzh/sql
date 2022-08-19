--1
create or replace procedure test_1
as
  cursor c1 is   select name, address,phone
                   from customer
                  where address like '%대한민국%'; 
  v_name     customer.name%type;
  v_address  customer.address%type;
  v_phone    customer.phone%type;
begin
  open c1;
  loop
    fetch c1 into v_name,v_address,v_phone;
    exit when c1%notfound;
    
   dbms_output.put_line('고객명 : ' || v_name || ' 주소 : ' || v_address || ' 연락처 : ' || v_phone); 
   
   end loop;
   close c1;
   exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;
set serveroutput on;
exec test_1;

--2
create or replace procedure test_2(
  p_bookid    in  book.bookid%type,
  p_bookname  in  book.bookname%type,
  p_publisher in  book.publisher%type,
  p_price     in  book.price%type
)
as
  lv_cnt  number;
begin
  select count(*) into lv_cnt
    from book 
   where bookname like p_bookname
     and publisher like p_publisher;
      
  if lv_cnt != 0 then
    update book set price = p_price
     where bookname like p_bookname
       and publisher like p_publisher;
   else 
    insert into book (bookid,bookname,publisher,price)
      values (p_bookid,p_bookname,p_publisher,p_price);
   end if;
   
   exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;
--삽입
exec test_2 (11,'데이터베이스','한빛',20000); 
select * from book where bookid = 11;
--변경
exec test_2 (11,'데이터베이스','한빛',25000); 
select * from book where bookid = 11;
--3
create or replace function grade(
  p_custid  in  customer.custid%type
)return varchar2
as
  lv_saleprice   orders.saleprice%type;
  lr_grade       varchar2(6);
begin
  select sum(t1.saleprice) into lv_saleprice
    from orders t1, customer t2
   where t1.custid = t2.custid
     and t1.custid = p_custid;
   
  if lv_saleprice >= 30000 then
    lr_grade := '우수';   
  else
    lr_grade := '일반';
  end if;
  
  return lr_grade;
  
  exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));
end;

var g_grade varchar2;
execute :g_grade := grade(1);
print g_grade;


--4      
  select name "고객명",  grade(custid) "등급"
    from customer;

--5
  create or replace procedure test_5

as
   cursor c1 is select t2.name, count(*), sum(saleprice)
                 from orders t1, customer t2
                where t1.custid = t2.custid
             group by t1.custid,t2.name;
  lv_cnt       number;
  lv_saleprice number;
  lv_name      customer.name%type;
             
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
exec test_5;
--6
--시퀀스 생성 orders_log_no_seq

--테이블 생성 orders_log

--트리거 생성


--7
  select nvl(t2.publisher,'총계') "출판사", nvl(t3.name,'소계') "고객", sum(t1.saleprice) "판매액"
    from orders t1, book t2, customer t3
   where t1.bookid = t2.bookid
     and t1.custid = t3.custid
group by rollup(t2.publisher, t3.name);

--8
  select t2.publisher "출판사", sum(t1.saleprice) "총 판매금액",
         rank() OVER (ORDER BY sum(t1.saleprice) desc) "판매순위"
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by t2.publisher;


