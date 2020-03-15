program test19;
var
   a, b, ret, ter : real;
function maxi(): real; 
var
   (* local variable declaration *)
   result: real = 7;

begin
    result := 2;
    result := 5;
    maxi := result;
end;

(*function definition *)
function max(): real; 
var
   (* local variable declaration *)
   result: real = 7;

begin
    result := 2;
    result := 3;
    max := result;
    max := maxi();
end;

function min(): real; 
var
   (* local variable declaration *)
   res: real;

begin
    res := max();
    min := res;
end;


begin
   a := 100;
   b := 200;
   (* calling a function to get max value *)
   ret := max();
   writeln( 'Max value is : ', ret );
   ter := min();
   writeln('Min value is : ', ter);

end.