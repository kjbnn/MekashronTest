program test_project;

uses
  Vcl.Forms,
  mmain in 'mmain.pas' {fmMain},
  IBusinessAPI1 in 'IBusinessAPI1.pas',
  mRun in 'mRun.pas',
  dmUnit in 'dmUnit.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
