program test1;

begin
	4+2;
	a := 3+2*7;
	b := 6-5;
	writeln(a);
	writeln(b);
	writeln('hi');
	writeln(2+8*7);
	writeln(a >= 7);
	begin
	if(false) then
	 writeln('yes');
	 else
	 writeln('no');
	end;
	b := -1;
	writeln(b);
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


(* Expected output 



*)
