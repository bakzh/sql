
select * from product;
delete from product;
commit;

--���
insert into product values(PRODUCT_PRODUCT_ID_SEQ.nextval,'��ǻ��',10,10000);
insert into product (product_id,pname,quantity,price)
  values(PRODUCT_PRODUCT_ID_SEQ.nextval,'�����',20,20000);

