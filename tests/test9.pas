program test9;

var 
x: real = 4; 
a, r: real; 
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
true 
2.0         (this is the sqrt of x)
54.598150033144236  (this is exp(4))
0.8414709848078965  (this is sin(1))
0.5403023058681398  (this is cos(1))
0.0     (this is ln(1))
*)