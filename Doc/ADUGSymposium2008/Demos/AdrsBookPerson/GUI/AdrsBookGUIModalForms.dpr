program AdrsBookGUIModalForms;

uses
  Forms,
  FMain in 'FMain.pas' {Form1},
  FPersonEdit in 'FPersonEdit.pas' {FormPersonEdit},
  FtiPerEditDialog in 'ParentForms\FtiPerEditDialog.pas' {FormTIPerEditDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormPersonEdit, FormPersonEdit);
  Application.Run;
end.
