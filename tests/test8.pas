program test8;

var 
x, y: boolean; 

begin
    x := true;
    if(not x) then 
        begin
        y := true;
        writeln('true');
        end;
    else
        begin
        y := false;
        writeln('X is true so this executed');
        end;

    case (y) of
      true : begin x := false;  
      writeln('case stometadf'); 
      end;
      false : writeln('Y is false'); 
   end;
end.

(*
Expected Output: 
X is true so this executed 
Y is false 
*)