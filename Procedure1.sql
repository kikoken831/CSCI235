set serveroutput on
declare
  n1 number;
  n2 number;
  n3 number;
  res varchar2(200);
procedure findHigher (x in number, y in number, z out number) is
begin
  if x > y then
     z:= x;
  else
     z:= y;
  end if;
  --
  dbms_output.put_line('Print inside the procedure: ');
  dbms_output.put_line('Higher of ' || x || ' and ' || y
  	|| ' is ' || z || '.');
end;
--
procedure helloWorldP(hello in varchar2, world in varchar2, hw out varchar2) is
begin
  hw := hello || ' ' || world || '!!!!!';
  dbms_output.put_line('Print inside the procedure: ');
  dbms_output.put_line('hw: ' || hw);
end;
--
begin
  n1 := '&n1';
  n2 := '&n2';
  findHigher(n1, n2, n3);
  dbms_output.put_line('Print from outside the procedure.');
  dbms_output.put_line('Higher of ' || n1 || ' and ' || n2
  	|| ' is ' || n3 || '.');
--
  helloWorldP('Hello', 'PLSQL World', res);
  dbms_output.put_line('Print from outside the procedure.');
  dbms_output.put_line('res: ' || res);
end;
/
show errors

