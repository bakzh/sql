select phone from customer where name = '�迬��';

select bookname, price from book;
select price,bookname from book;

select bookid, bookname, publisher, price from book;
select * from book;

select publisher from book;
select DISTINCT publisher from book;

select * from book where price < 20000;

select * from book where price between 10000 and 20000;
select * from book where price >= 10000 and price <= 20000;

select * from book where publisher in('�½�����', '���ѹ̵��');
select * from book where publisher not in ('�½�����', '���ѹ̵��');

select bookname, publisher from book where bookname like '%�౸�� ����%';
select bookname, publisher from book where bookname like '%�౸%';

select * from book where bookname like '_��%';

select * from book where bookname like '%�౸%' and price >= 20000;
select * from book where publisher = '�½�����' or publisher = '���ѹ̵��';

select * from book order by bookname;

select * from book order by price, bookname;

select * from book order by price desc, bookname asc;

select sum(saleprice) from orders;
select sum(saleprice) as "�� ����" from orders;

select sum(saleprice) as "�� ����" from orders where custid = 2;
select sum(saleprice) as "total", avg(saleprice) as average, min(saleprice) as minimun, max(saleprice) as maximum from orders;

select count(*) from orders;

select custid, count(*) as "��������", sum(saleprice) as "�Ѿ�" from orders group by custid;

select custid, count(*) as "��������" from orders where saleprice >= 8000 group by custid having count(*) >= 2;

insert into book(bookid, bookname, publisher, price) values (11, '������ ����', '�Ѽ����м���', 90000);
insert into book(bookid, bookname, publisher) values (14, '������ ����', '�Ѽ����м���');
select * from book;
commit;

insert into book(bookid, bookname, price, publisher) select bookid, bookname, price, publisher from imported_book;
rollback;

update customer set address = '���ѹα� �λ�' where custid = 5;
commit;

select * from customer;

delete from customer;

delete from customer where custid = 5;
rollback;
commit;