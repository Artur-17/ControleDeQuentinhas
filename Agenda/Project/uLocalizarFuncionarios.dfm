object frmLocalizarFuncionario: TfrmLocalizarFuncionario
  Left = 0
  Top = 0
  Caption = 'frmLocalizarFuncionario'
  ClientHeight = 397
  ClientWidth = 727
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grdPesquisar: TDBGrid
    Left = 0
    Top = 102
    Width = 727
    Height = 254
    Align = alBottom
    DataSource = dtsFuncionario
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 356
    Width = 727
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    ShowCaption = False
    TabOrder = 1
    object btnConfirmar: TButton
      Left = 551
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 632
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Localizar funcion'#225'rio'
    Color = 5089337
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object edtNomeFuncionario: TEdit
    Left = 8
    Top = 64
    Width = 711
    Height = 21
    TabOrder = 3
    OnChange = edtNomeFuncionarioChange
  end
  object qryFuncionario: TFDQuery
    Active = True
    Filtered = True
    Connection = TabGlobal.FDConnection1
    SQL.Strings = (
      'select * from funcionarios')
    Left = 656
    Top = 104
    object qryFuncionarioCODIGO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
    object qryFuncionarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 50
    end
    object qryFuncionarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 50
    end
    object qryFuncionarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 50
    end
    object qryFuncionarioCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 30
    end
    object qryFuncionarioTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 30
    end
    object qryFuncionarioDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DT_NASCIMENTO'
    end
    object qryFuncionarioOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 300
    end
  end
  object dtsFuncionario: TDataSource
    DataSet = qryFuncionario
    Left = 656
    Top = 152
  end
end
