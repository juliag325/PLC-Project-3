program test5;

var 
x, sum, diff, mult, divi: real; 
y: real = 0.5;

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
2.5 
1.5 
1.0 
4.0
*)