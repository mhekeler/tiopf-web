program DUnitAdrsBookGUI;

uses
  FastMM4,
  GUITestRunner,
  tiQueryIBX,
//  tiQueryXMLLight,
  tiConstants,
  tiOPFManager,
  Person_BOM in '..\BOM\Person_BOM.pas',
  Person_TST in 'Person_TST.pas';

{$R *.res}

begin
  GTIOPFManager.ConnectDatabase('adrs.fdb', 'SYSDBA', 'masterkey', '', CTIPersistIBX);
//  GTIOPFManager.ConnectDatabase('adrs.XMLLight', '', '', '', CTIPersistXMLLight);

  GUITestRunner.RunRegisteredTests;
end.
