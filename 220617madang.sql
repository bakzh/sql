<<<<<<< HEAD
--8-1)
exec insertcusromer (6, '홍길동', '울산 울주군', '010-6666-6666');

--8-2)
exec bookinsertofupdate (1, '축구의 역사', '굿스포츠', 8000); 

=======
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--9-1)
set serveroutput on;
exec exce9_1;

--9-2)
set serveroutput on;
<<<<<<< HEAD
exec exce9_2;
=======
exec exce9_2;

--9-3)
create or replace procedure exce9_3
as
  cursor c1 is select t1.publisher, t1.bookname, t1.price
                  from book t1
                 where t1.price > (select avg(price)
                                     from book 
                                    where publisher = t1.publisher)
              order by t1.publisher, t1.bookname, t1.price;
  lv_publisher   book.publisher%type;
  lv_bookname    book.bookname%type;
  lv_price       book.price%type;
begin
  open c1;
  loop
    fetch c1 into lv_publisher,lv_bookname,lv_price;
    exit when c1%notfound;

    dbms_output.put_line('출판사 : ' || lv_publisher || 
                         ' 책이름 : ' || lv_bookname || 
                         ' 가격 : ' || lv_price );
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


                     
                      
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
