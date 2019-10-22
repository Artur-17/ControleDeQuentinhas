object frmQuentinhas: TfrmQuentinhas
  Left = 0
  Top = 0
  Caption = 'Quentinhas'
  ClientHeight = 581
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 335
    Width = 203
    Height = 19
    Caption = 'Descreva o item do pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gpNovoPedido: TGroupBox
    Left = 8
    Top = 64
    Width = 552
    Height = 225
    Caption = 'Novo pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 27
      Top = 64
      Width = 135
      Height = 16
      Caption = 'Selecione um cliente'
    end
    object Label3: TLabel
      Left = 27
      Top = 138
      Width = 29
      Height = 16
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 179
      Top = 138
      Width = 33
      Height = 16
      Caption = 'Valor'
    end
    object cbFuncionario: TComboBox
      Left = 27
      Top = 86
      Width = 441
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object dtpDataQ: TDateTimePicker
      Left = 27
      Top = 160
      Width = 94
      Height = 24
      Date = 43759.000000000000000000
      Time = 0.951367233799828700
      TabOrder = 1
    end
    object edtValor: TEdit
      Left = 179
      Top = 160
      Width = 121
      Height = 24
      TabOrder = 2
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 41
    Align = alTop
    Color = clHotLight
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 2
    ExplicitWidth = 560
    object Label1: TLabel
      Left = 256
      Top = 8
      Width = 65
      Height = 22
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object memoDescricao: TMemo
    Left = 8
    Top = 360
    Width = 553
    Height = 137
    Lines.Strings = (
      'memoDescricao')
    TabOrder = 2
  end
  object btnSalvar: TButton
    Left = 8
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
  end
  object btnExcluir: TButton
    Left = 121
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
  end
  object btnSair: TButton
    Left = 233
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
  end
  object ImageList1: TImageList
    Left = 528
    Top = 40
  end
end
