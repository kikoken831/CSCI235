CREATE OR REPLACE TRIGGER displayAccBal
BEFORE DELETE OR INSERT OR UPDATE ON customertest 
FOR EACH ROW 
WHEN (NEW.c_custkey > 0) 
DECLARE 
   accBalDiff CUSTOMERTEST.c_acctbal%type; 
BEGIN 
   accBalDiff := :NEW.c_acctbal + :OLD.c_acctbal; 
   dbms_output.put_line('Customer key: ' || :new.c_custkey || ', ' || :new.c_name);
   dbms_output.put_line('Old Account Balance: ' || :OLD.c_acctbal); 
   dbms_output.put_line('New Account Balance: ' || :NEW.c_acctbal); 
   dbms_output.put_line('Account balance difference: ' || accBalDiff); 
END; 
/ 
show error

