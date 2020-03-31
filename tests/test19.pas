program test19;
var
   a, b, ret, ter : real;

function maxi(a: real;): real; 
var

   result: real = 7;

begin
    a := 2;
    result := 5;
    maxi := result;
end;


function max(b:real;): real; 
var

   result: real = 7;

begin
    b := 2;
    result := 3;
    max := result;
    max := maxi(6);
end;

function min(g:real;): real; 
var

   res: real;

begin
    res := max(89);
    g:=res;
    min := g;
end;


begin
   a := 100;
   b := 200;

   ret := max(67);
   writeln( 'Max value is : ', ret );
   ter := min(3);
   writeln('Min value is : ', ter);

end.

(*
Expected Output: 
Max value is : 5.0
Min value is : 5.0

*)