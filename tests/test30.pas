program test30;

var a, b, f : real;
var g : real;

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
  a := 9;
  writeln('b = ');
  b := 7;
  f:=greatestCommonDivisor(a, b);
  writeln('not gcd of ', a, ' and ', b, ' is ', f);
end.

(* Expected Output
a = 
32 //user input
b = 
2 //user input
temp 2.0
b 30.0
a 2.0
temp 30.0
b -28.0
a 30.0
not gcd of 32.0 and 2.0 is 30.0
*)