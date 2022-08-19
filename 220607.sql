select * from book;     --��� �÷�
select bookname from book;      --Ư���÷�
select bookname,price from book;    --Ư���÷�

select * from customer;

select * from orders;

/* ���� �̸��� �౸�� ������ ���ڵ� �˻�*/
select * from book where bookname like '%�౸%';
select * from book where bookname like '%����';
select * from book where bookname like '����%';

/* Ư�����ǿ� �ش��ϴ� ���ڵ� �˻�*/
select * from book where publisher = '�½�����';

/* ���� ������ �� �̻�, ���� �ϴ� ����*/
select * from book where price = 7000;
select * from book where price >= 7000;
select * from book where price <= 7000;
select * from book where price != 7000;
select * from book where price <> 7000;

/* ���� ���� ���� ��ȸ*/
select * from book where price >= 7000 and price <= 10000;
select * from book where price between 7000 and 10000;

select * from book where not(price = 7000 or price = 8000);
select * from book where price != 7000 and price != 8000;

select sum(price) from book where publisher = '�½�����';

select name as "�� ��" ,phone "��ȭ��ȣ"
from customer
where name = '�迬��';

select bookname, price 
from book;

select price,bookname 
from book;

select bookid, bookname, publisher, price
from book;

select *
from book;

select publisher
from book;

select count (distinct publisher)
from book;

select *
from book
where not (publisher = '�½�����' or publisher = '���ѹ̵��');

select *
from book
where publisher not in ('�½�����','���ѹ̵��');

select * from customer;

select name
from customer
where phone is null;

select * 
from book
where price < 20000;

select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

select *
from book
where bookname like '_��%';


select *
from book
where bookname like '����' || ' ���̺�';

select *
from book
where bookname like '__��%';

select *
from book 
where bookname like '%�౸%' and price >= 20000;

select *
from book
where publisher = '�½�����' or publisher = '���ѹ̵��';

select *
from book
order by price asc;

select *
from book
order by bookname desc;

select *
from book
order by price desc, bookname asc;

select *
from book
order by price, bookname;

select * 
from book
order by price desc, publisher asc;

select sum(saleprice) as "�� ����"
from orders;

select sum(saleprice)
from orders
where custid = 2;

select sum(saleprice) as total,
       avg(saleprice) as average, 
       min(saleprice) as minimun,
       max(saleprice) as maximum
from orders;

select count(*)
from orders
where custid = 2;

  select custid, 
        count(*)as "��������", 
        sum(saleprice) as "�Ѿ�"
    from orders
   where saleprice > 10000  --�Ӽ�(�÷�) ���͸�
group by custid
having count(*)  >= 2       --�����Լ��� ���͸�
order by custid desc;       --������ ������!

select * from orders;

select custid,count(*) as "��������"
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;

insert into book(bookid, bookname, publisher, price)
values ( 11, '������ ����', '�Ѽ����м���', 90000);

select * from book;
rollback; --�ӽ� ������ ���
commit;   --�����ͺ��̽��� �����ݿ�

insert into book(bookid, bookname, publisher)
values ( 14, '������ ����', '�Ѽ����м���');

insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

/* inset into �÷�����Ʈ ���� ���� - ��� �÷��� ���� �����Ҷ�*/
insert into book 
values (15,'�����ͺ��̽�','�Ѻ�',80000);
select * from book;

rollback;

select * from customer;
update customer 
    set address = '���ѹα� �λ�' 
where custid = 5;

delete from customer 
    where custid = 5;
select * from customer;
rollback;
commit;

