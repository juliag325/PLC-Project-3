program test5;

var 
x, sum, diff, mult, divi: real; 
var y : real = 5;

begin
    x := 2;
    sum := x + y;
    writeln(sum);
    diff := x - y;
    writeln(diff); 
    mult := x * y;
    writeln(mult); 
    divi := x / y;
    writeln(divi); 
end.

(*
Expected Output: 
7.0
-3.0
10.0
0.4

*)