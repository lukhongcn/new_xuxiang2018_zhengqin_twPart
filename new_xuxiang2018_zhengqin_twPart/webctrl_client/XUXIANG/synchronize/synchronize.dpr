program synchronize;

uses
  Forms,
  YBMain in 'YBMain.pas' {MainForm},
  unLib in 'unLib.pas',
  YBAbout in 'YBAbout.pas' {AboutBox},
  CVCode in 'cvcode.pas',
  YBOptions in 'YBOptions.pas' {frmOptions},
  YBSynchronize in 'YBSynchronize.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
