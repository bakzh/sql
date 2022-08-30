
select * from product;
delete from product;
commit;

--등록
insert into product values(PRODUCT_PRODUCT_ID_SEQ.nextval,'컴퓨터',10,10000);
insert into product (product_id,pname,quantity,price)
  values(PRODUCT_PRODUCT_ID_SEQ.nextval,'모니터',20,20000);

