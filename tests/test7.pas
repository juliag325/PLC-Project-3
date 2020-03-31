program test7;

var 
x, result: real; 
var 
y: real = 5;
var
z: real = 3;
var
w: real = 1;

begin
    x := 2;
    result := x * y - w / z + x; 
    writeln(result); 
end.

(*
Expected Output: 
11.666667

*)