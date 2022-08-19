create or replace procedure insertbook(
  mybookid in number,
  mybookname in varchar2,
  mypublisher in varchar2,
  myprice in number)
as
begin
  insert into book(bookid,bookname,publisher,price)
  values (mybookid,mybookname,mypublisher,myprice);
end;

exec insertbook(13, '����������','������м���',25000);

select * from book;
delete from book where bookid > 10;
commit;

create or replace procedure BookInsertOrUpdate(
  mybookid number,
  mybookname varchar2,
  mypublisher varchar2,
  myprice int
)
as
  mycount number;
begin
  select count(*) into mycount from book
   where bookname like mybookname;
  if mycount != 0 then 
    update book set price = myprice
     where bookname like mybookname;
  else
    insert into book(bookid,bookname,publisher,price)
    values(mybookid,mybookname,mypublisher,myprice);
  end if;
end;

exec bookinsertorupdate (15,'������ ��ſ�','������м���',25000);
select * from book;
exec bookinsertorupdate (15,'������ ��ſ�','������м���',20000);
select * from book;

