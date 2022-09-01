select phone from customer where name = '김연아';

select bookname, price from book;
select price,bookname from book;

select bookid, bookname, publisher, price from book;
select * from book;

select publisher from book;
select DISTINCT publisher from book;

select * from book where price < 20000;

select * from book where price between 10000 and 20000;
select * from book where price >= 10000 and price <= 20000;

select * from book where publisher in('굿스포츠', '대한미디어');
select * from book where publisher not in ('굿스포츠', '대한미디어');

select bookname, publisher from book where bookname like '%축구의 역사%';
select bookname, publisher from book where bookname like '%축구%';

select * from book where bookname like '_구%';

select * from book where bookname like '%축구%' and price >= 20000;
select * from book where publisher = '굿스포츠' or publisher = '대한미디어';

select * from book order by bookname;

select * from book order by price, bookname;

select * from book order by price desc, bookname asc;

select sum(saleprice) from orders;
select sum(saleprice) as "총 매출" from orders;

select sum(saleprice) as "총 매출" from orders where custid = 2;
select sum(saleprice) as "total", avg(saleprice) as average, min(saleprice) as minimun, max(saleprice) as maximum from orders;

select count(*) from orders;

select custid, count(*) as "도서수량", sum(saleprice) as "총액" from orders group by custid;

select custid, count(*) as "도서수량" from orders where saleprice >= 8000 group by custid having count(*) >= 2;

insert into book(bookid, bookname, publisher, price) values (11, '스포츠 의학', '한솔의학서적', 90000);
insert into book(bookid, bookname, publisher) values (14, '스포츠 의학', '한솔의학서적');
select * from book;
commit;

insert into book(bookid, bookname, price, publisher) select bookid, bookname, price, publisher from imported_book;
rollback;

update customer set address = '대한민국 부산' where custid = 5;
commit;

select * from customer;

delete from customer;

delete from customer where custid = 5;
rollback;
commit;