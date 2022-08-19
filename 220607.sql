select * from book;     --모든 컬럼
select bookname from book;      --특정컬럼
select bookname,price from book;    --특정컬럼

select * from customer;

select * from orders;

/* 도서 이름에 축구를 포함한 레코드 검색*/
select * from book where bookname like '%축구%';
select * from book where bookname like '%역사';
select * from book where bookname like '골프%';

/* 특정출판에 해당하는 레코드 검색*/
select * from book where publisher = '굿스포츠';

/* 도서 가격이 얼마 이상, 이하 하는 도서*/
select * from book where price = 7000;
select * from book where price >= 7000;
select * from book where price <= 7000;
select * from book where price != 7000;
select * from book where price <> 7000;

/* 도서 가격 범위 조회*/
select * from book where price >= 7000 and price <= 10000;
select * from book where price between 7000 and 10000;

select * from book where not(price = 7000 or price = 8000);
select * from book where price != 7000 and price != 8000;

select sum(price) from book where publisher = '굿스포츠';

select name as "이 름" ,phone "전화번호"
from customer
where name = '김연아';

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
where not (publisher = '굿스포츠' or publisher = '대한미디어');

select *
from book
where publisher not in ('굿스포츠','대한미디어');

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
where bookname like '_구%';


select *
from book
where bookname like '골프' || ' 바이블';

select *
from book
where bookname like '__의%';

select *
from book 
where bookname like '%축구%' and price >= 20000;

select *
from book
where publisher = '굿스포츠' or publisher = '대한미디어';

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

select sum(saleprice) as "총 매출"
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
        count(*)as "도서수량", 
        sum(saleprice) as "총액"
    from orders
   where saleprice > 10000  --속성(컬럼) 필터링
group by custid
having count(*)  >= 2       --집계함수로 필터링
order by custid desc;       --정렬은 마지막!

select * from orders;

select custid,count(*) as "도서수량"
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;

insert into book(bookid, bookname, publisher, price)
values ( 11, '스포츠 의학', '한솔의학서적', 90000);

select * from book;
rollback; --임시 저장을 취소
commit;   --데이터베이스에 최종반영

insert into book(bookid, bookname, publisher)
values ( 14, '스포츠 의학', '한솔의학서적');

insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

/* inset into 컬럼리스트 생략 가능 - 모든 컬럼에 값으 대입할때*/
insert into book 
values (15,'데이터베이스','한빛',80000);
select * from book;

rollback;

select * from customer;
update customer 
    set address = '대한민국 부산' 
where custid = 5;

delete from customer 
    where custid = 5;
select * from customer;
rollback;
commit;

