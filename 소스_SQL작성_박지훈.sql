-- 1) 
  select name "이름", address "주소", phone "연락처"
    from customer;
-- 2)
  select *
    from customer
   where address like '%대한민국%';
-- 3)
  select name "이름" 
    from customer
   where phone is null;
-- 4)
  select count(distinct publisher) "출판사의 총 갯수"
    from book;
-- 5)
  select *
    from book
   where bookname like '%골프%'; 
-- 6)
  select count(*) "주문 건수", avg(saleprice) "평균 판매액", max(saleprice) "최대 판매액", min(saleprice) "최소 판매액", sum(saleprice) "총 판매액"
    from orders;
-- 7)
  select publisher "출판사", count(publisher) "도서 건수"
    from book
group by publisher
order by count(*) desc;
-- 8)
  select publisher "출판사", count(publisher) "도서 건수", max(price) "최고 가격", min(price) "최저 가격", sum(price)"도서 가격의 합"
    from book
group by publisher
order by publisher;
-- 9)
  select max(price) - min(price) "가장 비싼 도서와 가장 싼 도서의 가격차이"
    from book;
-- 10)
  select custid "고객번호", count(*) "구매 건수"
    from orders
group by custid
  having count(*) >= 2
order by count(*) desc;
-- 11)
  select orderid "주문 번호"
    from orders
   where orderdate not between '20/07/04' and '20/07/07';
-- 12)
  select orderdate "주문 일자", saleprice "매출액"
    from orders
group by orderdate, saleprice
order by saleprice desc;
-- 13)
  select orderdate "주문 일자"
    from orders
   where orderdate != '20/07/02'
group by orderdate, saleprice
  having saleprice > 20000
order by orderdate desc;
-- 14)
  select publisher "출판사"
    from book
group by publisher
  having count(*) >= 2;
-- 15)
insert into book (bookname, publisher, price)
     values ('데이터베이스', '한빛', 30000);
-- 16)
update book set publisher = '대한출판사' where publisher = '대한미디어';
commit;
select * from book;
-- 17)

-- 18)
update customer set address = '대한민국 울산' where name = '추신수';
commit;
select * from customer;
-- 19)
delete from customer where phone is null;
commit;
select * from customer; 
-- 20)
delete from customer where name = '박지성';