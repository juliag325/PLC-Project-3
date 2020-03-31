program test9;

var 
x: real = 4; 
var
a, r: real; 
var
here: boolean = true; 

begin
    writeln(here); 
    writeln(x);
    writeln(sqrt(x));
    writeln(exp(x));
    writeln(sin(1));
    writeln(cos(1));
    writeln(ln(1));
end.

(*
Expected Output:
True
4.0
2.0
54.59815
0.84147096
0.5403023
0.0

*)