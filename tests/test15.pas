program test15; 

var 
correct: boolean = true; 
i, j: real; 
isEmpty: boolean = true; 

begin 
begin
writeln('First begin block');
begin
writeln('Testing nested blocks');
if(correct)then
    begin
        correct := false;
        if(correct) then
             writeln('Correct is true')
        else
            begin
            if(not isEmpty) then
                writeln('This should not print')
            else
                if(isEmpty) then
                writeln('IsEmpty is true');
            end;
    end;
end;
end;

end. 

(*
Expected Output: 
First begin block 
Testing nested blocks 
IsEmpty is true 
*)