unit FPersonEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FtiPerEditDialog, StdCtrls, Buttons, ExtCtrls, tiFocusPanel,
  tiPerAwareCtrls, tiObject;

type
  TFormPersonEdit = class(TFormTIPerEditDialog)
    tiPerAwareEdit1: TtiPerAwareEdit;
    lblErrors: TLabel;
  private
    { Private declarations }
  public
    procedure SetData(const AValue: TtiObject); override;
    function  FormIsValid : boolean; override;
  end;

implementation

{$R *.dfm}

function TFormPersonEdit.FormIsValid: boolean;
//var
//  LS: string;
begin
  result:= True; // To shut the compiler up
//  result:= DataBuffer.IsValid(LS);
//  if LS <> '' then
//    lblErrors.Caption:= ls;
//  lblErrors.Visible:= LS <> '';
end;

procedure TFormPersonEdit.SetData(const AValue: TtiObject);
begin
  inherited;
end;

end.
