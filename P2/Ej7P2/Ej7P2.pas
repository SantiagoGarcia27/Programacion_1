program ErrorRelativoFixer;

var m,v,ErrorRelativo: real;

begin
    m:= 0;
    v:= 0;
    ReadLn(m,v);
    ErrorRelativo := abs(m-v)/v;
    WriteLn('Medicion =',m);
    WriteLn('Valor verdadero =',v);
    WriteLn('Error relativo =',ErrorRelativo)
end.