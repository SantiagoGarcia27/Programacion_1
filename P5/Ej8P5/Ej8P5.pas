Program Ej8P5;

const Centinela = '=';

var signo : Char;
    num, resultado : Integer;

begin
    signo := '+';
    num := 0; 
    resultado := 0;  
    repeat
       
        {case signo of
            '+': resultado:= resultado + num;
            '-': resultado:= resultado - num;
            '*': resultado:= resultado * num;
            '/': resultado:= resultado Div num;
        end;}
        read(num);
        write(num);

        write(signo);
        read(signo);
        write(signo);
      
    until (signo = Centinela);
    writeLn(resultado);
end.