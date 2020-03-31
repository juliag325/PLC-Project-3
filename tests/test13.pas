program test13; 

var 
i: real = 4;
var 
j: real = 8;
var
operation: real;
var  
k: real = 2; 
var
works: boolean = false;
var
something: boolean = false;  
var
special: real; 

begin 
writeln('This is k: '); 
writeln(k);

operation := i + j; 
writeln(operation); 

operation := i * k / j; 
writeln(operation); 

works := true; 

if (works) then 
    begin 
    special := exp(j);
    writeln(special); 
    if (something) then 
        special := 0;
    else 
        writeln('special does not equal 0'); 
    end;

else 
something := true; 

writeln(something); 
   
end. 

(*
Exxpected Output: 
This is k: 
2.0
12.0
1.0
2980.958
special does not equal 0
False

*)
