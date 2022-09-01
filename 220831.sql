select * from product;

select product_id, pname, quantity, price
  from product
 where product_id = 42 ;
 
update product
   set pname = '마우스패드',
       quantity = 10,
       price = 10000
 where product_id = 42;      
       
delete from product where product_id = 41; 

rollback;

select product_id, pname, quantity, price
  from product;
  
delete from product where product_id=87;
commit;

select product_product_id_seq.nextval
  from dual;

select 'm-' || product_product_id_seq.nextval
  from dual;