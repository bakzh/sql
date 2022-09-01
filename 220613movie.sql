drop table reservation;
drop table cinema;
drop table customer;
drop table theater;

--극장
create table theater(
    theater_no      number,
    theater_name    varchar2(60),
    location        varchar2(30)
);
--극장 기본키
alter table theater add constraint theater_theater_no_pk primary key (theater_no);
--상영관
create table cinema(
    theater_no      number,
    cinema_no       number,
    movie_title     varchar2(30),
    price           number,
    seats           number
);
--상영관 기본키
alter table cinema add constraint cinema_combo_pk primary key(theater_no,cinema_no);
--상영관 외래키
alter table cinema add constraint cinema_theater_no_fk foreign key(theater_no)
    references theater(theater_no);
--영화 가격은 2만원을 넘지 않아야하는 제약 조건
alter table cinema add constraint cinema_price_ch
    check (price <= 20000);
--상영관 번호는 1부터 10사이인 제약 조건
alter table cinema add constraint cinema_cinema_no_ch 
    check (cinema_no >= 1 and cinema_no <= 10);

--고객
create table customer(
    cust_no         number,
    name            varchar2(12),
    address         varchar(90)
);
--고객 외래키
alter table customer add constraint customer_cust_no_pk primary key (cust_no); 

--예약
create table reservation(
    theater_no      number,
    cinema_no       number,
    cust_no         number,
    seat_no         number,
    screening_date  date
);
--예약 기본키
alter table reservation add constraint reservation_combo_pk primary key(theater_no,cinema_no,cust_no);
--예약 외래키 theater_no
alter table reservation add constraint reservation_theater_no_fk foreign key(theater_no,cinema_no)
    references cinema(theater_no,cinema_no);
--예약 외래키 cust_no
alter table reservation add constraint reservation_cust_no_fk foreign key(cust_no)
    references customer(cust_no);
--같은 사람이 같은 좌석을 두 번 예약하지 않아야 한다
alter table reservation add constraint reservation_seat_no_seat_no_uq 
    unique (cust_no,seat_no);


    
insert into theater values (1,'롯데','잠실');
insert into theater values (2,'메가','강남');
insert into theater values (3,'대한','잠실');

insert into cinema values (1,1,'어려운 영화',15000,48);
insert into cinema values (3,1,'멋진 영화',7500,120);
insert into cinema values (3,2,'재밌는 영화',8000,110);

insert into customer values (3,'홍길동','강남');
insert into customer values (4,'김철수','잠실');
insert into customer values (9,'박영희','강남'); 

insert into reservation values (3,2,3,15,'20200901');
insert into reservation values (3,1,4,16,'20200901');
insert into reservation values (1,1,9,48,'20200901');



--1-1
select theater_name "극장이름", location "극장 위치"
  from theater;
--1-2
<<<<<<< HEAD
select theater_name "극장이름", location "극장 위치"
=======
select *
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  from theater
 where location = '잠실'; 
--1-3
  select name "고객명", address "고객의 주소"
    from customer
   where address = '잠실'
order by name;
--1-4
  select theater_no "극장번호", cinema_no "상영관 번호", movie_title "영화제목"
    from cinema
   where price <= 8000;
--1-5
<<<<<<< HEAD
  select t3.name "고객명",t2.location "극장위치",t2.theater_no "극장 번호"
    from reservation t1, theater t2, customer t3
   where t1.cust_no = t3.cust_no
     and t2.location = t3.address;   
--2-1
  select count(distinct theater_no) "극장의 수"
=======
  select distinct t2.name
    from theater t1, customer t2
   where t1.location = t2.address;   
   
  select distinct t2.name
    from theater t1 inner join customer t2
      on t1.location = t2.address;
      
  select name
    from customer t1
   where address in (select distinct location
                       from theater t2
                      where t1.address = t2.location);  
    
--2-1
  select count(theater_no) "극장의 수"
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
    from theater; 
--2-2
  select avg(price) "상영되는 영화의 평균 가격"
    from cinema;
--2-3
<<<<<<< HEAD
  select count(t2.name) "고객의 수"
    from reservation t1, customer t2
   where t1.cust_no = t2.cust_no
     and t1.screening_date = '20/09/01';
=======
  select count(*) "관람한 고객의 수"
    from reservation
   where screening_date = '20/09/01';
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-1
  select t2.movie_title
    from theater t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.theater_name = '대한';
<<<<<<< HEAD
=======
     
  select t2.movie_title
    from theater t1 inner join cinema t2
                    on t1.theater_no = t2.theater_no
   where t1.theater_name = '대한';
   
  select t2.movie_title
    from reservation t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.cinema_no = t2.cinema_no
     and t1.theater_no = (select theater_no
                            from theater t2
                           where t2.theater_name = '대한');  
                          
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-2
  select t3.name
    from reservation t1, theater t2, customer t3
   where t1.theater_no = t2.theater_no 
     and t1.cust_no = t3.cust_no
     and t2.theater_name = '대한';
<<<<<<< HEAD
=======

  select t3.name
    from reservation t1 inner join theater t2
                        on t1.theater_no = t2.theater_no
                        inner join customer t3
                        on t1.cust_no = t3.cust_no
   where  t2.theater_name = '대한';
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-3
  select sum(price)
    from theater t1, cinema t2, reservation t3
   where t1.theater_no = t2.theater_no
     and t2.theater_no = t3.theater_no
     and t2.cinema_no = t3.cinema_no
     and t1.theater_name = '대한';
--4-1
<<<<<<< HEAD
  select theater_no, count(*)
    from cinema
group by theater_no;
--4-2
  select *
=======
  select theater_name "극장명", count(*) "상영관 수"
    from cinema t1, theater t2
   where t1.theater_no = t2.theater_no 
group by theater_name;
--4-2
  select t1.theater_name "극장명", t2.cinema_no "상영관번호", t2.movie_title "영화제목",
         t2.price "가격", t2.seats "좌석 수"
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
    from theater t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.location = '잠실';
--4-3
<<<<<<< HEAD
  select theater_no, count(*)
    from reservation 
   where screening_date = '20200901'
group by theater_no;
--4-4
  select t1.movie_title
    from cinema t1, reservation t2
   where t1.theater_no = t2.theater_no 
     and t1.cinema_no = t2.cinema_no
     and screening_date = '20200901'
group by t2.theater_no, t2.cinema_no
  having count(*) = (select max(*)
                       from cinema t1, reservation t2
                      where and t1.cinema_no = t2.cinema_no
                            and screening_date = '20200901'
                   group by t2.theater_no, t2.cinema_no);
--5-1
INSERT INTO theater VALUES (1, 'CGV', '부산');
INSERT INTO cinema VALUES (2, 1, '해리포터', 13000, 130);
INSERT INTO reservation VALUES (2, 1, 1, 130, '20220613');
INSERT INTO customer VALUES (1, '박지훈', '울산');
--5-2
update cinema set price = price * 1.1;
select * from cinema;
=======
  select theater_name "극장명", count(*)"고객 수"
    from reservation t1, theater t2 
   where t1.theater_no = t2.theater_no
     and screening_date = '20200901'
group by theater_name;
--4-4

  select t1.movie_title
    from cinema t1
   where (theater_no, cinema_no) in (select t1.theater_no, t2.cinema_no
                                        from reservation t1, cinema t2
                                       where t1.theater_no = t2.theater_no
                                         and t1.cinema_no = t2.cinema_no
                                         and t1.screening_date = '200901'
                                    group by t1.theater_no, t2.cinema_no
                                      having count(*) = (select max(count(*))
                                                          from reservation t1
                                                         where t1.screening_date = '200901'
                                                      group by t1.theater_no, t1.cinema_no));
                                      
--5-1
INSERT INTO theater VALUES (4, 'CGV', '삼선동');
INSERT INTO cinema VALUES (4,1,'범죄도시2',15000,200);
insert into reservation values (3,2,9,20,'20200901');
INSERT INTO customer VALUES (1,'홍길순','옥동');
commit;
--5-2
update cinema set price = price * 1.1;
select * from cinema;
commit;
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  