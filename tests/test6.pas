program test6;

var 
x, result: boolean; 
var
y: boolean = false;

begin
    x := true;
    x and y;
    result := (x and y) or x;
    writeln(result); 
    //result := x and then y;
    result := x or y;
    //result := x or then y;
    writeln(result); 
    result := not(x or y);
    writeln(result); 
    result := not(x and y);
    writeln(result); 
end.

(*
Expected Output: 
True
True
False
True

*)