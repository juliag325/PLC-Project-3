program test30;

var a, b, f : real;

function greatestCommonDivisor(a, b: real;): real;
var
    temp: real;
begin
  while (b >= 0) do
  begin
    temp := b;
    writeln('temp ', temp);
    b := a - b ;
    writeln('b ', b);
    a := temp;
    writeln('a ', a);
  end;
  greatestCommonDivisor := a;
end;


begin
  writeln('a = ');
  writeln('b = ');
  a:= 89;
  b:= 893;
  f:=greatestCommonDivisor(a, b);
  writeln('not gcd of ', a, ' and ', b, ' is ', f);
end.

(* Expected Output
a = 
b = 
temp 893.0
b -804.0
a 893.0
not gcd of 89.0 and 893.0 is 893.0

*)