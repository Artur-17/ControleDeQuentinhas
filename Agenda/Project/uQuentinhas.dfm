object frmQuentinhas: TfrmQuentinhas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Quentinhas'
  ClientHeight = 591
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 17
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
    object dtpDataQ: TDateTimePicker
      Left = 27
      Top = 160
      Width = 94
      Height = 24
      Date = 43759.000000000000000000
      Time = 0.951367233799828700
      TabOrder = 0
    end
    object edtValor: TEdit
      Left = 179
      Top = 160
      Width = 78
      Height = 24
      TabOrder = 1
    end
    object edtCliente: TEdit
      Left = 27
      Top = 96
      Width = 502
      Height = 24
      TabOrder = 2
    end
    object btnLocalizar: TcxButton
      Left = 498
      Top = 100
      Width = 25
      Height = 17
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2019Colorful'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = TabGlobal.Image_16x16
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      OnClick = btnLocalizarClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 41
    Align = alTop
    Caption = 'Pedido'
    Color = 15105312
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object memoDescricao: TMemo
    Left = 8
    Top = 360
    Width = 553
    Height = 137
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object btnSalvar: TcxButton
    Left = 35
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Salvar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2016Colorful'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000000B744558745469746C6500536176653BF9E8F9090000004849444154
      785EDDD0C10900200885E1D66C1BAFCDD2146FB15E10782A4A940E25FC1E3FC4
      4432D45825577A9A00E39C0100CB747EBD200ED8BB0C3472971950F021401C4F
      140542756780187A6CE7455E0000000049454E44AE426082}
    OptionsImage.ImageIndex = 4
    OptionsImage.Images = TabGlobal.Image_16x16
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnSair: TcxButton
    Left = 486
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Sair'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2016Colorful'
    OptionsImage.ImageIndex = 6
    OptionsImage.Images = TabGlobal.Image_16x16
    TabOrder = 4
    OnClick = btnSairClick
  end
end
