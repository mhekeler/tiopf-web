unit FPersonEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FtiPerEditDialog, StdCtrls, Buttons, ExtCtrls, tiFocusPanel,
  tiPerAwareCtrls, tiObject;

type
  TFormPersonEdit = class(TFormTIPerEditDialog)
    lblErrors: TLabel;
    paeTitle: TtiPerAwareEdit;
    paeFirstName: TtiPerAwareEdit;
    paeLastName: TtiPerAwareEdit;
  private
    { Private declarations }
  public
    procedure SetData(const AValue: TtiObject); override;
    function  FormIsValid : boolean; override;
  end;

var
  FormPersonEdit: TFormPersonEdit;

implementation

{$R *.dfm}

function TFormPersonEdit.FormIsValid: boolean;
var
  LS: string;
begin
  result:= DataBuffer.IsValid(LS);
  if LS <> '' then
    lblErrors.Caption:= ls;
  lblErrors.Visible:= LS <> '';
end;

procedure TFormPersonEdit.SetData(const AValue: TtiObject);
begin
  inherited;
  paeTitle.LinkToData(DataBuffer, 'Title');
  paeLastName.LinkToData(DataBuffer, 'LastName');
  paeFirstName.LinkToData(DataBuffer, 'FirstName');
end;

end.
