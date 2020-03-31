program test11;

var 
x: real = 6; 
var
y, k: real;
var
test: boolean = true; 

begin
  y := 5;

if (test) then 
    k := y + x; 
 else
 	k := y - x;

writeln('This is x'); 
writeln(x); 
writeln('This is y'); 
writeln(y); 

end.

(*
Expected Output:
This is x
6.0
This is y
5.0

*)
