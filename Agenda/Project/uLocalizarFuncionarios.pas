unit uLocalizarFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizarFuncionario = class(TForm)
    grdPesquisar: TDBGrid;
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
    procedure edtNomeFuncionarioChange(Sender: TObject);
  private
    procedure FiltrarFuncionario;
    { Private declarations }
  public
    { Public declarations }
    class procedure Exibir(pOwner : TForm);
    
  end;

var
  frmLocalizarFuncionario: TfrmLocalizarFuncionario;

implementation
uses
  uTabGlobal;

{$R *.dfm}


procedure TfrmLocalizarFuncionario.edtNomeFuncionarioChange(Sender: TObject);
begin
  FiltrarFuncionario();
end;

class procedure TfrmLocalizarFuncionario.Exibir(pOwner : TForm);
var
  lLocalizarFuncionario : TfrmLocalizarFuncionario;
begin
  lLocalizarFuncionario := TfrmLocalizarFuncionario.Create(pOwner);

  try
    lLocalizarFuncionario.ShowModal();
  finally
    if Assigned(lLocalizarFuncionario) then
      FreeAndNil(lLocalizarFuncionario);
  end;

    
end;

procedure TfrmLocalizarFuncionario.FiltrarFuncionario();
var
  lFiltro : string;
begin

  lFiltro := '(CODIGO like ''%' + edtNomeFuncionario.Text + '%'') or  ' +
             '(NOME like ''%' + edtNomeFuncionario.Text + '%'') ';

  qryFuncionario.Filter := lFiltro;
  qryFuncionario.Refresh();
end;

end.
