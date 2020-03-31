program test20;
var
   a, b, c,  min: real;
procedure findMin(x, y, z: real; var m: real;); 
begin
   if (x < y) then
      m:= x;
   else
      m:= y;
   
   if (z < m) then
      m:= z;
   else
      writeln('fsh');
   writeln(m);
end;  

begin
   writeln(a);
   writeln(b);
   writeln(c);
   a := 3;
   b := 9;
   c := 67;
   min := 1;
   writeln('Enter three numbers');
   findMin(a, b, c, min); 
   writeln('Minimum: ', min);
end.

(*
Expected Output: 
0.0
0.0
0.0
Enter three numbers
fsh
3.0
Minimum: 3.0

*)