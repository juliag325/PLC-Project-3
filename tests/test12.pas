program test12; 

//var 
//days: real; 
//isLeapYear: boolean = true; 
//special: real; 
//divide: real = 4; 
//i: real = 2; 

begin
if (isLeapYear) then 
    begin
        if(isLeapYear)then 
        //readln(i) 
        writeln(i);
        else writeln('dsghfaj');
        writeln(i); 
    end;
else 
    writeln('nothing'); 
    
special := sin(i*4); 
writeln(special); 

divide := divide / 0; 
writeln(divide); 

end. 

(*
Expected Output:
2.0 (this was readln(i))
0.9893582466233818 (this is the variable special)
Infinity (divide by 0; please refer to README.md)
*)
