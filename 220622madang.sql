create or replace function Domestic(
  p_custid  in  customer.custid%type
) return varchar2
as              
  lv_domestic  varchar2(12);
begin
 
 select decode(instr(t1.address,'���ѹα�'),0,'����','����')
   into lv_domestic
   from customer t1
  where custid = p_custid;
  
  return lv_domestic;
  
 exception 
    when others then
      dbms_output.put_line('��Ÿ ���� �߻� : ' || SQLERRM(SQLCODE));

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

  if lv_address like '%���ѹα�%' then
    lr_domestic := '����';
  else
    lr_domestic := '����';
  end if;
  
  return lr_domestic;
  
 exception 
    when others then
      dbms_output.put_line('��Ÿ ���� �߻� : ' || SQLERRM(SQLCODE));

end;


 select  t1.domestic "���ֱ���", t2.name "����"
    from (select  custid, domestic_2(custid) domestic
            from customer ) t1,
            customer t2
   where t1.custid = t2.custid                           
group by  t1.domestic, t2.name;

 
select decode(instr(t1.address,'���ѹα�'),0,'����','����') "���ֱ���"
  from customer t1
 where t1.custid = 2;
 
  
select case when instr(t1.address,'���ѹα�') = 0 then '����'
            when instr(t1.address,'���ѹα�') > 0 then '����'
            else '�˼�����'
       end "���ֱ���"
  from customer t1
 where t1.custid = 4;
 
  
  select  t1.domestic "���ֱ���", sum(t2.saleprice) "���Ǹž�"
    from (select  custid,
                  case when instr(address,'���ѹα�') = 0 then '����'
                      when instr(address,'���ѹα�') > 0 then '����'
                      else '�˼�����'
                  end  as domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;
   
   
   
   
   