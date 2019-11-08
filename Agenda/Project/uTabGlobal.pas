unit uTabGlobal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.SqlExpr,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TTabGlobal = class(TDataModule)
    FDConnection1: TFDConnection;
    FDCommand1: TFDCommand;
    FDTransaction1: TFDTransaction;
    Image_16x16: TImageList;
    Image_128x128: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ExecutaSQL(SQL: String);
    { Public declarations }
  end;

var
  TabGlobal: TTabGlobal;
  Conexao:   TFDConnection;

implementation
uses
  Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TTabGlobal }

procedure TTabGlobal.DataModuleCreate(Sender: TObject);
begin
  Conexao := self.FDConnection1;
end;



class procedure TTabGlobal.ExecutaSQL(SQL: String);
var
  ComandoSQL: TFDCommand;
  Transacao: TFDTransaction;
begin
  try
    ComandoSQL := TFDCommand.Create(nil);
    Transacao := TFDTransaction.Create(nil);

    Transacao.Connection := Conexao;
    ComandoSQL.Connection := Conexao;
    ComandoSQL.Transaction := Transacao;


    ComandoSQL.CommandText.Text := SQL;
    ComandoSQL.Execute();
  except
    on E : Exception do
    begin
        ShowMessage('Não foi possível executar o SQL' + #13 + E.Message);
    end;
  end;
  if Assigned(Transacao) then FreeAndNil(Transacao);
  if Assigned(ComandoSQL) then FreeAndNil(ComandoSQL);
end;

end.
