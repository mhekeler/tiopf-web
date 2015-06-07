unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Person_BOM, ExtCtrls, tiFocusPanel, tiVTAbstract, tiVTListView,
  tiVirtualTrees, tiObject;

type
  TForm1 = class(TForm)
    LV: TtiVTListView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LVItemEdit(pVT: TtiCustomVirtualTree; AData: TtiObject;
      AItem: PVirtualNode);
    procedure LVItemDelete(pVT: TtiCustomVirtualTree; AData: TtiObject;
      AItem: PVirtualNode);
    procedure LVItemInsert(pVT: TtiCustomVirtualTree; AData: TtiObject;
      AItem: PVirtualNode);
  private
    FPersonList: TPersonList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  tiOPFManager,
  tiQueryIBX,
//  tiQueryXMLLight,
  tiDialogs,
  tiGUIUtils,
  FPersonEdit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  GTIOPFManager.ConnectDatabase('adrs.fdb', 'SYSDBA', 'masterkey');
//  GTIOPFManager.ConnectDatabase('adrs.XMLLight', '', '');
  FPersonList:= TPersonList.Create;
  FPersonList.Read;
  LV.AddColumn('Title', vttkString, 'Title', 100);
  LV.AddColumn('FirstName', vttkString, 'First Name', 200);
  LV.AddColumn('LastName', vttkString, 'Last Name', 200);
  LV.Data:= FPersonList;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FPersonList.Free;
end;

procedure TForm1.LVItemDelete(pVT: TtiCustomVirtualTree; AData: TtiObject;
  AItem: PVirtualNode);
begin
  if tiObjectConfirmDelete(AData) then
  begin
    AData.Deleted:= True;
    (AData as TPerson).Save;
    FPersonList.FreeDeleted;
    LV.Refresh;
  end;
end;

procedure TForm1.LVItemEdit(pVT: TtiCustomVirtualTree; AData: TtiObject;
  AItem: PVirtualNode);
begin
  if TFormPersonEdit.Execute(AData) then
  begin
    (AData as TPerson).Save;
    LV.Refresh(AData);
  end;
end;

procedure TForm1.LVItemInsert(pVT: TtiCustomVirtualTree; AData: TtiObject;
  AItem: PVirtualNode);
var
  LData: TPerson;
begin
  LData:= TPerson.CreateNew;
  if TFormPersonEdit.Execute(LData) then
  begin
    FPersonList.Add(LData);
    LData.Save;
    LV.Refresh(LData);
  end else
    LData.Free;
  
end;

end.
