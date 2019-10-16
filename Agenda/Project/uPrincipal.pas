unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    pnlTop: TPanel;
    btnCadastrar: TButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Label1: TLabel;
    TimerDataHora: TTimer;
    Button1: TButton;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure TimerDataHoraTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCadastrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

  uses uFuncionarios, uTabGlobal;

{$R *.dfm}

procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
begin
  TfrmFuncionarios.exibirFuncionario(self);
end;

procedure TfrmPrincipal.btnCadastrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    begin



    end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  TTabGlobal.ExecutaSQL(
  'INSERT INTO FUNCIONARIOS ' +
  '(NOME, EMAIL, BAIRRO, CIDADE, TELEFONE, CEP, DT_NASCIMENTO, OBS) ' +
  'VALUES (''Joaquim'', ''Teste'', ''Teste'', ''sj'', ''cep'', ''22'', ''25'', ''chega'')');
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
   frmFuncionarios.ShowModal;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
if frmPrincipal.CanFocus then
      frmPrincipal.SetFocus;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Deseja realmente sair?', 'informação', MB_YESNO+MB_ICONQUESTION) = mrYes then
  Application.Terminate;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =(VK_ESCAPE) then
  Close;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.TimerDataHoraTimer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Data: ' + datetostr (date);
  StatusBar1.Panels[2].Text := 'Hora: ' + timetostr (time);
end;

end.
