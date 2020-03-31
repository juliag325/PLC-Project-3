program test14; 

var 
days: real; 
var
endGame: boolean = true; 
var
playing: boolean = true;
var
score: real; 
var
specialScore: real; 
var
playerOne: real = 0; 
var
playerTwo: real = 0; 
var
input: real = 2;

begin
if (endGame) then 
    begin
        if(playing)then 
        playerOne := playerOne + 1;
        else writeln('playerOne');
        playerTwo := playerTwo + 30; 
    end;
else writeln('No game exists'); 
    
score := playerOne + playerTwo; 
specialScore := cos(30 * score); 

writeln('This is the score: ');
writeln(score); 
writeln('This is the special score: '); 
writeln(specialScore);

writeln(input); 

end. 

(*
Expected Output: 
This is the score: 
31.0
This is the special score: 
0.99607986
2.0

*)