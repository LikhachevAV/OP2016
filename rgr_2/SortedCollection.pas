UNIT SortedCollection;

INTERFACE
USES Lexer;
             
PROCEDURE PrintCollection(VAR F: TEXT);
PROCEDURE Insert(Lexem: LexemType);
PROCEDURE ClearCollection();

IMPLEMENTATION

TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Lexem: LexemType;
               LLink, RLink: Tree;
               Count: INTEGER;
             END;  
VAR
  Root: Tree;
  
PROCEDURE LocalInsert(VAR Ptr: Tree; VAR Lexem: LexemType);
BEGIN {LocalInsert}
  IF Ptr = NIL
  THEN{Add new leaf to tree with Lexem value}
    BEGIN
      New(Ptr);
      Ptr^.Lexem := Lexem;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Count := 1;
    END
  ELSE
    IF Ptr^.Lexem > Lexem
    THEN
      LocalInsert(Ptr^.LLink, Lexem)
    ELSE
      BEGIN
        IF Ptr^.Lexem < Lexem
        THEN
          LocalInsert(Ptr^.RLink, Lexem)
        ELSE
          Ptr^.Count := Ptr^.Count + 1
      END
END; {LocalInsert} 

PROCEDURE Insert(Lexem: LexemType);
BEGIN{Insert}
  LocalInsert(Root, Lexem)
END;{Insert} 

PROCEDURE LocalPrintTree(Ptr: Tree; VAR F: TEXT);
BEGIN {LocalPrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      LocalPrintTree(Ptr^.LLink, F);
      WRITE(F, Ptr^.Lexem, ' ', Ptr^.Count);
      WRITELN(F);
      LocalPrintTree(Ptr^.RLink, F)
    END
END; {LocalPrintTree}

PROCEDURE PrintCollection(VAR F: TEXT);
BEGIN{PrintCollection}
  REWRITE(F);
  LocalPrintTree(Root, F);
  CLOSE(F);
END;{PrintCollection}

PROCEDURE LocalClearCollection(Ptr: Tree);
BEGIN{LocalClearCollection}
  IF Ptr <> NIL
  THEN
    BEGIN
      LocalClearCollection(Ptr^.LLink);
      DISPOSE(Ptr);
      LocalClearCollection(Ptr^.RLink)  
    END;
END;{LocalClearCollection}

PROCEDURE ClearCollection();
BEGIN{ClearCollection}
  LocalClearCollection(Root)
END;{ClearCollection}

BEGIN{SortedCollection}
  Root := NIL
END.{SortedCollection}
