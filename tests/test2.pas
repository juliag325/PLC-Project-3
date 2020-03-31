program test2; 

var 
    i: real; 

begin 
i: = 10; 
for i := 0 to 10 do 
    begin 

    if (i >= 4) then 
        continue; 
    
    writeln('the value of i is ', i); 

    end; 
    
end. 

(*
the value of i is 0.0
the value of i is 1.0
the value of i is 2.0
the value of i is 3.0
*)