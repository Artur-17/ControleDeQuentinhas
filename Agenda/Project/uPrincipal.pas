unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, dxSkinsCore,
  dxSkinsDefaultPainters, cxClasses, cxLookAndFeels, dxSkinsForm, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Colorful,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxGraphics, cxLookAndFeelPainters, cxControls,
  dxRibbonSkins, dxRibbonCustomizationForm, dxBar, dxRibbon, cxButtons;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    TimerDataHora: TTimer;
    Quentinha1: TMenuItem;
    Consulta1: TMenuItem;
    Relatrios1: TMenuItem;
    dxSkinController1: TdxSkinController;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxBarManager1: TdxBarManager;
    brmU: TdxBar;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure TimerDataHoraTimer(Sender: TObject);
    procedure btnQuentinhaClick(Sender: TObject);
    procedure btnCadastrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Quentinha1Click(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

  uses uFuncionarios, uTabGlobal, uQuentinhas;

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

procedure TfrmPrincipal.btnQuentinhaClick(Sender: TObject);
begin
  TfrmQuentinhas.ExibirQuentinhas(self);
end;

procedure TfrmPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
   TfrmFuncionarios.exibirFuncionario(self);
end;

procedure TfrmPrincipal.dxBarLargeButton2Click(Sender: TObject);
begin
    TfrmFuncionarios.exibirFuncionario(self);
end;

procedure TfrmPrincipal.dxBarLargeButton3Click(Sender: TObject);
begin
    TfrmQuentinhas.ExibirQuentinhas(self);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
if frmPrincipal.CanFocus then
      frmPrincipal.SetFocus;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja realmente sair?', 'informação',
                      MB_YESNO + MB_ICONQUESTION) = mrYes then
    CanClose := True
  else
    CanClose := False;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =(VK_ESCAPE) then
  Close;
end;

procedure TfrmPrincipal.Quentinha1Click(Sender: TObject);
begin
  TfrmQuentinhas.ExibirQuentinhas(self);
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
