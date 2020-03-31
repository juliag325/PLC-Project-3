program test22;
var n, f: real;
function factorial(n: real;): real;
begin
    factorial:= 1;
    writeln('help');
  while (n >=1) do
  begin
    factorial :=  factorial * n;
    n := n - 1;
    writeln(n);
  end;   
end;

begin
  writeln('n = ');
  n := 6;
  f:=factorial(n);
  writeln(f);
  writeln(n, '! = ',f);
end.

(*
Expected Output: 
n = 
2             // 2 is the user input 
help
1.0
0.0
2.0
2.0! = 2.0
*)