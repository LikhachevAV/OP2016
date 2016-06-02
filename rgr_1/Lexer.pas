UNIT Lexer;
INTERFACE  
  CONST
  MaxLexemLength = 50;
TYPE
  LexemType = STRING[MaxLexemLength];
FUNCTION ReadLexem(VAR F: TEXT): LexemType;

IMPLEMENTATION

PROCEDURE CharToLowerCase(VAR Ch: CHAR);
BEGIN{CharToLowerCase}
  CASE Ch OF
    'A': Ch := 'a';
    'B': Ch := 'b';
    'C': Ch := 'c';
    'D': Ch := 'd';
    'E': Ch := 'e';
    'F': Ch := 'f';
    'G': Ch := 'g';
    'H': Ch := 'h';
    'I': Ch := 'i';
    'J': Ch := 'j';
    'K': Ch := 'k';
    'L': Ch := 'l';
    'M': Ch := 'm';
    'N': Ch := 'n';
    'O': Ch := 'o';
    'P': Ch := 'p';
    'Q': Ch := 'q';
    'R': Ch := 'r';
    'S': Ch := 's';
    'T': Ch := 't';
    'U': Ch := 'u';
    'V': Ch := 'v';
    'W': Ch := 'w';
    'X': Ch := 'x';
    'Y': Ch := 'y';
    'Z': Ch := 'z';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
    '�': Ch := '�';
  END
END;{CharToLowerCase}

FUNCTION ReadLexem(VAR F: TEXT): LexemType;
TYPE SetOfChar = SET OF CHAR;
CONST
  EnLowerCaseChars = ['a' .. 'z'];
  EnUpperCaseChars = ['A' .. 'Z'];
  RuLowerCaseChars = ['�' .. '�'] + ['�'];
  RuUpperCaseChars = ['�' .. '�'] + ['�'];
  ValidChars = EnLowerCaseChars + EnUpperCaseChars + RuLowerCaseChars + RuUpperCaseChars;  
VAR
  OutLexem: LexemType;
  Ch, PrevCh: CHAR;                                                                        
  Stop: BOOLEAN; 
BEGIN{ReadLexem}
  OutLexem := '';
  Ch := ' ';
  PrevCh := ' ';
  Stop := FALSE;
  WHILE NOT Stop
  DO
    BEGIN
      READ(F, Ch);
      IF Ch IN ValidChars
      THEN
        BEGIN
          IF (PrevCh = '-') AND (OutLexem <> '')
          THEN
            OutLexem := OutLexem + '-';
          CharToLowerCase(Ch);
          OutLexem := OutLexem + Ch;
        END;
      PrevCh := Ch;
      Stop := (EOF(F) OR EOLN(F) OR (NOT (Ch IN ValidChars) AND (Ch <> '-')));
    END;
  ReadLexem := OutLexem
END;{ReadLexem}    

BEGIN{Lexem}
END.{Lexem}
