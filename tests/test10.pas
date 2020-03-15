program test10;

var 
x: real = 4; 
j, r: real;
correct: boolean = true; 
somethingelse: boolean = true; 

begin
    if (correct) then 
        writeln('The value of x is 4') 
    
    else 
        writeln(x);  
end.

(*
Expected Output:
The value ofx is 4
*)