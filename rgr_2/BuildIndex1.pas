PROGRAM BuildIndex1(INPUT, OUTPUT);
USES Lexer, SortedCollection;   
            
PROCEDURE ReadFileToCollection(VAR F: TEXT);
VAR
  Lexem: LexemType;
BEGIN{ReadFileToCollection} 
  RESET(F); 
  WHILE NOT EOF(F)
  DO
    BEGIN
      WHILE NOT EOLN(F)
      DO
        BEGIN
          Lexem := ReadLexem(F);
          IF Lexem <> ''
          THEN
            Insert(Lexem);
        END;
      READLN(F)  
    END;
END;{ReadFileToCollection}

VAR
  F: TEXT;
BEGIN {BuildIndex1}
  ASSIGN(F, 'F1.TXT');
  ReadFileToCollection(F);
  PrintCollection();  
END. {BuildIndex1}
