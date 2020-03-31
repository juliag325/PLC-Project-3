program test18; 

// var
//    x, y: boolean;
//    z: real = 6;
//    i: real;

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
false
4.0
5.0
6.0
7.0
8.0
9.0
10.0
Testing for-do statements
*)