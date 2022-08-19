select customer.*, orders.*
  from customer, orders;
  
select customer.name, orders.orderdate
  from customer, orders;
  
select t1.name, t2.orderdate
  from customer t1, orders t2;
  
select *
  from customer t1, orders t2
 where t1.custid = t2.custid;
 
select distinct t1.name
  from customer t1, orders t2
 where t1.custid = t2.custid;
 
--주문이력이 2건 이상인 고객명을 주문건수 내림차순으로 보이시오 
  select distinct t1.name "고객명", count(*) "주문 건수"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
  having count(*) >= 2
order by count(*) desc;
 
--고객별 매출액을 산출하고 매출액 내림차순 정렬하시오
  select distinct t1.name "고객명", sum(saleprice) "매출액"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
order by sum(saleprice) desc;

--고객별 매출액이 3만원을 초과하는 고객에 대해 매출액 내림차순 정렬하시오
  select distinct t1.name "고객명", sum(saleprice) "매출액"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
  having sum(saleprice) > 30000
order by sum(saleprice) desc;

--도서를 구매한 고객명, 도서명,주문일자를 최근일 순으로 보이시오
  select t2.name "고객명", t3.bookname "도서명", t1.orderdate "주문 일자"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid
     and t1.bookid = t3.bookid
order by t1.orderdate desc;

--구매 이력이 없는 고객조회 (left outer join)
  select *
    from customer  t1, orders t2
   where t1.custid = t2.custid(+) 
     and t2.orderid is null;
--구매 이력이 없는 고객조회 (right outer join)     
 select *
   from orders  t1, customer t2
   where t1.custid(+) = t2.custid 
     and t1.orderid is null;
--3-21
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid;
--3-22   
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid
order by t1.custid;
--3-23
  select t1.name "고객명", t2.saleprice "도서의 판매가격"
    from customer t1, orders t2
   where t1.custid = t2.custid;
--3-24
  select t1.name "고객명", sum(saleprice) "총 판매액"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
order by t1.name;
--3-25
  select t2.name "고객명", t3.bookname "주문한 도서의 이름"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid;
--3-26
  select t2.name "고객명", t3.bookname "주문한 도서의 이름"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and price = 20000;
--3-27
  select t1.name "고객명", t2.saleprice "주문한 도서의 판매가격"
    from customer t1 left outer join orders t2
                     on t1.custid = t2.custid;
--일반 join sql
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid
     and t1.name = '박지성';
 
--일반 left join sql
 select *
    from customer t1, orders t2
   where t1.custid = t2.custid(+);
   
--ansi join sql
  select *
    from customer t1 inner join orders t2
                     on t1.custid = t2.custid
   where name = '박지성'; 
--ansi left join sql
  select *
    from customer t1 left outer join orders t2
                     on t1.custid = t2.custid;
                     
  select bookname "가장 비싼 도서의 이름"
    from book
   where price = (select max(price)
                    from book);
                    
  select name "도서를 구매한 적이 있는 고객의 이름"
    from customer
   where custid in (select custid
                      from orders); 
    
  select name "대한미디어에서 출판한 도서를 구매한 고객의 이름"
    from customer
   where custid in (select custid 
                      from orders
                     where bookid in (select bookid
                                        from book
                                       where publisher = '대한미디어')); 
                                       
  select b1.bookname "출판사의 평균 도서 가격보다 비싼 도서"
    from book b1
   where b1.price > (select avg(b2.price)
                       from book b2
                      where b2.publisher = b1.publisher);  
   
  select name
    from customer
   minus
  select name
    from customer
   where custid in(select custid
                   from orders);
                   
  select name "주문이 있는 고객의 이름", address "주문이 있는 고객의 주소"
    from customer cs
   where exists (select *
                   from orders od
                  where cs.custid = od.custid); 
--1-5    
  select count(distinct t3.publisher) "박지성이 구매한 도서의 출판사 수"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid and t2.name = '박지성';  
         
  select count(distinct t3.publisher) "박지성이 구매한 도서의 출판사 수"
    from orders t1 inner join customer t2
                   on t1.custid = t2.custid
                   inner join book t3
                   on t1.bookid = t3.bookid
   where t2.name = '박지성';                

  select count(distinct publisher) "박지성이 구매한 도서의 출판사 수"
    from book
   where bookid in (select bookid
                      from orders
                     where custid in (select custid
                                        from customer
                                       where name = '박지성')); 
--1-6    
  select t3.bookname "박지성이 구매한 도서의 이름", t3.price "박지성이 구매한 도서의 가격", 
         t3.price - t1.saleprice "정가와 판매가격의 차이"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid and t2.name = '박지성';
   
   select t3.bookname "박지성이 구매한 도서의 이름", t3.price "박지성이 구매한 도서의 가격",  
          t3.price - t1.saleprice "정가와 판매가격의 차이"
    from orders t1 inner join customer t2
                   on t1.custid = t2.custid
                   inner join book t3
                   on t1.bookid = t3.bookid
   where t2.name = '박지성';   
                                       
  select t1.bookname "박지성이 구매한 도서의 이름", t1.price "박지성이 구매한 도서의 가격", 
         t1.price - t2.saleprice "정가와 판매가격의 차이"
    from book t1, orders t2
   where t1.bookid = t2.bookid
     and custid in (select custid
                      from customer
                     where name = '박지성'); 
--1-7
--1.not in 
--2.not exists
--3.inner join
--4.left outer join
--5.집합연산자 minus
select bookname "박지성이 구매하지 않은 도서의 이름"
  from book
 where bookid not in (select t1.bookid
                        from orders t1, customer t2
                       where t1.custid = t2.custid 
                         and t2.name = '박지성');
                         
  select bookname "박지성이 구매하지 않은 도서의 이름"
    from book t3
   where not exists (select t1.bookid 
                       from orders t1, customer t2
                      where t1.custid = t2.custid
                        and t1.bookid = t3.bookid
                        and t2.name = '박지성');
--inner join만으로는 값을 구할 수 없음  
--  select distinct t3.bookname
--    from orders t1, customer t2, book t3
--   where t1.custid = t2.custid
--     and t1.bookid = t3.bookid
--     and (t2.name <> '박지성' or t2.name is null);
  
  select distinct t1.bookname "박지성이 구매하지 않은 도서의 이름"
    from book t1, orders t2, customer t3
   where t1.bookid = t2.bookid(+)
     and t2.custid = t3.custid(+)
     and (t3.name <> '박지성' or t3.name is null);
     
  select distinct t1.bookname "박지성이 구매하지 않은 도서의 이름"
    from book t1 left outer join orders t2
                 on t1.bookid = t2.bookid
                 left outer join customer t3
                 on t2.custid = t3.custid
   where (t3.name <> '박지성' or t3.name is null); 
     
     
  select bookname "박지성이 구매하지 않은 도서의 이름"
    from book
   minus
--박지성이 구매한 도서   
  select t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid
     and t1.bookid = t3.bookid
     and t2.name = '박지성';
     
  select bookname "박지성이 구매하지 않은 도서의 이름"
    from book 
   where bookid not in (select bookid 
                          from orders
                         where custid in (select custid
                                            from customer
                                           where name = '박지성')); 
--2-8                                           
  select name "주문하지 않은 고객의 이름"
    from customer
   where custid not in (select custid
                          from orders); 
--2-9                                           
  select sum(saleprice) "주문 금액 총액", avg(saleprice) "주문 금액 평균 금액"
    from orders;
--2-10    
  select t1.name "고객명", sum(saleprice) "고객별 구매액"  
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name;   
--2-11
  select t1.name "고객명", t3.bookname "구매한 도서 목록"
    from customer t1, orders t2, book t3
   where t1.custid = t2.custid and t2.bookid = t3.bookid;
--2-12   
  select *
    from book t1, orders t2
   where t1.bookid = t2.bookid 
     and t1.price - t2.saleprice = (select max(t1.price - t2.saleprice)
                                      from book t1, orders t2
                                     where t1.bookid = t2.bookid);
--2-13   
  select t2.name, avg(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having avg(saleprice) > (select avg(t3.saleprice)
                             from orders t3);
     
                   