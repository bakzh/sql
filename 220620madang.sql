declare
--����� ���ڵ� Ÿ�� ����
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

    dbms_output.put_line('������ȣ : '|| ls_book.bookid);
    dbms_output.put_line('������: '   || ls_book.bookname);
    dbms_output.put_line('���ǻ� : '  || ls_book.publisher);
    dbms_output.put_line('���� : '    || ls_book.price);

  exception
    when no_data_found then
      dbms_output.put_line('ã�����ϴ� ������ �����ϴ�');
    when too_many_rows then
      dbms_output.put_line('2�� �̻��� ������ �߰ߵ˴ϴ�');
    when others then
      dbms_output.put_line('��Ÿ ���ܰ� �߻��Ǿ����ϴ�');
end;


--'1~10������ �� - for��'
declare
  lv_sum number(4) := 0;    --���� ���� ������ null
begin
  for i in 1..10 loop
    lv_sum := lv_sum + i;
  end loop;
  
  dbms_output.put_line('1~10������ �� = ' || lv_sum);
--exception
end;

--'1~10������ �� - while��'
declare
  lv_cnt number(2) := 1;
  lv_sum number(4) := 0;    --���� ���� ������ null
begin
  lv_cnt := 1;
  while (lv_cnt <= 10) loop
    lv_sum := lv_sum + lv_cnt;  
    lv_cnt := lv_cnt + 1;
  end loop;  
  dbms_output.put_line('1~10������ �� = ' || lv_sum);
--exception
end;


--������ 2~9�ܱ���
begin
  for i in 2..9 loop
    dbms_output.put_line(i || '�� ���');
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
  dbms_output.put_line(rpad('������ȣ',10) || rpad('������',20) || rpad('���ǻ�',10) || lpad('����',10));
  
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
  dbms_output.put_line(rpad('������ȣ',10) || rpad('������',20) || rpad('���ǻ�',10) || lpad('����',10));
  
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
  dbms_output.put_line(rpad('������ȣ',10) || rpad('������',20) || rpad('���ǻ�',10) || lpad('����',10));
  
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
	IF TO_CHAR(SYSDATE,'DY') IN ('��')
		OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))
			NOT BETWEEN 9 AND 18 THEN
		
    --�����ڵ� -20000~20999���� ���Ƿ� ���� ����
    --�����޼��� ������ ���Ƿ� ����
    raise_application_error(-20000,'�۾��� �� ���� �ð� �Դϴ�.');
    --raise_application_error(-20502,'�۾��� �� ���� �ð� �Դϴ�.');
--    raise my_exception;
	END IF;
  
END;

select to_char(sysdate,'dy')
  from dual;
  
insert into book values (23,'java','�Ѻ�',30000);
select * from book;