unit Person_BOM;

interface
uses
  tiObject;

type

  TPerson = class;
  TPersonList = class;

  TPersonList = class(TtiObjectList)
  private
  protected
    function    GetItems(i: integer): TPerson; reintroduce;
    procedure   SetItems(i: integer; const AValue: TPerson); reintroduce;
  public
    property    Items[i:integer] : TPerson read GetItems write SetItems;
    procedure   Add(AObject : TPerson); reintroduce;
    procedure   Read; override;
  published
  end;

  TPerson = class(TtiObject)
  private
    FLastName: string;
    FInitials: string;
    FTitle: string;
    FFirstName: string;
  protected
    function    GetParent: TPersonList; reintroduce;
  public
    property    Parent: TPersonList read GetParent;
    function    IsValid(const AErrors: TtiObjectErrors): boolean; override;
    procedure   Save; override;
  published
    property Title: string read FTitle write FTitle;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Initials: string read FInitials write FInitials;
  end;

implementation
uses
  tiOPFManager,
  tiAutoMap;

{ TPersonList }

procedure TPersonList.Add(AObject: TPerson);
begin
  inherited Add(AObject);
end;

function TPersonList.GetItems(i: integer): TPerson;
begin
  result:= inherited GetItems(i) as TPerson;
end;

procedure TPersonList.Read;
begin
  inherited;
end;

procedure TPersonList.SetItems(i: integer; const AValue: TPerson);
begin
  inherited SetItems(i, AValue);
end;

{ TPerson }

function TPerson.GetParent: TPersonList;
begin
  result:= inherited GetParent as TPersonList;
end;

function TPerson.IsValid(const AErrors: TtiObjectErrors): boolean;
begin
  inherited IsValid(AErrors);
  if (FirstName = '') and (LastName = '') then
    AErrors.AddError('Please enter the person''s name');
  result:= AErrors.Count = 0;  
end;

procedure TPerson.Save;
begin
  inherited;
end;

initialization
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 'person', 'OID', 'oid', [pktDB]);
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 'person', 'LastName',  'last_name');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 'person', 'FirstName', 'first_name');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 'person', 'Title',     'title');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 'person', 'Initials',  'initials');
  GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TPersonList, TPerson);

end.
