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
                       from orders t1, customer t2
                      where t1.custid = t2.custid
                        and t1.bookid = t3.bookid
                        and t2.name = '������');
--inner join�����δ� ���� ���� �� ����  
--  select distinct t3.bookname
--    from orders t1, customer t2, book t3
--   where t1.custid = t2.custid
--     and t1.bookid = t3.bookid
--     and (t2.name <> '������' or t2.name is null);
  
  select distinct t1.bookname "�������� �������� ���� ������ �̸�"
    from book t1, orders t2, customer t3
   where t1.bookid = t2.bookid(+)
     and t2.custid = t3.custid(+)
     and (t3.name <> '������' or t3.name is null);
     
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
  select t2.name, avg(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having avg(saleprice) > (select avg(t3.saleprice)
                             from orders t3);
     
                   