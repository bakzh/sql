--3장 연습문제
--3-1 박지성이 구매한 도서의 출판사와 같은 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
  select t2.name
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid 
     and t1.bookid = t3.bookid
     and t3.publisher in (select distinct t3.publisher
                            from orders t1, customer t2, book t3
                           where t1.custid = t2.custid 
                             and t1.bookid = t3.bookid
                             and t2.name = '박지성') 
     and t2.name <> '박지성';
                
--3-2 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
  select t4.name
    from customer t4
   where (select count(distinct t3.publisher)
            from orders t1, customer t2, book t3
           where t1.custid = t2.custid
             and t1.bookid = t3.bookid
             and t2.name = t4.name ) >= 2; 
             
--3-3 전체 고객의 30%이상이 구매한 도서
  select t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid 
     and t1.bookid = t3.bookid
group by t3.bookname
  having count(t2.name) >= (select count(t4.name)* 30/100
                              from customer t4);
--상관쿼리
  select t2.bookname  "도서명"
    from book t2
   where (select count(t1.bookid) 
            from orders t1
           where t1.bookid = t2.bookid) >= ( select count(*) * 0.3
                                               from customer);
--비상관쿼리
  select t2.bookname "도서명", count(*) "판매수량"
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by t1.bookid, t2.bookname
  having count(*) >= ( select count(*) * 0.3
                         from customer);
                                                         
--4-5 (테이블 생성) 출판사에 대한 정보를 저장하는 테이블 bookcompany(name,address,begin)를 생성하고자 한다.
--      name은 기본키이며 varchar(20), adress는 varchar(20),begin data 타입으로 선언하여 생성하시오.
create table bookcompany(
    name    varchar2(20),
    address varchar2(20),
    begin   date
);
--기본키
alter table bookcompany add constraint bookcompany_name_pk primary key (name);
--4-6 (테이블 수정) bookcompany 테이블에서 인터넷 주소를 저장하는 webaddress 속성을 varchar(30)으로 추가하시오.
alter table bookcompany add webaddress varchar2(30);
--4-7 bookcompany 테이블에서 임의의 투플 name = 한빛아카데미, address = 서울시 마포구, begin = 1993-01-01,
--      webaddress = http://hanbit.co.kr 을 삽입하시오.
insert into bookcompany values ('한빛아카데미','서울시 마포구','19930101','http://hanbit.co.kr');

desc bookcompany;
select * from bookcompany;
commit;

--6
  select 동아리, count(과제 수)
    from 과제
   where 학생 수 >= 10
group by 동아리;
--7
  select 출판사명, count(*)
    from 도서
   where 발행년도 > 2000
group by 출판사명
  having count(*) >= 10;
---8
create table R(
    a char(1),
    d char(1),
    c char(1)
);
alter table r modify c char(2);

create table S(
    a char(1),
    d char(1),
    e char(1)
);

insert into r values ('1','a','10');
insert into r values ('1','a','11');
insert into r values ('1','a','25');
insert into r values ('2','b','22');
insert into r values ('3','b','21');
insert into r values ('4','c','17');

insert into s values ('1','p','x');
insert into s values ('1','p','y');
insert into s values ('2','q','y');
insert into s values ('4','r','w');
insert into s values ('6','s','z');

commit;
select * from r;
select * from s;

(select distinct a from r)
union all       --합집합(중복포합)
(select a from s);

(select distinct a from r)
union       --합집합(중복제거)
(select a from s);

--9
  select 부서.부서명, count(*)
    from 직원,부서
   where 직원.소속부서번호 = 부서.부서번호
     and 직원.급여 >= 40000
group by 부서.부서명

