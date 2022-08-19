create or replace function Domestic(
  p_custid  in  customer.custid%type
) return varchar2
as              
  lv_domestic  varchar2(12);
begin
 
 select decode(instr(t1.address,'대한민국'),0,'국외','국내')
   into lv_domestic
   from customer t1
  where custid = p_custid;
  
  return lv_domestic;
  
 exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));

end;


create or replace function Domestic_2(
  p_custid  in  customer.custid%type
) return varchar2
as             
  lv_address   customer.address%type;              
  lr_domestic  varchar2(12);
begin
  select address into lv_address
    from customer
   where custid = p_custid;  

  if lv_address like '%대한민국%' then
    lr_domestic := '국내';
  else
    lr_domestic := '국외';
  end if;
  
  return lr_domestic;
  
 exception 
    when others then
      dbms_output.put_line('기타 오류 발생 : ' || SQLERRM(SQLCODE));

end;


 select  t1.domestic "거주국가", t2.name "고객명"
    from (select  custid, domestic_2(custid) domestic
            from customer ) t1,
            customer t2
   where t1.custid = t2.custid                           
group by  t1.domestic, t2.name;

 
select decode(instr(t1.address,'대한민국'),0,'국외','국내') "거주국가"
  from customer t1
 where t1.custid = 2;
 
  
select case when instr(t1.address,'대한민국') = 0 then '국외'
            when instr(t1.address,'대한민국') > 0 then '국내'
            else '알수없음'
       end "거주국가"
  from customer t1
 where t1.custid = 4;
 
  
  select  t1.domestic "거주국가", sum(t2.saleprice) "총판매액"
    from (select  custid,
                  case when instr(address,'대한민국') = 0 then '국외'
                      when instr(address,'대한민국') > 0 then '국내'
                      else '알수없음'
                  end  as domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;
   
   
   
   
   