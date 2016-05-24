UNIT SortedCollection;

INTERFACE
USES Lexer;
             
PROCEDURE PrintTree();
PROCEDURE Insert(Lexem: LexemType);

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
  THEN{Add new leaf to tree with Data value}
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

PROCEDURE LocalPrintTree(Ptr: Tree);
BEGIN {LocalPrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      LocalPrintTree(Ptr^.LLink);
      WRITE(Ptr^.Lexem, ' ', Ptr^.Count);
      WRITELN;
      LocalPrintTree(Ptr^.RLink)
    END
END; {LocalPrintTree}

PROCEDURE PrintTree();
BEGIN{PrintTree}
  LocalPrintTree(Root)
END;{PrintTree}

BEGIN{TreeUtils}
  Root := NIL
END.{TreeUtils}
