program test7;

var 
x, result: real; 
y: real = 0.5;
z: real = 3.5;
w: real = 0.1;

begin
    x := 2;
    result := x * y - w / z + x; 
    writeln(result); 
end.

(*
Expected Output: 
-1.0285714285714285
*)