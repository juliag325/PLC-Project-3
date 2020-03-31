program test10;

var 
x: real = 4; 
var
j, r: real;
var
correct: boolean = true; 
var
somethingelse: boolean = true; 

begin
    if (correct) then 
        writeln('The value of x is 4'); 
    
    else 
        writeln(x);  
end.

(*
Expected Output:
The value of x is 4

*)