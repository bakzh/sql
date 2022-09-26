select * from product;
drop SEQUENCE PRODUCT_PRODUCT_ID_SEQ;
create SEQUENCE PRODUCT_PRODUCT_ID_SEQ;
delete from product;

select *
  from (select rownum no, product_Id,pname,quantity,price
          from product) t1
 where t1.no between 11 and 20;         
