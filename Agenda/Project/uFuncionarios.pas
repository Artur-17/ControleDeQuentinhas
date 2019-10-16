unit uFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList;

type
  TfrmFuncionarios = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dtpNasc: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    btnIncluir: TButton;
    QRYFuncionarios: TFDQuery;
    edtCodigo: TEdit;
    dtsfuncionario: TDataSource;
    Panel2: TPanel;
    Image1: TImage;
    ImageList1: TImageList;
    Panel3: TPanel;
    btnDeletar: TButton;
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtBairo: TEdit;
    EdtCpf: TMaskEdit;
    EdtCep: TMaskEdit;
    EdtTelefone: TMaskEdit;
    DBGrid: TDBGrid;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
     procedure CadastrarFuncionario;

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

procedure TfrmFuncionarios.btnIncluirClick(Sender: TObject);
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
    QuotedStr(EdtBairo.Text),
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


       QRYFuncionarios.Connection := Conexao;
       QRYFuncionarios.Active := true;

    try
      edtCodigo.Text := IntToStr(QRYFuncionarios.SQL.Add('Select max(codigo)from funcionarios'));
    except
      MessageDlg('Código não especificado', mtError, [mbOK], 0);
    end;



end;

end.
