declare
--사용자 레코드 타입 정의
--  type rec_book is record (
--    bookid    book.bookid%type,
--    bookname  book.bookname%type,
--    publisher book.publisher%type,
--    price     book.price%type
--);  
--    ls_book rec_book_t;
      ls_book book%rowtype;
begin
  select *
    into ls_book
    from book
   where bookname = '&p_bookname'; 

    dbms_output.put_line('도서번호 : '|| ls_book.bookid);
    dbms_output.put_line('도서명: '   || ls_book.bookname);
    dbms_output.put_line('출판사 : '  || ls_book.publisher);
    dbms_output.put_line('가격 : '    || ls_book.price);

  exception
    when no_data_found then
      dbms_output.put_line('찾고자하는 정보가 없습니다');
    when too_many_rows then
      dbms_output.put_line('2개 이상의 도서가 발견됩니다');
    when others then
      dbms_output.put_line('기타 예외가 발생되었습니다');
end;


--'1~10까지의 합 - for문'
declare
  lv_sum number(4) := 0;    --값을 주지 않으면 null
begin
  for i in 1..10 loop
    lv_sum := lv_sum + i;
  end loop;
  
  dbms_output.put_line('1~10까지의 합 = ' || lv_sum);
--exception
end;

--'1~10까지의 합 - while문'
declare
  lv_cnt number(2) := 1;
  lv_sum number(4) := 0;    --값을 주지 않으면 null
begin
  lv_cnt := 1;
  while (lv_cnt <= 10) loop
    lv_sum := lv_sum + lv_cnt;  
    lv_cnt := lv_cnt + 1;
  end loop;  
  dbms_output.put_line('1~10까지의 합 = ' || lv_sum);
--exception
end;


--구구단 2~9단까지
begin
  for i in 2..9 loop
    dbms_output.put_line(i || '단 출력');
    for j in 1..9 loop
      dbms_output.put_line(i || '*' || j || ' = ' || i*j);
    end loop;
    dbms_output.put_line('-----------');
  end loop;
end;


declare
  ls_book   book%rowtype;
  cursor c1 is select *
                 from book;
begin
  dbms_output.put_line(rpad('도서번호',10) || rpad('도서명',20) || rpad('출판사',10) || lpad('가격',10));
  
  open c1;
  loop
    fetch c1 into ls_book;
    exit when c1%notfound;
    dbms_output.put_line(rpad(ls_book.bookid,10) || 
                         rpad(ls_book.bookname,20) || 
                         rpad(ls_book.publisher,10) || 
                         lpad(ls_book.price,10));
  end loop;  
--  exception
end;


declare
  ls_book   book%rowtype;
  cursor c1 is select *
                 from book;
begin
  dbms_output.put_line(rpad('도서번호',10) || rpad('도서명',20) || rpad('출판사',10) || lpad('가격',10));
  
  for ls_book in c1
  loop
    dbms_output.put_line(rpad(ls_book.bookid,10) || 
                         rpad(ls_book.bookname,20) || 
                         rpad(ls_book.publisher,10) || 
                         lpad(ls_book.price,10));
  end loop;  
  
  
--  exception
end;


declare
  ls_book   book%rowtype;
  
begin
  dbms_output.put_line(rpad('도서번호',10) || rpad('도서명',20) || rpad('출판사',10) || lpad('가격',10));
  
  for ls_book in (select * from book)
  loop
    dbms_output.put_line(rpad(ls_book.bookid,10) || 
                         rpad(ls_book.bookname,20) || 
                         rpad(ls_book.publisher,10) || 
                         lpad(ls_book.price,10));
  end loop;  
    
--  exception
end;


CREATE OR REPLACE TRIGGER book_resourse
	BEFORE insert OR update OR delete ON book
declare
  --my_exception exception;  
BEGIN
	IF TO_CHAR(SYSDATE,'DY') IN ('월')
		OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))
			NOT BETWEEN 9 AND 18 THEN
		
    --에러코드 -20000~20999까지 임의로 지정 가능
    --에러메세지 개발자 임의로 지정
    raise_application_error(-20000,'작업할 수 없는 시간 입니다.');
    --raise_application_error(-20502,'작업할 수 없는 시간 입니다.');
--    raise my_exception;
	END IF;
  
END;

select to_char(sysdate,'dy')
  from dual;
  
insert into book values (23,'java','한빛',30000);
select * from book;