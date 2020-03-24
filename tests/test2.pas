program test2;

var 
taxrate, a, b: real;

var
x: real = 4;
var
choice, isready: boolean;
var
y: boolean = true;


begin
	writeln(x);
	writeln(choice);
   4+2;
	a := 3+2*7;
	b := 6-5;
	a := 9;
	writeln(a);
	writeln(b);
	case (true) of
	true: 
	 	writeln(a);
	false:
	 writeln(b);
	end;
	for i := 0 to 10 do 
		begin
			if(i = 5) then
				writeln(i);
			else
			begin
				a := 8;
				writeln(a);
			end;
		end;
	writeln(b);
	writeln(a);
	while( b >= -1) do
	begin
	  	  writeln(b);
	  	  if (b = 3) then
	  	  begin
	  	  	b := 2-4;
	  	  	continue;
	  	  	writeln(b);
	  	  end;
          else 
          	b := b + 1;
	end;
end.

(*
    Expected Output

*)