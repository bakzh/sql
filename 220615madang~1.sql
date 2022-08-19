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

select rownum || '위' "고객별 총 판매순위",t1.*
  from(
        select t1.custid "고객번호", 
                (select substr (name,1,1) || '**' 
                   from customer t2  
                  where t2.custid = t1.custid) "고객명"
                ,to_char(round(sum(saleprice),-4),'999,999')||'원' "총구매액"
          from orders t1 
      group by t1.custid
        having sum(t1.saleprice) > (select avg(saleprice)
                                      from orders)
      order by sum(saleprice) desc) t1
 where rownum <= 2
order by rownum desc;

--컬럼추가   
  alter table orders add bookname varchar(40);
  select * from orders;
--테이블 구조 조회
  desc orders;
update orders 
   set bookname = (select bookname
                     from book
                    where book.bookid = orders.bookid);
  commit;
--컬럼삭제
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
   where bookname like '%축구%'; 
   
  create view vw_book as
      select *
    from book
   where bookname like '%축구%'; 
   
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
     
  select v1.name "고객명", sum(v1.saleprice) "총판매액"
    from vw_sales_info v1
group by v1.name
order by sum(v1.saleprice) desc;

  select v1.publisher "출판사", sum(v1.saleprice) "총판매액"
    from vw_sales_info v1
group by v1.publisher
order by sum(v1.saleprice) desc;
  
  create view vw_customer
  as select *
       from customer
      where address like '%대한민국%'; 
  
  create or replace view vw_customer 
   as select custid "고객번호",name "이름",address "주소"
       from customer
      where address like '%영국%'; 
  
  select * 
    from vw_customer;
  
  drop view vw_customer;
  
create view highorders 
as select t3.bookid "도서번호", t3.bookname "도서이름", t2.name "고객이름",
          t3.publisher "출판사", t1.saleprice "판매가격"
     from orders t1, customer t2, book t3
    where t1.custid = t2.custid and t1.bookid = t3.bookid
      and t1.saleprice >= 20000; 
--뷰이름 변경
--rename highoders to highorders;

  select "도서이름","고객이름"
    from highorders;
    
  create or replace view highorders 
as select t3.bookid "도서번호", t3.bookname "도서이름", t2.name "고객이름",
          t3.publisher "출판사"
     from orders t1, customer t2, book t3
    where t1.custid = t2.custid and t1.bookid = t3.bookid
      and t1.saleprice >= 20000; 
  
create index ix_book on book(bookname);  
create index ix_book2 on book(publisher,price);  
drop index ix_book2;
select *
  from book
 where publisher = '대한미디어' and price >= 30000; 

--1)bookid 크기 변경 2 -> 4 
alter table book modify bookid number(4); 
--2)book테이블 임의 데이터 생성 9999
declare 
begin
  for i in 11..9999 loop
    insert into book values(i, '데이터베이스'||i, '출판사'||i, i); 
  end loop; 
end;
--3)bookid 테이블 레코드 수 확인
select count(*) from book;
--4)인덱스 없이 조회 f6
select *
  from book
 where publisher = '대한미디어' and price >= 30000; 
--5)인덱스 생성
create index ix_book2 on book(publisher,price); 
--6)인덱스 생성 후 조회
select *
  from book
 where publisher = '대한미디어' and price >= 30000; 

alter index ix_book2 rebuild;

delete from book where bookid > 10;

select name 
  from customer
 where name like '박세리'; 
 
create index ix_customer on customer (name);
drop index ix_customer;


select name 
  from customer
 where custid = 5; 