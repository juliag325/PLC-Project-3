program test12; 

var 
days: real; 
isLeapYear: boolean = true; 
special: real; 
divide: real = 4; 
i: real = 2; 

begin
if (isLeapYear) then 
    begin
        if(isLeapYear)then 
        writeln(i);
        else writeln('dsghfaj');
    end;
else 
    writeln('nothing'); 
    
special := sin(i*4); 
writeln(special); 


end. 

(*
Expected Output:
2.0
0.98935824662
*)
