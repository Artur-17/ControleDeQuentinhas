program Agenda;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFuncionarios in 'uFuncionarios.pas' {frmFuncionarios},
  uTabGlobal in 'uTabGlobal.pas' {TabGlobal: TDataModule},
  uQuentinhas in 'uQuentinhas.pas' {frmQuentinhas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTabGlobal, TabGlobal);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.                                                         -
