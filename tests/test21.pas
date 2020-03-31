program test21;
var n, f: real;
function factorial(n: real;): real;
begin
    writeln('help');
  if(n > 1) then
    factorial:= n * factorial(n - 1);
  else
    factorial:=1;
    writeln(factorial);
end;

begin
  writeln('n = ');
  n:= 5;
  f:=factorial(n);
  writeln(n, '! = ',f);
end.

(*
Expected Output 
n = 
help
help
help
help
help
1.0
2.0
6.0
24.0
120.0
5.0! = 120.0

*)