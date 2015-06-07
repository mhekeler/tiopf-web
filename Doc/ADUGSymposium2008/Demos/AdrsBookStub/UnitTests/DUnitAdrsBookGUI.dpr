program DUnitAdrsBookGUI;

uses
  FastMM4,
  GUITestRunner,
  tiOPFManager,
  tiQueryIBX,
  Person_BOM in '..\BOM\Person_BOM.pas',
  Person_TST in 'Person_TST.pas';

{$R *.res}

begin

  GUITestRunner.RunRegisteredTests;
end.
