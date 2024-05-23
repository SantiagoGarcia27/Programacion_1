Program Ej8P5;

const Centinela = '=';

var signo,character : Char;
    num, resultado : Integer;

begin
    signo := '_';
    num := 0; 
    resultado := 0;  
    character := ' ';
    read(character);
    repeat
         

       { write(character);}
        case character of
            '+': 
            begin
                {write(resultado,'+',num, '=');}
                resultado:= resultado + num;
                {writeLn(resultado);}
            end;
            '-':
            begin 
                resultado:= resultado - num;
               { writeLn(resultado,'-');}
            end;

            '*': resultado:= resultado * num;
            '/': resultado:= resultado Div num;
            
            else
                begin
                    {writeLn(character,'|',ord(character) - ord('0'));}
                    if ((ord(character) - ord('0')) <= (ord('9') - ord('0'))) AND ((ord(character) - ord('0')) >= (ord('0') - ord('0'))) then
                    begin
                       
                        num := ord(character) - ord('0');
                        {writeLn(num);}
                    end;
                end;
        end;
        read(character);
      
        {write(signo);}
      
    until (character = Centinela);
    writeLn(resultado);
end.