unit uQuentinhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.Buttons, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinsDefaultPainters, cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue;

type
  TfrmQuentinhas = class(TForm)
    gpNovoPedido: TGroupBox;
    pnlTop: TPanel;
    Label2: TLabel;
    dtpDataQ: TDateTimePicker;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    memoDescricao: TMemo;
    Label5: TLabel;
    edtCliente: TEdit;
    btnLocalizar: TcxButton;
    btnSalvar: TcxButton;
    btnSair: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
   class procedure ExibirQuentinhas(pOwnwer: Tform);
  end;

var
  frmQuentinhas: TfrmQuentinhas;

implementation
uses
  uTabGlobal, uLocalizarFuncionarios, uFuncionarios;

{$R *.dfm}

{ TfrmQuentinhas }

procedure TfrmQuentinhas.btnLocalizarClick(Sender: TObject);
var
  lFuncionario : TFuncionario;
begin

  lFuncionario := TfrmLocalizarFuncionario.SelecionarFuncionario(self);

  edtCliente.Text := lFuncionario.Nome;
//  ShowMessage( lFuncionario.Nome );

end;

procedure TfrmQuentinhas.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmQuentinhas.btnSalvarClick(Sender: TObject);
var
  lSQL : string;
  DataConvertida : string;
begin

  DataConvertida := TfrmFuncionarios.ConverterPickerDate(dtpDataQ.DateTime);
  try
     lSQL :=
  Format( 'INSERT INTO QUENTINHA' +
          '(OBSERVACAO, VALOR, DT_PEDIDO)' +
          'VALUES ' +
          '(%s,%s,%s)',
          [QuotedStr(memoDescricao.Text),
          QuotedStr(edtValor.Text),
          QuotedStr(DataConvertida)]);

  TTabGlobal.ExecutaSQL(lSQL);
  ShowMessage('Os dados foram inseridos com sucesso');
  except
  ShowMessage('Não foi possível inserir os dados');

  end;

end;

class procedure TfrmQuentinhas.ExibirQuentinhas(pOwnwer: Tform);
var
  frmQuentinhas : TfrmQuentinhas;
begin


  try
    frmQuentinhas := TfrmQuentinhas.Create(pOwnwer);
    frmQuentinhas.ShowModal;
  finally
    if assigned(frmQuentinhas) then
    FreeAndNil(frmQuentinhas);
  end;


end;

procedure TfrmQuentinhas.FormCreate(Sender: TObject);
begin
  memoDescricao.Text := '';
end;

end.
