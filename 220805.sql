--��������
CREATE USER c##springboot IDENTIFIED BY springboot1234 
    DEFAULT TABLESPACE users 
    TEMPORARY TABLESPACE temp 
    PROFILE DEFAULT;
--���Ѻο�    
GRANT CONNECT, RESOURCE TO c##springboot; 
GRANT CREATE VIEW, CREATE SYNONYM TO c##springboot; 
GRANT UNLIMITED TABLESPACE TO c##springboot; 
--�� Ǯ��
ALTER USER c##springboot ACCOUNT UNLOCK;