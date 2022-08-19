  select * 
    from book;
    
  select * 
    from book
   where rownum <= 5;
   
  select *
    from book
   where rownum <= 5
order by price;

  select *
    from (select * 
            from book
        order by price) b        
   where rownum <= 5; 
 
  select rownum, b.*
    from (select * 
            from book
           where rownum <= 5) b        
order by price; 

select rownum,c.* 
from (
       select rownum, b.*
        from (select * from book where rownum <= 5) b        
    order by price
    )c; 
 
  select rownum, b.*
    from (select * 
            from book
           where rownum <=5 
        order by price) b;        
   
  select t1.custid, sum(saleprice) 
    from orders t1
group by t1.custid; 

  select t1.custid, t2.name, sum(saleprice) 
    from orders t1, customer t2
   where t1.custid = t2.custid 
group by t1.custid, t2.name;

select rownum || '��' "���� �� �Ǹż���",t1.*
  from(
        select t1.custid "����ȣ", 
                (select substr (name,1,1) || '**' 
                   from customer t2  
                  where t2.custid = t1.custid) "����"
                ,to_char(round(sum(saleprice),-4),'999,999')||'��' "�ѱ��ž�"
          from orders t1 
      group by t1.custid
        having sum(t1.saleprice) > (select avg(saleprice)
                                      from orders)
      order by sum(saleprice) desc) t1
 where rownum <= 2
order by rownum desc;

--�÷��߰�   
  alter table orders add bookname varchar(40);
  select * from orders;
--���̺� ���� ��ȸ
  desc orders;
update orders 
   set bookname = (select bookname
                     from book
                    where book.bookid = orders.bookid);
  commit;
--�÷�����
  alter table orders drop column bookname;      
  
  select t1.name, sum(t2.saleprice)
    from customer t1, orders t2
   where t1.custid = t2.custid
     and t1.custid <= 2
group by t1.name;

  select od.custid, (select address
                      from customer cs
                     where cs.custid = od.custid) "address",
                           sum(saleprice) "total"
    from orders od
group by od.custid;
  
  select cs.name, s
    from (select custid, avg(saleprice) s
            from orders
        group by custid)od, customer cs
   where cs.custid = od.custid;     
  
  select sum(od.saleprice) "total"
    from orders od
   where exists (select *
                   from customer cs
                  where custid <= 3 and cs.custid = od.custid); 
  
  select *
    from book
   where bookname like '%�౸%'; 
   
  create view vw_book as
      select *
    from book
   where bookname like '%�౸%'; 
   
  select v1.publisher, count(*)
    from vw_book v1
group by v1.publisher;
     
create view vw_sales_info as
  select t1.orderid, t1.saleprice, t1.orderdate,
         t2.custid, t2.name, t2.address, t2.phone,
         t3.bookid, t3.bookname, t3.publisher, t3.price
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid
     and t1.bookid = t3.bookid;
     
  select v1.name "����", sum(v1.saleprice) "���Ǹž�"
    from vw_sales_info v1
group by v1.name
order by sum(v1.saleprice) desc;

  select v1.publisher "���ǻ�", sum(v1.saleprice) "���Ǹž�"
    from vw_sales_info v1
group by v1.publisher
order by sum(v1.saleprice) desc;
  
  create view vw_customer
  as select *
       from customer
      where address like '%���ѹα�%'; 
  
  create or replace view vw_customer 
   as select custid "����ȣ",name "�̸�",address "�ּ�"
       from customer
      where address like '%����%'; 
  
  select * 
    from vw_customer;
  
  drop view vw_customer;
  
create view highorders 
as select t3.bookid "������ȣ", t3.bookname "�����̸�", t2.name "���̸�",
          t3.publisher "���ǻ�", t1.saleprice "�ǸŰ���"
     from orders t1, customer t2, book t3
    where t1.custid = t2.custid and t1.bookid = t3.bookid
      and t1.saleprice >= 20000; 
--���̸� ����
--rename highoders to highorders;

  select "�����̸�","���̸�"
    from highorders;
    
  create or replace view highorders 
as select t3.bookid "������ȣ", t3.bookname "�����̸�", t2.name "���̸�",
          t3.publisher "���ǻ�"
     from orders t1, customer t2, book t3
    where t1.custid = t2.custid and t1.bookid = t3.bookid
      and t1.saleprice >= 20000; 
  
create index ix_book on book(bookname);  
create index ix_book2 on book(publisher,price);  
drop index ix_book2;
select *
  from book
 where publisher = '���ѹ̵��' and price >= 30000; 

--1)bookid ũ�� ���� 2 -> 4 
alter table book modify bookid number(4); 
--2)book���̺� ���� ������ ���� 9999
declare 
begin
  for i in 11..9999 loop
    insert into book values(i, '�����ͺ��̽�'||i, '���ǻ�'||i, i); 
  end loop; 
end;
--3)bookid ���̺� ���ڵ� �� Ȯ��
select count(*) from book;
--4)�ε��� ���� ��ȸ f6
select *
  from book
 where publisher = '���ѹ̵��' and price >= 30000; 
--5)�ε��� ����
create index ix_book2 on book(publisher,price); 
--6)�ε��� ���� �� ��ȸ
select *
  from book
 where publisher = '���ѹ̵��' and price >= 30000; 

alter index ix_book2 rebuild;

delete from book where bookid > 10;

select name 
  from customer
 where name like '�ڼ���'; 
 
create index ix_customer on customer (name);
drop index ix_customer;


select name 
  from customer
 where custid = 5; 