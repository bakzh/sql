
--주문이력이 2건 이상인 고객명을 주문건수 내림차순으로 보이시오 
  select name, count(*)
    from orders t1, customer t2
   where t1.custid = t2.custid 
group by t2.name
  having count(*) >= 2
order by count(*) desc;  
 
--고객별 매출액을 산출하고 매출액 내림차순 정렬하시오
  select name, sum(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid 
group by t2.name
order by sum(saleprice) desc;

--고객별 매출액이 3만원을 초과하는 고객에 대해 매출액 내림차순 정렬하시오
  select name, sum(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having sum(saleprice) > 30000
order by sum(saleprice) desc;  

--도서를 구매한 고객명, 도서명,주문일자를 최근일 순으로 보이시오
  select t2.name, t3.bookname, t1.orderdate
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
order by orderdate desc;   

--구매 이력이 없는 고객조회 (left outer join)
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid(+)
     and t2.orderid is null; 
--구매 이력이 없는 고객조회 (right outer join)     
  select *
    from orders t1, customer t2
   where t1.custid(+) = t2.custid
     and t1.orderid is null;
--3-21
 select *
   from customer, orders
  where customer.custid = orders.custid; 
--3-22   
  select *
    from customer, orders
   where customer.custid = orders.custid
order by customer.custid;
--3-23
  select name, saleprice
    from customer, orders
   where customer.custid = orders.custid; 
--3-24
  select name, sum(saleprice)
    from customer, orders
   where customer.custid = orders.custid
group by customer.name
order by customer.name;
--3-25
  select customer.name, book.bookname
    from customer, orders, book
   where customer.custid = orders.custid and orders.bookid = book.bookid; 
--3-26
  select customer.name, book.bookname
    from customer, orders, book
   where customer.custid = orders.custid and orders.bookid = book.bookid
     and book.price = 20000;
     
--3-27
  select customer.name, saleprice
    from customer left outer join orders
                  on customer.custid = orders.custid;
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
                     
--1-(5) 박지성이 구매한 도서의 출판사 수    
  select count(distinct publisher)
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and t2.name = '박지성'; 
--1-(6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이  
  select t3.bookname, t3.price, t3.price - t1.saleprice
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and t2.name = '박지성';
--1-(7) 박지성이 구매하지 않은 도서의 이름
--1)not in
  select bookname
    from book
   where bookid not in (select t1.bookid
                          from orders t1, customer t2
                         where t1.custid = t2.custid
                           and t2.name = '박지성');
                           
--2)not exists
  select t3.bookname
    from book t3
   where not exists (select t1.bookid
                       from orders t1, customer t2
                      where t1.custid = t2.custid
                        and t1.bookid = t3.bookid
                        and t2.name = '박지성');
--3) left outer join
  select distinct t1.bookname
    from book t1, orders t2, customer t3
   where t1.bookid = t2.bookid(+)
     and t2.custid = t3.custid(+)
     and (t3.name <> '박지성' or t3.name is null);
--4)집합연산자 minu
  select bookname
    from book
   minus 
--박지성이 구매한도서
  select t3.bookname
  from orders t1, customer t2, book t3
 where t1.custid = t2.custid
   and t1.bookid = t3.bookid
   and t2.name = '박지성';
--2-(8) 주문하지 않은 고객의 이름(부속질의 사용)    
--1)exists
  select t1.name
    from customer t1
   where not exists (select t2.custid
                       from orders t2
                      where t1.custid = t2.custid); 
--2) in
  select t1.name
    from customer t1
   where t1.custid not in (select t2.custid
                             from orders t2); 
                          
--3) left outer join                          
  select t1.name
    from customer t1, orders t2
   where t1.custid = t2.custid(+)
     and t2.orderid is null; 
     
--2-(9) 주문 금액의 총액과 주문의 평균 금액                                           
  select sum(saleprice), sum(saleprice)
    from orders; 
--2-(10) 고객의 이름과 고객별 구매액   
  select t2.name, sum(t1.saleprice) 
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name;   

--2-(11) 고객의 이름과 고객이 구매한 도서 목록
  select t2.name, t1.orderid, t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid;
--2-(12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문    
  select *
    from book t1, orders t2
   where t1.bookid = t2.bookid 
     and t1.price - t2.saleprice = ( select max(t1.price - t2.saleprice)
                                       from book t1, orders t2
                                      where t1.bookid = t2.bookid);  
--2-(13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 
  select t2.name, avg(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having avg(saleprice) > (select avg(t3.saleprice)
                             from orders t3);