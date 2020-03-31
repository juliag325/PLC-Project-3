program test18; 

var
x, y: boolean;
var
z: real = 6;
var
i: real;

begin
   x := true;
   y := false;
   
    for i := 0 to 10 do 
      x := false;

    writeln(x);

    for i := 0 to 10 do 
      begin
        if (i < 3) then
        begin
           x:= false;
           continue;
        end;
        else
          z := z + 2;
        writeln(i);
        if (not y) then 
          y := true;
        else 
          y := true;
      end;
   
  writeln('Testing for-do statements'); 
end.

(*
Expected Output: 
False
3
4
5
6
7
8
9
10
Testing for-do statements

*)