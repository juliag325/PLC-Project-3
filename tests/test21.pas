program test21;
var n, f: real;
function factorial(n: real): real;
begin
    writeln('help');
  if(n > 1) then
    factorial:= n * factorial(n - 1)
  else
    factorial:=1;
    writeln(factorial);
end;

begin
  writeln('n = ');
  readln(n);
  f:=factorial(n);
  writeln(n, '! = ',f);
end.