unit Scanner;

interface

uses CRT;
const
  ALNG          = 30;
  eof           = #26;
  tab           = #009;
  LineFeed      = #010;
  space         = #032;
  car_return    = #013;

type
  Alfa = string[ALNG];

  { Recognized symbol tokens. }
  tokens = (
         t_int, t_add, t_sub, t_mul, t_rdiv, t_double_mul, t_assign { ':=' }, t_lbrack { '[' }, t_rbrack { ']' }, t_lparent, t_rparent, t_id, t_else, t_if, t_then
  );

const
  num_reserved_word = 3; { Number of reserved word}

  {Recognized reserved word strings. }
  KeyStr : array [1..num_reserved_word] of Alfa = ('else', 'if', 'then');

  { Recognized reserved word Tokens. }
  KeySym : array [1..num_reserved_word] of tokens = (t_else, t_if, t_then);

var
  FIn            : string[12]; { Input file name. }
  FInput         : text; { Input file Pointer. }
  LookAhead      : boolean; { TRUE if had been read ahead, else FALSE. }
  Enum           : boolean; { TRUE if an enumeration delimiter countered. }
  Ch             : char; { Read from FInput. }
  token          : tokens; {Current Token. }
  Id             : Alfa; { Current Identifier. }
  Inum           : longint; { Integer number read, must be in -> integer. }
  LineNumber     : integer;

  procedure initialize; { membuka file }
  procedure scan;
  procedure terminate; { menutup file }

implementation

procedure initialize;
{ initialize variables. }
begin
  if (ParamCount < 1)
  then repeat
    Write('File Sumber (.pas): ');
    ReadLn(FIn);
  until (Length(FIn) <> 0)
  else FIn := ParamStr(1);
  if (Pos('.', FIn) = 0)
  then FIn := FIn + '.pas';
  {$I-}
  Assign(FInput, FIn);
  Reset(FInput);
  {$I+}
  if (IOResult <> 0)
  then begin
    WriteLn('Tidak bisa mengakses File: ''', FIn, '''');
    Halt;
end;

  FIn := Copy(FIn, 1, Pos('.', FIn) - 1) + '.out';

  LookAhead := FALSE;
  Enum := FALSE;
  Ch := ' ';
  LineNumber := 1;
end;

procedure terminate;
begin
  close(FInput);
end;

procedure GetCh;
{ get character from FInput. }
begin
  Read(FInput, Ch);
  end;

procedure error_report(id : byte);
begin
  case id of
  1    : writeln('Error -> unknown character ''', Ch, ''' Line : ', LineNumber);
  2    : writeln('Error -> comment not limited Line', LineNumber);
  3    : writeln('Error -> integer overflow Line', LineNumber);
  end;
  end;

procedure scan;
{ scan input text, and send a token }
var
  Idx  : integer;
  e    : integer;
  begin
    if (not LookAhead)
    then GetCh;
    LookAhead := FALSE;
    repeat
      case Ch of
      tab,LineFeed,space : GetCh;
      car_return :
      begin
      GetCh;
      inc(LineNumber);
      end;
      eof : {end of file}
      Exit;
      'A'..'Z', 'a'..'z':
      begin
        Id:= '';
        repeat
          Id := Id + Ch;
          GetCh;
          until (not (Ch in['0'..'9', 'A'..'Z', 'a'..'z']));
          LookAhead := TRUE;
          Idx := 0;
          repeat
            Idx := Idx + 1;
            until ((Idx = num_reserved_word) or (Id = KeyStr[Idx]));
            if (Id = KeyStr[Idx])
            then token := KeySym[Idx]
            else token := t_id;
            Exit;
            end;
      '0'..'9' : {number}
      begin
          Inum := 0;
          token := t_int;
          repeat
            Inum := Inum * 10 + (ord(Ch) - ord('0'));
            GetCh;
            until (not(Ch in['0'..'9']));
            LookAhead := true;
            Exit;
            end;
      '+' :
      begin
          token := t_add;
          exit;
          end;
     '-' :
     begin
         token := t_sub;
         exit;
         end;
     '*' :
     begin
         GetCh;
         if (ch = '*')
         then token := t_double_mul
         else begin
           token := t_mul;
           LookAhead := TRUE;
           end;
         exit;
         end;
     '/' :
     begin
         token := t_rdiv;
         exit;
         end;
     ')' :
     begin
     token := t_rparent;
     Exit;
     end;
     '[' :
     begin
         token := t_lbrack;
         exit;
         end;
     ']' :
     begin
         token := t_rbrack;
         exit;
         end;
     ':' :
     begin
         GetCh;
         if (Ch = '=')
         then begin
           token := t_assign;
           end
         else begin
             WriteLn('Error -> unknown character '':'' : ', LineNumber);
             LookAhead := TRUE;
             end;
         exit;
         end;
         '(' :
         begin
             GetCh;
             if (Ch <> '*')
             then begin
               token := t_lparent;
               LookAhead := TRUE;
               exit;
               end
             else begin
                 GetCh;
                 if (Ch = eof)
                 then begin
                   error_report(2);
                   exit;
                   end;
                 repeat
                   while (Ch <> '*')
do begin
        GetCh;
        if (Ch = eof) then
        begin
          error_report(2);
          exit;
          end;
        end;
                   GetCh;
                   if (Ch = eof)
                   then begin
                     error_report(2);
                     exit;
                        end;
                   until (Ch = ')');
                   GetCh;
                   end;
             end;
         else
         begin
                 error_report(1);
                 GetCh;
                 end;
         end; {case}
         until FALSE;
         end;
end.
