unit Person_TST;

interface
uses
  tiTestFramework,
  tiTestSetup,
  Person_BOM;

const
  COIDPerson1 = '1000';
  COIDPerson2 = '1001';

type

  TPersonSetup = class(TtiTestSetup)
  public
    procedure PersonAssign(const APerson: TPerson; const AOID: string);
    function  PersonCreate(const AOID: string): TPerson;
    procedure PersonInsert(const AOID: string);
    procedure PersonCheck(const APerson: TPerson; const AOID: string);
  end;

  TPersonTestCase = class(TtiTestCase)
  private
    FPersonSetup: TPersonSetup;
  protected
    procedure SetUpOnce; override;
    procedure SetUp; override;
    procedure TearDownOnce; override;

    property  PersonSetup: TPersonSetup read FPersonSetup;
  published
    procedure Person_Read;
    procedure Person_Save;
    procedure Person_Update;
    procedure Person_Delete;
  end;

implementation
uses
  tiOPFManager,
  TestFramework,
  tiDialogs,
  tiQuery,
  tiObject,
  tiConstants;

{ TPersonTestCase }

procedure TPersonTestCase.Person_Delete;
var
  LList: TPersonList;
begin
  PersonSetup.PersonInsert(COIDPerson1);

  LList:= TPersonList.Create;
  try
    LList.Read;
    CheckEquals(1, LList.Count);
    LList.Items[0].Deleted:= True;
    LList.Items[0].Save;
  finally
    LList.Free;
  end;

  LList:= TPersonList.Create;
  try
    LList.Read;
    CheckEquals(0, LList.Count);
  finally
    LList.Free;
  end;

end;

procedure TPersonTestCase.Person_Read;
var
  LList: TPersonList;
begin
  PersonSetup.PersonInsert(COIDPerson1);

  LList:= TPersonList.Create;
  try
    LList.Read;
    CheckEquals(1, LList.Count);
    PersonSetup.PersonCheck(LList.Items[0], COIDPerson1);
  finally
    LList.Free;
  end;
end;

procedure TPersonTestCase.Person_Save;
var
  LItem: TPerson;
  LList: TPersonList;
begin
  LItem := PersonSetup.PersonCreate(COIDPerson1);
  try
    LItem.Dirty:= True;
    LItem.Save;
    CheckObjectState(posClean, LItem);
  finally
    LItem.Free;
  end;

  LList := TPersonList.Create;
  try
    LList.Read;
    CheckEquals(1, LList.Count);
    PersonSetup.PersonCheck(LList.Items[0], COIDPerson1);
  finally
    LList.Free;
  end;
end;

procedure TPersonTestCase.Person_Update;
var
  LList: TPersonList;
begin
  PersonSetup.PersonInsert(COIDPerson1);

  LList:= TPersonList.Create;
  try
    LList.Read;
    PersonSetup.PersonAssign(LList.Items[0], COIDPerson2);
    LList.Items[0].Dirty:= True;
    LList.Items[0].Save;
  finally
    LList.Free;
  end;

  LList:= TPersonList.Create;
  try
    LList.Read;
    CheckEquals(1, LList.Count);
    PersonSetup.PersonCheck(LList.Items[0], COIDPerson2);
  finally
    LList.Free;
  end;

end;

procedure TPersonTestCase.SetUp;
begin
  inherited;
  GTIOPFManager.DeleteRow('adrs', nil);
  GTIOPFManager.DeleteRow('eadrs', nil);
  GTIOPFManager.DeleteRow('adrs_type', nil);
  GTIOPFManager.DeleteRow('eadrs_type', nil);
  GTIOPFManager.DeleteRow('person', nil);
end;

procedure TPersonTestCase.SetUpOnce;
begin
  inherited;
  FPersonSetup:= TPersonSetup.Create(Self);
  GTIOPFManager.DefaultPersistenceLayerName:= CTIPersistXMLLight;
end;

procedure TPersonTestCase.TearDownOnce;
begin
  FPersonSetup.Free;
  inherited;
end;

{ TPersonTestSetup }

procedure TPersonSetup.PersonAssign(const APerson: TPerson;
  const AOID: string);
begin
  APerson.Title:= tvToStr(AOID, 1);
  APerson.FirstName:= tvToStr(AOID, 2);
  APerson.Initials:= tvToStr(AOID, 3);
  APerson.LastName:= tvToStr(AOID, 4);
end;

procedure TPersonSetup.PersonCheck(const APerson: TPerson;
  const AOID: string);
var
  LItem: TPerson;
begin
  LItem:= PersonCreate(AOID);
  try
    TC.CheckEquals(LItem.Title, APerson.Title, 'Title');
    TC.CheckEquals(LItem.FirstName, APerson.FirstName, 'FirsName');
    TC.CheckEquals(LItem.Initials, APerson.Initials, 'Initials');
    TC.CheckEquals(LItem.LastName, APerson.LastName, 'LastName');
  finally
    LItem.Free;
  end;
end;

function TPersonSetup.PersonCreate(const AOID: string): TPerson;
begin
  result:= TPerson.Create;
  result.OID.AsString:= AOID;
  PersonAssign(result, AOID);
end;

procedure TPersonSetup.PersonInsert(const AOID: string);
var
  LItem: TPerson;
  LParams: TtiQueryParams;
begin
  LItem:= nil;
  LParams:= nil;
  try
    LItem:= PersonCreate(AOID);
    LParams:= TtiQueryParams.Create;
    LParams.SetValueAsString('oid', LItem.OID.AsString);
    LParams.SetValueAsString('title', LItem.Title);
    LParams.SetValueAsString('first_name', LItem.FirstName);
    LParams.SetValueAsString('initials', LItem.Initials);
    LParams.SetValueAsString('last_name', LItem.LastName);
    GTIOPFManager.InsertRow('person', LParams);
  finally
    LItem.Free;
    LParams.Free;
  end;
end;

initialization
  RegisterTest(TPersonTestCase.Suite);

end.
