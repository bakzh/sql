  select t2.publisher, t1.custid, sum(t1.saleprice)
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by t2.publisher, t1.custid
order by t2.publisher, t1.custid; 

  select t2.publisher, t1.custid, sum(t1.saleprice)
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by rollup(t2.publisher,t1.custid);  --N+1

  select t2.publisher, t1.custid, sum(t1.saleprice)
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by cube(t2.publisher,t1.custid);    --2**N (2ÀÇN½Â)

  select t2.publisher, t1.custid, sum(t1.saleprice)
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by grouping sets(t2.publisher,t1.custid); 

  select t2.publisher, t1.custid, sum(t1.saleprice)
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by grouping sets((t2.publisher,t1.custid),(t2.publisher),(t1.custid),()); 


select t1.*,
       ntile(3) over (partition by t1.publisher order by price desc) "¹öÅ¶"
  from book t1;

  select t2.name, sum(t1.saleprice),
         case ntile(3) over(order by sum(t1.saleprice)desc) when 1 then 'ÃÖ¿ì¼ö °í°´'
                                                            when 2 then '¿ì¼ö °í°´'
                                                            else '±âÅ¸'
         end as "°í°´ µî±Þ"
    from orders t1, customer t2
   where t1.custid = t2.custid
group by t2.name; 

select *
  from (
      select row_number() over(order by sum(t1.saleprice) desc) no,
             t3.publisher, t2.name, sum(t1.saleprice),
             rank() over(partition by t3.publisher order by sum(t1.saleprice) desc) r1,
             dense_rank() over(order by sum(t1.saleprice) desc) r2
        from orders t1, customer t2, book t3
       where t1.custid = t2.custid
         and t1.bookid = t3.bookid
    group by t3.publisher,t2.name
    order by t3.publisher,r1)
 where r1 = 1;
 