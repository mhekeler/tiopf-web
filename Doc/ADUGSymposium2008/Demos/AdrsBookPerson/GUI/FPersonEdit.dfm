inherited FormPersonEdit: TFormPersonEdit
  Caption = 'Edit a person'
  PixelsPerInch = 96
  TextHeight = 13
  object lblErrors: TLabel [0]
    Left = 8
    Top = 116
    Width = 307
    Height = 34
    AutoSize = False
    Caption = 'lblErrors'
    Color = 8454143
    ParentColor = False
    Transparent = False
  end
  object paeTitle: TtiPerAwareEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 24
    Constraints.MinHeight = 24
    TabOrder = 3
    LabelLayout = tlTop
    Caption = '&Title'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelParentFont = True
    ReadOnly = False
    MaxLength = 0
    CharCase = ecNormal
    PasswordChar = #0
  end
  object paeFirstName: TtiPerAwareEdit
    Left = 8
    Top = 38
    Width = 185
    Height = 24
    Constraints.MinHeight = 24
    TabOrder = 4
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
  object paeLastName: TtiPerAwareEdit
    Left = 8
    Top = 68
    Width = 185
    Height = 24
    Constraints.MinHeight = 24
    TabOrder = 5
    LabelLayout = tlTop
    Caption = '&Last name'
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
