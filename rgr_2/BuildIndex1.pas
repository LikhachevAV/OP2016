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
  Fin, Fout: TEXT;
BEGIN {BuildIndex1}
  ASSIGN(Fin, 'F1.TXT');
  ASSIGN(Fout, 'F2.TXT');
  ReadFileToCollection(Fin);
  PrintCollection(Fout);  
  ClearCollection();
END. {BuildIndex1}
