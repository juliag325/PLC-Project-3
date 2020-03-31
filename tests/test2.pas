program test2; 

var 
    i: real; 

begin 
i:= 10; 
for i := 0 to 10 do 
    begin 

    if (i >= 4) then 
        continue; 
    else
        writeln('why');
    writeln('the value of i is ', i); 

    end; 
    
end. 

(*
why
the value of i is 0
why
the value of i is 1
why
the value of i is 2
why
the value of i is 3

*)