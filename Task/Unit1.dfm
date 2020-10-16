object Form1: TForm1
  Left = 1309
  Top = 124
  Width = 360
  Height = 320
  Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1072#1088#1072#1083#1083#1077#1083#1077#1087#1080#1087#1077#1076#1072
  Color = clBtnFace
  Constraints.MaxHeight = 320
  Constraints.MaxWidth = 360
  Constraints.MinHeight = 320
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 16
    Width = 64
    Height = 13
    Caption = 'A-'#1086#1089#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 160
    Top = 48
    Width = 64
    Height = 13
    Caption = 'B-'#1086#1089#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 160
    Top = 80
    Width = 38
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072
  end
  object Label4: TLabel
    Left = 24
    Top = 176
    Width = 30
    Height = 13
    Caption = #1054#1090#1074#1077#1090
  end
  object Label5: TLabel
    Left = 160
    Top = 176
    Width = 77
    Height = 13
    Caption = #1086#1090#1074#1077#1090' '#1073#1091#1076#1077#1090' '#1090#1091#1090
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 16
    Width = 129
    Height = 17
    Caption = #1054#1073#1098#1077#1084
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 48
    Width = 129
    Height = 17
    Caption = #1055#1083#1086#1097#1072#1076#1100
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 240
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 2
    Text = '1'
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Edit2: TEdit
    Left = 240
    Top = 48
    Width = 97
    Height = 21
    TabOrder = 3
    Text = '1'
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Edit3: TEdit
    Left = 240
    Top = 80
    Width = 97
    Height = 21
    TabOrder = 4
    Text = '1'
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 16
    Top = 144
    Width = 321
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 15
    Top = 200
    Width = 321
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 15
    Top = 232
    Width = 321
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      OnClick = Button1Click
    end
    object N2: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = Button2Click
    end
    object N3: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = Button3Click
    end
  end
end
