program test17; 

var
   x, y: boolean;
   z: real = 10;
   d: real = 6;

begin
   x := true;
   y := false;
   d := d + 2;
   writeln(d);
   while x do 
      x := false;
   writeln(x);
   x := true;
   while x do 
      begin
        if (y and d > 12) then
           break;
        d := d + 2; 
        writeln(d);
        y := true;
        writeln(z);
      end;
   writeln(z);
    if (z = d) then
        writeln('hjdsghjgdsjdhgs');
  writeln('Testing while-do statements'); 
end.

(*
Expected Output: 

*)