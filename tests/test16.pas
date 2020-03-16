program test16; 

// var
//    x, y: boolean;

begin
   x := true;
   y := true;
   
   
   case (x) of
      true: begin
         writeln('This  is part of outer statement');
         case (y) of
            true: writeln('This  is part of inner statement' );
            false: writeln('y is false'); 
            end;
         end;
      false:  writeln('This  is part of outer statement');
      end;
   
  writeln('Testing nested case statements'); 
end.

(*
Expected Output: 
This is part of outer statement 
This is part of inner statement
Testing nested case statements 
*)