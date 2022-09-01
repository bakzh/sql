-- 1-(1)번 도서번호가 1인 도서의 이름
select bookname from book where bookid = 1;

-- 1-(2)번 가격이 20.000원 이상인 도서의 이름
select bookname from book where price >= 20000;

-- 1-(3)번 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) as "박지성의 총 구매액" from orders where custid = 1;

-- 1-(4)번 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select count(*) as "박지성이 구매한 도서의 수"  from orders where custid = 1;


-- 2-(1)번 마당서점의 도서의 총 개수
select count(*) as "도서의 총 개수" from book;

-- 2-(2)번 마당서점에 도서를 출고하는 출판사의 총 개수
select count(DISTINCT publisher) as "출판사 총 개수" from book;

-- 2-(3)번 모든 고객의 이름,주소
select name as "이름", address as "주소" from customer;

-- 2-(4)번 2014년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호
select orderid from orders where orderdate between '20/7/4' and '20/7/7';
select orderid from orders where orderdate >= '20/7/4' and orderdate <= '20/7/7';

-- 2-(5)번 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid from orders where orderdate not between '20/7/4' and '20/7/7';
select orderid from orders where not(orderdate >= '20/7/4' and orderdate <= '20/7/7');


-- 2-(6)번 성이 '김'씨인 고객의 이름과 주소
select name as "이름",address as "주소" from customer where name like '김%';

-- 2-(7)번 성이'김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name as "이름",address as "주소" from customer where name like '김%아';

desc book;
-- 2-(1)번 새로운 도서('스포츠 세계','대한미디어',10000원)이 마당서점에 입고되었다
insert into book(bookname, publisher, price) values ('스포츠 세계', '대한미디어', 10000);
--기본키 bookid에 null을 삽입 불가능, bookid는 필수요소 그리고 유니크해야함

-- 2-(2)번 '삼성당'에서 출판한 도서를 삭제해야 한다
delete from book where publisher = '삼성당';
rollback;
commit;
select * from book;

-- 2-(3)번 '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자
delete from book where publisher = '이상미디어';
delete from orders where bookid in (7,8);
select * from book;
commit;
select * from orders;
--orders에서 book자식 레코드 발견

-- 2-(4)번 출판사 '대한미디어'가 '대한출판사'로 이름을 바꾸었다
update book set publisher = '대한출판사' where publisher = '대한미디어';
rollback;
select * from book;

select * from book;
select * from customer;
select * from orders;









