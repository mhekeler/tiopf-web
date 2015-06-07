inherited FormPersonEdit: TFormPersonEdit
  Caption = 'Edit a person'
  ClientHeight = 167
  ExplicitWidth = 329
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  object lblErrors: TLabel [0]
    Left = 8
    Top = 100
    Width = 57
    Height = 25
    AutoSize = False
    Caption = 'lblErrors'
    Color = 8454143
    ParentColor = False
    Transparent = False
  end
  inherited btnOK: TBitBtn
    Top = 137
    ExplicitTop = 137
  end
  inherited btnCancel: TBitBtn
    Top = 137
    ExplicitTop = 137
  end
  inherited cbEnterAsTab: TCheckBox
    Top = 141
    ExplicitTop = 141
  end
  object tiPerAwareEdit1: TtiPerAwareEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 24
    Constraints.MinHeight = 24
    TabOrder = 3
    LabelLayout = tlTop
    Caption = 'Enter label &name'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelParentFont = False
    ReadOnly = False
    MaxLength = 0
    CharCase = ecNormal
    PasswordChar = #0
  end
end
