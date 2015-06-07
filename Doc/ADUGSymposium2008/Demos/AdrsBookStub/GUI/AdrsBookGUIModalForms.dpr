program AdrsBookGUIModalForms;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  FPersonEdit in 'FPersonEdit.pas' {FormPersonEdit},
  FtiPerEditDialog in 'ParentForms\FtiPerEditDialog.pas' {FormTIPerEditDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
