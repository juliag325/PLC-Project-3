program test17; 


var
   x, y: boolean;
<<<<<<< HEAD
   z: real = 10;
=======
var
   z: real = 10;
var
>>>>>>> 20e93600ed3eb3d44ad0d5856047d2deb093e3d6
   d: real = 6;


begin
   x := true;
   y := false;
   d := d + 2;
   writeln(d);
   while (x) do 
      x := false;
   writeln(x);
   x := true;
   while (x) do 
      begin
        if (y and d > 12) then
        //if ( d > 12) then
           break;
        else 
          d := d + 2; 
        writeln(d);
        y := true;
        writeln(z);
      end;
   writeln(z);
    if (z = d) then
        writeln('hjdsghjgdsjdhgs');
    else
      writeln('whyyyyy');
  writeln('Testing while-do statements'); 
end.

(*
Expected Output: 
8.0
False
10.0
10.0
12.0
10.0
14.0
10.0
10.0
whyyyyy
Testing while-do statements

*)