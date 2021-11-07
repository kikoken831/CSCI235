set serveroutput on
create or replace function helloWorldSF(
	hello in varchar2,
	world in varchar2) return varchar2 is
begin
  return(hello || ' ' || world || '!');
end;
/
show error;
