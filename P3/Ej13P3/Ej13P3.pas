program Ej13P3;

const BaseNumero = 16;

var 
a,b,c : char;
n1,n2,n3,centenas,decimales,unidades : integer;

begin
    write('Ingrese numero positivo hexedecimal de 3 cifras:');
    Readln(a,b,c);

    if ((ord(a)-ord('0')) >= 0) and ((ord(a)-ord('0')) <= 9) then   
    begin
        n1:= ord(a)-ord('0')
    end;
    if ((ord(b)-ord('0')) >= 0) and ((ord(b)-ord('0')) <= 9) then   
    begin
        n2:= ord(a)-ord('0')
    end;
    if ((ord(c)-ord('0')) >= 0) and ((ord(c)-ord('0')) <= 9) then   
    begin
        n3:= ord(c)-ord('0')
    end;

    case a of
        'A': n1:= 10;
        'B': n1:= 11;
        'C': n1:= 12;
        'D': n1:= 13;
        'E': n1:= 14;
        'F': n1:= 15;
    end;
    case b of
        'A': n2:= 10;
        'B': n2:= 11;
        'C': n2:= 12;
        'D': n2:= 13;
        'E': n2:= 14;
        'F': n2:= 15;
    end;
    case c of
        'A': n3:= 10;
        'B': n3:= 11;
        'C': n3:= 12;
        'D': n3:= 13;
        'E': n3:= 14;
        'F': n3:= 15;
    end;

    centenas := n1 * sqr(BaseNumero);
    decimales := n2 * BaseNumero;
    unidades := n3;

    writeLn('Hexadecimal:',a,b,c,'=  Decimal:',centenas +decimales + unidades);
end.