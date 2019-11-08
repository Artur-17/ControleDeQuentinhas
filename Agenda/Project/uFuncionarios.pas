unit uFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons;

type
  TfrmFuncionarios = class(TForm)
    QRYFuncionarios: TFDQuery;
    dtsfuncionario: TDataSource;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigo: TEdit;
    dtpNasc: TDateTimePicker;
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtBairro: TEdit;
    Panel1: TPanel;
    Label9: TLabel;
    TabFuncionários: TPageControl;
    TabSheet1: TTabSheet;
    EdtCPF: TEdit;
    EdtTelefone: TEdit;
    EdtCep: TEdit;
    mInfo: TMemo;
    Label10: TLabel;
    EdtCidade: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    cbxUF: TComboBox;
    Avatar: TImage;
    btnSalvar: TcxButton;
    btnSair: TcxButton;
    ClientDataSet1: TClientDataSet;
    FDQuery1: TFDQuery;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
     procedure CadastrarFuncionario;
    procedure CarregarEstados;

  public
    { Public declarations }
    class procedure exibirFuncionario(pOwner: TForm);
    class function ConverterPickerDate(pDateTime: TDateTime) : String;
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

uses uTabGlobal;

procedure TfrmFuncionarios.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFuncionarios.btnSalvarClick(Sender: TObject);
begin
   CadastrarFuncionario();
end;

procedure TfrmFuncionarios.CadastrarFuncionario;
var
  lSQL : String;
  DataConvertida: String;
 begin

  DataConvertida := ConverterPickerDate(dtpNasc.DateTime);

   try
   lSQL :=
   format(
   'INSERT INTO FUNCIONARIOS' +
   '(NOME, EMAIL, BAIRRO, CIDADE, TELEFONE, CEP, DT_NASCIMENTO)' +
   ' VALUES ' +
   '(%s, %s, %s, %s, %s, %s, %s)',
   [QuotedStr(edtNome.Text),
    QuotedStr(EdtEmail.Text),
    QuotedStr(EdtCpf.Text),
    QuotedStr(EdtBairro.Text),
    QuotedStr(EdtCep.Text),
    QuotedStr(EdtTelefone.Text),
    QuotedStr(DataConvertida)]);


   TTabGlobal.ExecutaSQL(lSQL);

   showmessage('Os dados foram inseridos com sucesso');
   except
   showmessage('Erro ao inserir produtos');

   end;
end;


class function TfrmFuncionarios.ConverterPickerDate(pDateTime: TDateTime): String;
begin

  result := FormatDateTime('dd.mm.yyyy',pDateTime);
end;


class procedure TfrmFuncionarios.exibirFuncionario(pOwner:TForm);
var
   frmFuncionarios : TfrmFuncionarios;
begin
   try
     frmFuncionarios := TfrmFuncionarios.Create(pOwner);
     frmFuncionarios.ShowModal;
   finally
     if Assigned(frmFuncionarios) then
     FreeAndNil(frmFuncionarios);
   end;
end;
procedure TfrmFuncionarios.FormCreate(Sender: TObject);
var
 lSQL : String;
begin
       mInfo.Text := '';

       QRYFuncionarios.Connection := Conexao;
       QRYFuncionarios.Active := true;

    try
      edtCodigo.Text := IntToStr(QRYFuncionarios.SQL.Add('Select max(codigo)from funcionarios'));
    except
      MessageDlg('Código não especificado', mtError, [mbOK], 0);
    end;

end;

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  CarregarEstados();
end;

procedure TfrmFuncionarios.CarregarEstados();
var
  lQry: TFDQuery;
begin
  cbxUF.ItemIndex := -1;
  cbxUF.Text := '';
  cbxUF.Items.Clear;
  lQry := TFDQuery.Create(nil);

  lQry.Connection := uTabGlobal.Conexao;

  lQry.SQL.Add('select * from estados');

  try
    lQry.Open();
    lQry.First;

    while not lQry.Eof do
    begin
      cbxUF.Items.Add( lQry.FieldByName('SIGLA').AsString );
      lQry.Next;
    end;

  finally
    if Assigned(lQry) then
      FreeAndNil(lQry);
  end;

end;


end.
