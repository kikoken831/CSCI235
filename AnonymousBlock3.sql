set serveroutput on
DECLARE
  average NUMBER(8,2);
BEGIN
  SELECT avg(P_RETAILPRICE) INTO average
  FROM part;
  IF average < 3000 THEN
     dbms_output.put_line('Average retail price is less than 3000, ' || 'Average is ' || average);
  else 
     dbms_output.put_line('Average retail price is more than 3000, ' || 'Average is ' || average);
  END IF;
END;
/
show error;

