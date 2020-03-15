program test13; 

var 
i: real = 4; 
j: real = 8;
operation: real;  
k: real;  
works: boolean = false;
something: boolean = false;  
special: real; 

begin 
readln(k); 
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
        special := 0
    else 
        writeln('special does not equal 0'); 
    end

else 
something := true; 

writeln(something); 
   
end. 

(*
Exxpected Output: 
This is k: 
2.0 (whatever you input k as, in this case we put 2)
12.0 
1.0
2980.9579870417283
special does not equal 0
false
*)
