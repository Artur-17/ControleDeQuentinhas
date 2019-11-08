unit uLocalizarFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFuncionario = record
    Id : Integer;
    Nome : string;
    Email : string;
    Bairro : string;
    Cidade : string;
    cep : String;
    telefone: String;
    DataNascimento : TDateTime;
    Obs : string;
  end;

  TfrmLocalizarFuncionario = class(TForm)
    pnlBottom: TPanel;
    pnlTop: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    edtNomeFuncionario: TEdit;
    qryFuncionario: TFDQuery;
    dtsFuncionario: TDataSource;
    qryFuncionarioCODIGO: TIntegerField;
    qryFuncionarioNOME: TStringField;
    qryFuncionarioEMAIL: TStringField;
    qryFuncionarioBAIRRO: TStringField;
    qryFuncionarioCIDADE: TStringField;
    qryFuncionarioCEP: TStringField;
    qryFuncionarioTELEFONE: TStringField;
    qryFuncionarioDT_NASCIMENTO: TDateField;
    qryFuncionarioOBS: TStringField;
    gridFuncionarios: TcxGrid;
    gridFuncionariosView: TcxGridDBTableView;
    gridFuncionariosViewCODIGO: TcxGridDBColumn;
    gridFuncionariosViewNOME: TcxGridDBColumn;
    gridFuncionariosViewEMAIL: TcxGridDBColumn;
    gridFuncionariosViewBAIRRO: TcxGridDBColumn;
    gridFuncionariosViewCIDADE: TcxGridDBColumn;
    gridFuncionariosViewCEP: TcxGridDBColumn;
    gridFuncionariosViewTELEFONE: TcxGridDBColumn;
    gridFuncionariosViewDT_NASCIMENTO: TcxGridDBColumn;
    gridFuncionariosViewOBS: TcxGridDBColumn;
    gridFuncionariosLevel: TcxGridLevel;
    procedure edtNomeFuncionarioChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FFuncionario : TFuncionario;
    procedure FiltrarFuncionario;
    { Private declarations }
  public
    { Public declarations }
    class function SelecionarFuncionario(pOwner : Tform) : TFuncionario;

  end;

var
  frmLocalizarFuncionario: TfrmLocalizarFuncionario;

implementation

uses
  uTabGlobal;

{$R *.dfm}


procedure TfrmLocalizarFuncionario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocalizarFuncionario.btnConfirmarClick(Sender: TObject);
var
  lFuncionario : TFuncionario;
begin
  lFuncionario.Id := qryFuncionarioCODIGO.AsInteger;
  lFuncionario.Nome := qryFuncionarioNOME.AsString;
  lFuncionario.Email := qryFuncionarioEMAIL.AsString;
  lFuncionario.Bairro := qryFuncionarioBAIRRO.AsString;
  lFuncionario.Cidade := qryFuncionarioCIDADE.AsString;
  lFuncionario.cep := qryFuncionarioCEP.AsString;
  lFuncionario.telefone := qryFuncionarioTELEFONE.AsString;
  lFuncionario.DataNascimento := qryFuncionarioDT_NASCIMENTO.AsDateTime;
  lFuncionario.Obs := qryFuncionarioOBS.AsString;

  FFuncionario := lFuncionario;

  Close;
end;

procedure TfrmLocalizarFuncionario.edtNomeFuncionarioChange(Sender: TObject);
begin
  FiltrarFuncionario();
end;


procedure TfrmLocalizarFuncionario.FiltrarFuncionario();
var
  lFiltro : string;
begin

  lFiltro := '(CODIGO like ''%' + edtNomeFuncionario.Text + '%'') or  ' +
             '(NOME like ''%' + edtNomeFuncionario.Text + '%'') ';

  qryFuncionario.Filter := lFiltro;
end;

class function TfrmLocalizarFuncionario.SelecionarFuncionario(
  pOwner: Tform): TFuncionario;
var
  lfrmLocalizarFuncionario : TfrmLocalizarFuncionario;
begin
  lfrmLocalizarFuncionario := TfrmLocalizarFuncionario.Create(pOwner);

  try

    lfrmLocalizarFuncionario.ShowModal;

    Result := lfrmLocalizarFuncionario.FFuncionario;

  finally
    if Assigned(lfrmLocalizarFuncionario) then
      FreeAndNil(lfrmLocalizarFuncionario);
  end;
end;

end.
