create table NewBook(
    bookid number, --primary key
    bookname varchar2(20),
    publisher varchar2(20),
    price number default 1000 --check(price > 1000)
--    primary key(bookid)
);
alter table newbook add constraint Newbook_bookid_pk primary key (bookid);
--오라클에서 default는 제약이 아니다
--alter table newbook modify price default 1000;
alter table newbook add constraint Newbook_price_ch check (price > 1000) ;

select * from user_constraints where table_name = 'NEWBOOK';

desc newbook;
insert into newbook values (1, '데이터베이스', '한빛', 30000); 
insert into newbook values (2, '데이터베이스', '한빛', 30000); 
select * from newbook;
insert into newbook values (null,null,null,null);
insert into newbook (bookid, bookname, publisher) values (2,'자바','정보');
commit;
drop table newbook;

create table NewCustomer(
    custid number,
    name varchar(40),
    address varchar2(40),
    phone varchar2(30)
);
alter table Newcustomer add constraint NewCustomer_custid_pk primary key (custid);
desc newcustomer;

create table neworders(
    orderid     number,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date
);
--기본키 
alter table neworders add constraint neworders_orderid_pk primary key (orderid);
--not null
alter table neworders modify custid constraint neworders_custid_nn not null;
alter table neworders modify bookid constraint neworders_bookid_nn not null;
--외래키
alter table neworders add constraint neworders_custid_fk foreign key(custid) 
    references newcustomer(custid);
alter table neworders add constraint neworders_bookid_fk foreign key(bookid) 
    references newbook(bookid);
--제약조건 삭제
alter table neworders drop constraint neworders_custid_fk;
alter table neworders drop constraint neworders_custid_nn;
--제약조건 조회
select * from user_constraints where table_name = 'NEWORDERS';

select * from newcustomer;
select * from newbook;
select * from neworders;

insert into newcustomer values (1,'홍길동','울산 남구','010-1111-1111');
insert into newbook values (1,'데이터베이스','한빛',30000);
insert into neworders values (1,1,1,27000,'20220613');
commit;

delete from newcustomer where custid = 1;
rollback;

desc newbook;
drop table newbook;
drop table neworders;

create table newbook(
    bookid      number,
    bookname    varchar2(20),
    publisher   varchar2(20),
    price       number
);
alter table newbook add isbn varchar2(13);
desc newbook;
alter table newbook modify isbn number;
alter table newbook drop column isbn;

alter table newbook modify bookid constraint newbook_bookid_nn not null;
alter table newbook add constraint newbook_bookid_pk primary key (bookid);

select * from user_constraints where table_name = 'NEWBOOK';

drop table newbook;
drop table newcustomer;