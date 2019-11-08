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
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 356
    Width = 727
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    ShowCaption = False
    TabOrder = 0
    object btnConfirmar: TButton
      Left = 551
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TButton
      Left = 632
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
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
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object edtNomeFuncionario: TEdit
    Left = 8
    Top = 56
    Width = 711
    Height = 21
    TabOrder = 2
    OnChange = edtNomeFuncionarioChange
  end
  object gridFuncionarios: TcxGrid
    Left = 0
    Top = 96
    Width = 727
    Height = 260
    Align = alBottom
    TabOrder = 3
    object gridFuncionariosView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsFuncionario
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.GroupFooterMultiSummaries = True
      object gridFuncionariosViewCODIGO: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGO'
      end
      object gridFuncionariosViewNOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
      end
      object gridFuncionariosViewEMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
      end
      object gridFuncionariosViewBAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'BAIRRO'
      end
      object gridFuncionariosViewCIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'CIDADE'
      end
      object gridFuncionariosViewCEP: TcxGridDBColumn
        DataBinding.FieldName = 'CEP'
      end
      object gridFuncionariosViewTELEFONE: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONE'
      end
      object gridFuncionariosViewDT_NASCIMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DT_NASCIMENTO'
      end
      object gridFuncionariosViewOBS: TcxGridDBColumn
        DataBinding.FieldName = 'OBS'
      end
    end
    object gridFuncionariosLevel: TcxGridLevel
      GridView = gridFuncionariosView
    end
  end
  object qryFuncionario: TFDQuery
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
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
