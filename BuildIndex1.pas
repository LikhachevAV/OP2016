PROGRAM BuildIndex1(INPUT, OUTPUT);
USES Lexer, SortedCollection;   
            
PROCEDURE ReadFileToTree(VAR F: TEXT);
VAR
  Lexem: LexemType;
BEGIN{ReadFileToTree} 
  RESET(F); 
  WHILE NOT EOF(F)
  DO
    BEGIN
      WHILE NOT EOLN(F)
      DO
        BEGIN
          Lexem := ReadLexem(F);
          IF NOT (Lexem = '')
          THEN
            Insert(Lexem);
        END;
      READLN(F)  
    END;
END;{ReadFileToTree}

VAR
  F: TEXT;
BEGIN {TreeSort}
  ASSIGN(F, 'F1.TXT');
  ReadFileToTree(F);
  PrintTree();  
END. {TreeSort}
