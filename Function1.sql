set serveroutput on
declare
  s1 varchar2(100);
  s2 varchar2(100);
  s3 varchar2(100);
function helloWorldF(hello in varchar2, world in varchar2) return varchar2 is
begin
  return (hello || ' ' || world || '!!!!!');
end;
--
begin
  s1 := '&s1';
  s2 := '&s2';
  dbms_output.put_line(helloWorldF(s1,s2));
end;
/
