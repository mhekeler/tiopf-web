unit Person_TST;

interface
uses
  tiTestFramework,
  Person_BOM;

type

  TPersonTestCase = class(TtiTestCase)
  published
    procedure Person_Read;
  end;

implementation
uses
  tiOPFManager,
  tiQuery,
  tiDialogs,
  TestFramework;

{ TPersonTestCase }

procedure TPersonTestCase.Person_Read;
begin
  Assert(False, 'Under construction');
end;

initialization
  RegisterTest(TPersonTestCase.Suite);

end.
