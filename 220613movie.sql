drop table reservation;
drop table cinema;
drop table customer;
drop table theater;

--����
create table theater(
    theater_no      number,
    theater_name    varchar2(60),
    location        varchar2(30)
);
--���� �⺻Ű
alter table theater add constraint theater_theater_no_pk primary key (theater_no);
--�󿵰�
create table cinema(
    theater_no      number,
    cinema_no       number,
    movie_title     varchar2(30),
    price           number,
    seats           number
);
--�󿵰� �⺻Ű
alter table cinema add constraint cinema_combo_pk primary key(theater_no,cinema_no);
--�󿵰� �ܷ�Ű
alter table cinema add constraint cinema_theater_no_fk foreign key(theater_no)
    references theater(theater_no);
--��ȭ ������ 2������ ���� �ʾƾ��ϴ� ���� ����
alter table cinema add constraint cinema_price_ch
    check (price <= 20000);
--�󿵰� ��ȣ�� 1���� 10������ ���� ����
alter table cinema add constraint cinema_cinema_no_ch 
    check (cinema_no >= 1 and cinema_no <= 10);

--��
create table customer(
    cust_no         number,
    name            varchar2(12),
    address         varchar(90)
);
--�� �ܷ�Ű
alter table customer add constraint customer_cust_no_pk primary key (cust_no); 

--����
create table reservation(
    theater_no      number,
    cinema_no       number,
    cust_no         number,
    seat_no         number,
    screening_date  date
);
--���� �⺻Ű
alter table reservation add constraint reservation_combo_pk primary key(theater_no,cinema_no,cust_no);
--���� �ܷ�Ű theater_no
alter table reservation add constraint reservation_theater_no_fk foreign key(theater_no,cinema_no)
    references cinema(theater_no,cinema_no);
--���� �ܷ�Ű cust_no
alter table reservation add constraint reservation_cust_no_fk foreign key(cust_no)
    references customer(cust_no);
--���� ����� ���� �¼��� �� �� �������� �ʾƾ� �Ѵ�
alter table reservation add constraint reservation_seat_no_seat_no_uq 
    unique (cust_no,seat_no);


    
insert into theater values (1,'�Ե�','���');
insert into theater values (2,'�ް�','����');
insert into theater values (3,'����','���');

insert into cinema values (1,1,'����� ��ȭ',15000,48);
insert into cinema values (3,1,'���� ��ȭ',7500,120);
insert into cinema values (3,2,'��մ� ��ȭ',8000,110);

insert into customer values (3,'ȫ�浿','����');
insert into customer values (4,'��ö��','���');
insert into customer values (9,'�ڿ���','����'); 

insert into reservation values (3,2,3,15,'20200901');
insert into reservation values (3,1,4,16,'20200901');
insert into reservation values (1,1,9,48,'20200901');



--1-1
select theater_name "�����̸�", location "���� ��ġ"
  from theater;
--1-2
<<<<<<< HEAD
select theater_name "�����̸�", location "���� ��ġ"
=======
select *
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  from theater
 where location = '���'; 
--1-3
  select name "����", address "���� �ּ�"
    from customer
   where address = '���'
order by name;
--1-4
  select theater_no "�����ȣ", cinema_no "�󿵰� ��ȣ", movie_title "��ȭ����"
    from cinema
   where price <= 8000;
--1-5
<<<<<<< HEAD
  select t3.name "����",t2.location "������ġ",t2.theater_no "���� ��ȣ"
    from reservation t1, theater t2, customer t3
   where t1.cust_no = t3.cust_no
     and t2.location = t3.address;   
--2-1
  select count(distinct theater_no) "������ ��"
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
  select count(theater_no) "������ ��"
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
    from theater; 
--2-2
  select avg(price) "�󿵵Ǵ� ��ȭ�� ��� ����"
    from cinema;
--2-3
<<<<<<< HEAD
  select count(t2.name) "���� ��"
    from reservation t1, customer t2
   where t1.cust_no = t2.cust_no
     and t1.screening_date = '20/09/01';
=======
  select count(*) "������ ���� ��"
    from reservation
   where screening_date = '20/09/01';
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-1
  select t2.movie_title
    from theater t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.theater_name = '����';
<<<<<<< HEAD
=======
     
  select t2.movie_title
    from theater t1 inner join cinema t2
                    on t1.theater_no = t2.theater_no
   where t1.theater_name = '����';
   
  select t2.movie_title
    from reservation t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.cinema_no = t2.cinema_no
     and t1.theater_no = (select theater_no
                            from theater t2
                           where t2.theater_name = '����');  
                          
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-2
  select t3.name
    from reservation t1, theater t2, customer t3
   where t1.theater_no = t2.theater_no 
     and t1.cust_no = t3.cust_no
     and t2.theater_name = '����';
<<<<<<< HEAD
=======

  select t3.name
    from reservation t1 inner join theater t2
                        on t1.theater_no = t2.theater_no
                        inner join customer t3
                        on t1.cust_no = t3.cust_no
   where  t2.theater_name = '����';
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--3-3
  select sum(price)
    from theater t1, cinema t2, reservation t3
   where t1.theater_no = t2.theater_no
     and t2.theater_no = t3.theater_no
     and t2.cinema_no = t3.cinema_no
     and t1.theater_name = '����';
--4-1
<<<<<<< HEAD
  select theater_no, count(*)
    from cinema
group by theater_no;
--4-2
  select *
=======
  select theater_name "�����", count(*) "�󿵰� ��"
    from cinema t1, theater t2
   where t1.theater_no = t2.theater_no 
group by theater_name;
--4-2
  select t1.theater_name "�����", t2.cinema_no "�󿵰���ȣ", t2.movie_title "��ȭ����",
         t2.price "����", t2.seats "�¼� ��"
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
    from theater t1, cinema t2
   where t1.theater_no = t2.theater_no
     and t1.location = '���';
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
INSERT INTO theater VALUES (1, 'CGV', '�λ�');
INSERT INTO cinema VALUES (2, 1, '�ظ�����', 13000, 130);
INSERT INTO reservation VALUES (2, 1, 1, 130, '20220613');
INSERT INTO customer VALUES (1, '������', '���');
--5-2
update cinema set price = price * 1.1;
select * from cinema;
=======
  select theater_name "�����", count(*)"�� ��"
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
INSERT INTO theater VALUES (4, 'CGV', '�Ｑ��');
INSERT INTO cinema VALUES (4,1,'���˵���2',15000,200);
insert into reservation values (3,2,9,20,'20200901');
INSERT INTO customer VALUES (1,'ȫ���','����');
commit;
--5-2
update cinema set price = price * 1.1;
select * from cinema;
commit;
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  