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
    'À': Ch := 'à';
    'Á': Ch := 'á';
    'Â': Ch := 'â';
    'Ã': Ch := 'ã';
    'Ä': Ch := 'ä';
    'Å': Ch := 'å';
    'Æ': Ch := 'æ';
    'Ç': Ch := 'ç';
    'È': Ch := 'è';
    'É': Ch := 'é';
    'Ê': Ch := 'ê';
    'Ë': Ch := 'ë';
    'Ì': Ch := 'ì';
    'Í': Ch := 'í';
    'Î': Ch := 'î';
    'Ï': Ch := 'ï';
    'Ð': Ch := 'ð';
    'Ñ': Ch := 'ñ';
    'Ò': Ch := 'ò';
    'Ó': Ch := 'ó';
    'Ô': Ch := 'ô';
    'Õ': Ch := 'õ';
    'Ö': Ch := 'ö';
    '×': Ch := '÷';
    'Ø': Ch := 'ø';
    'Ù': Ch := 'ù';
    'Ú': Ch := 'ú';
    'Û': Ch := 'û';
    'Ü': Ch := 'ü';
    'Ý': Ch := 'ý';
    'Þ': Ch := 'þ';
    'ß': Ch := 'ÿ';
    '¨': Ch := '¸';
  END
END;{CharToLowerCase}

FUNCTION ReadLexem(VAR F: TEXT): LexemType;
TYPE SetOfChar = SET OF CHAR;
CONST
  EnLowerCaseChars = ['a' .. 'z'];
  EnUpperCaseChars = ['A' .. 'Z'];
  RuLowerCaseChars = ['à' .. 'ÿ'] + ['¸'];
  RuUpperCaseChars = ['À' .. 'ß'] + ['¨'];
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
