<<<<<<< HEAD

--�ֹ��̷��� 2�� �̻��� ������ �ֹ��Ǽ� ������������ ���̽ÿ� 
  select name, count(*)
    from orders t1, customer t2
   where t1.custid = t2.custid 
group by t2.name
  having count(*) >= 2
order by count(*) desc;  
 
--���� ������� �����ϰ� ����� �������� �����Ͻÿ�
  select name, sum(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid 
group by t2.name
order by sum(saleprice) desc;

--���� ������� 3������ �ʰ��ϴ� ���� ���� ����� �������� �����Ͻÿ�
  select name, sum(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having sum(saleprice) > 30000
order by sum(saleprice) desc;  

--������ ������ ����, ������,�ֹ����ڸ� �ֱ��� ������ ���̽ÿ�
  select t2.name, t3.bookname, t1.orderdate
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
order by orderdate desc;   

--���� �̷��� ���� ����ȸ (left outer join)
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid(+)
     and t2.orderid is null; 
--���� �̷��� ���� ����ȸ (right outer join)     
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
=======
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
 
--�ֹ��̷��� 2�� �̻��� ������ �ֹ��Ǽ� ������������ ���̽ÿ� 
  select distinct t1.name "����", count(*) "�ֹ� �Ǽ�"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
  having count(*) >= 2
order by count(*) desc;
 
--���� ������� �����ϰ� ����� �������� �����Ͻÿ�
  select distinct t1.name "����", sum(saleprice) "�����"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
order by sum(saleprice) desc;

--���� ������� 3������ �ʰ��ϴ� ���� ���� ����� �������� �����Ͻÿ�
  select distinct t1.name "����", sum(saleprice) "�����"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
  having sum(saleprice) > 30000
order by sum(saleprice) desc;

--������ ������ ����, ������,�ֹ����ڸ� �ֱ��� ������ ���̽ÿ�
  select t2.name "����", t3.bookname "������", t1.orderdate "�ֹ� ����"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid
     and t1.bookid = t3.bookid
order by t1.orderdate desc;

--���� �̷��� ���� ����ȸ (left outer join)
  select *
    from customer  t1, orders t2
   where t1.custid = t2.custid(+) 
     and t2.orderid is null;
--���� �̷��� ���� ����ȸ (right outer join)     
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
  select t1.name "����", t2.saleprice "������ �ǸŰ���"
    from customer t1, orders t2
   where t1.custid = t2.custid;
--3-24
  select t1.name "����", sum(saleprice) "�� �Ǹž�"
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name
order by t1.name;
--3-25
  select t2.name "����", t3.bookname "�ֹ��� ������ �̸�"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid;
--3-26
  select t2.name "����", t3.bookname "�ֹ��� ������ �̸�"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and price = 20000;
--3-27
  select t1.name "����", t2.saleprice "�ֹ��� ������ �ǸŰ���"
    from customer t1 left outer join orders t2
                     on t1.custid = t2.custid;
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
--�Ϲ� join sql
  select *
    from customer t1, orders t2
   where t1.custid = t2.custid
     and t1.name = '������';
 
--�Ϲ� left join sql
 select *
    from customer t1, orders t2
   where t1.custid = t2.custid(+);
   
--ansi join sql
  select *
    from customer t1 inner join orders t2
                     on t1.custid = t2.custid
   where name = '������'; 
--ansi left join sql
  select *
    from customer t1 left outer join orders t2
                     on t1.custid = t2.custid;
                     
<<<<<<< HEAD
--1-(5) �������� ������ ������ ���ǻ� ��    
  select count(distinct publisher)
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and t2.name = '������'; 
--1-(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����  
  select t3.bookname, t3.price, t3.price - t1.saleprice
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid
     and t2.name = '������';
--1-(7) �������� �������� ���� ������ �̸�
--1)not in
  select bookname
    from book
   where bookid not in (select t1.bookid
                          from orders t1, customer t2
                         where t1.custid = t2.custid
                           and t2.name = '������');
                           
--2)not exists
  select t3.bookname
    from book t3
   where not exists (select t1.bookid
=======
  select bookname "���� ��� ������ �̸�"
    from book
   where price = (select max(price)
                    from book);
                    
  select name "������ ������ ���� �ִ� ���� �̸�"
    from customer
   where custid in (select custid
                      from orders); 
    
  select name "���ѹ̵��� ������ ������ ������ ���� �̸�"
    from customer
   where custid in (select custid 
                      from orders
                     where bookid in (select bookid
                                        from book
                                       where publisher = '���ѹ̵��')); 
                                       
  select b1.bookname "���ǻ��� ��� ���� ���ݺ��� ��� ����"
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
                   
  select name "�ֹ��� �ִ� ���� �̸�", address "�ֹ��� �ִ� ���� �ּ�"
    from customer cs
   where exists (select *
                   from orders od
                  where cs.custid = od.custid); 
--1-5    
  select count(distinct t3.publisher) "�������� ������ ������ ���ǻ� ��"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid and t2.name = '������';  
         
  select count(distinct t3.publisher) "�������� ������ ������ ���ǻ� ��"
    from orders t1 inner join customer t2
                   on t1.custid = t2.custid
                   inner join book t3
                   on t1.bookid = t3.bookid
   where t2.name = '������';                

  select count(distinct publisher) "�������� ������ ������ ���ǻ� ��"
    from book
   where bookid in (select bookid
                      from orders
                     where custid in (select custid
                                        from customer
                                       where name = '������')); 
--1-6    
  select t3.bookname "�������� ������ ������ �̸�", t3.price "�������� ������ ������ ����", 
         t3.price - t1.saleprice "������ �ǸŰ����� ����"
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid and t2.name = '������';
   
   select t3.bookname "�������� ������ ������ �̸�", t3.price "�������� ������ ������ ����",  
          t3.price - t1.saleprice "������ �ǸŰ����� ����"
    from orders t1 inner join customer t2
                   on t1.custid = t2.custid
                   inner join book t3
                   on t1.bookid = t3.bookid
   where t2.name = '������';   
                                       
  select t1.bookname "�������� ������ ������ �̸�", t1.price "�������� ������ ������ ����", 
         t1.price - t2.saleprice "������ �ǸŰ����� ����"
    from book t1, orders t2
   where t1.bookid = t2.bookid
     and custid in (select custid
                      from customer
                     where name = '������'); 
--1-7
--1.not in 
--2.not exists
--3.inner join
--4.left outer join
--5.���տ����� minus
select bookname "�������� �������� ���� ������ �̸�"
  from book
 where bookid not in (select t1.bookid
                        from orders t1, customer t2
                       where t1.custid = t2.custid 
                         and t2.name = '������');
                         
  select bookname "�������� �������� ���� ������ �̸�"
    from book t3
   where not exists (select t1.bookid 
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
                       from orders t1, customer t2
                      where t1.custid = t2.custid
                        and t1.bookid = t3.bookid
                        and t2.name = '������');
<<<<<<< HEAD
--3) left outer join
  select distinct t1.bookname
=======
--inner join�����δ� ���� ���� �� ����  
--  select distinct t3.bookname
--    from orders t1, customer t2, book t3
--   where t1.custid = t2.custid
--     and t1.bookid = t3.bookid
--     and (t2.name <> '������' or t2.name is null);
  
  select distinct t1.bookname "�������� �������� ���� ������ �̸�"
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
    from book t1, orders t2, customer t3
   where t1.bookid = t2.bookid(+)
     and t2.custid = t3.custid(+)
     and (t3.name <> '������' or t3.name is null);
<<<<<<< HEAD
--4)���տ����� minu
  select bookname
    from book
   minus 
--�������� �����ѵ���
  select t3.bookname
  from orders t1, customer t2, book t3
 where t1.custid = t2.custid
   and t1.bookid = t3.bookid
   and t2.name = '������';
--2-(8) �ֹ����� ���� ���� �̸�(�μ����� ���)    
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
     
--2-(9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�                                           
  select sum(saleprice), sum(saleprice)
    from orders; 
--2-(10) ���� �̸��� ���� ���ž�   
  select t2.name, sum(t1.saleprice) 
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name;   

--2-(11) ���� �̸��� ���� ������ ���� ���
  select t2.name, t1.orderid, t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid and t1.bookid = t3.bookid;
--2-(12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�    
  select *
    from book t1, orders t2
   where t1.bookid = t2.bookid 
     and t1.price - t2.saleprice = ( select max(t1.price - t2.saleprice)
                                       from book t1, orders t2
                                      where t1.bookid = t2.bookid);  
--2-(13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸� 
=======
     
  select distinct t1.bookname "�������� �������� ���� ������ �̸�"
    from book t1 left outer join orders t2
                 on t1.bookid = t2.bookid
                 left outer join customer t3
                 on t2.custid = t3.custid
   where (t3.name <> '������' or t3.name is null); 
     
     
  select bookname "�������� �������� ���� ������ �̸�"
    from book
   minus
--�������� ������ ����   
  select t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid
     and t1.bookid = t3.bookid
     and t2.name = '������';
     
  select bookname "�������� �������� ���� ������ �̸�"
    from book 
   where bookid not in (select bookid 
                          from orders
                         where custid in (select custid
                                            from customer
                                           where name = '������')); 
--2-8                                           
  select name "�ֹ����� ���� ���� �̸�"
    from customer
   where custid not in (select custid
                          from orders); 
--2-9                                           
  select sum(saleprice) "�ֹ� �ݾ� �Ѿ�", avg(saleprice) "�ֹ� �ݾ� ��� �ݾ�"
    from orders;
--2-10    
  select t1.name "����", sum(saleprice) "���� ���ž�"  
    from customer t1, orders t2
   where t1.custid = t2.custid
group by t1.name;   
--2-11
  select t1.name "����", t3.bookname "������ ���� ���"
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
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
  select t2.name, avg(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having avg(saleprice) > (select avg(t3.saleprice)
<<<<<<< HEAD
                             from orders t3);
=======
                             from orders t3);
     
                   
>>>>>>> ab71efcdff0573fd980254559c09cec99686a8ac
