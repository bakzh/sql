
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
                       from orders t1, customer t2
                      where t1.custid = t2.custid
                        and t1.bookid = t3.bookid
                        and t2.name = '������');
--3) left outer join
  select distinct t1.bookname
    from book t1, orders t2, customer t3
   where t1.bookid = t2.bookid(+)
     and t2.custid = t3.custid(+)
     and (t3.name <> '������' or t3.name is null);
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
  select t2.name, avg(saleprice)
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name
  having avg(saleprice) > (select avg(t3.saleprice)
                             from orders t3);