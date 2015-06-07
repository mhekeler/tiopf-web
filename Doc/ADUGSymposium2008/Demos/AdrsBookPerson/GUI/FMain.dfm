object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Address book'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object LV: TtiVTListView
    Left = 8
    Top = 8
    Width = 410
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
    Header.Style = hsXPStyle
    EditInlineOnly = False
    ShowNodeHint = False
    SortOrders.GroupColumnCount = 0
    SortOrders = <>
    VisibleButtons = [tiLVBtnVisEdit, tiLVBtnVisNew, tiLVBtnVisDelete]
    VT.Left = 2
    VT.Top = 26
    VT.Width = 406
    VT.Height = 211
    VT.Align = alClient
    VT.Colors.UnfocusedColor = clMedGray
    VT.Header.AutoSizeIndex = 0
    VT.Header.Font.Charset = DEFAULT_CHARSET
    VT.Header.Font.Color = clWindowText
    VT.Header.Font.Height = -11
    VT.Header.Font.Name = 'Tahoma'
    VT.Header.Font.Style = []
    VT.Header.MainColumn = -1
    VT.Header.Options = [hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
    VT.Header.Style = hsXPStyle
    VT.NodeDataSize = 4
    VT.TabOrder = 1
    VT.TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    VT.TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowRoot, toShowVertGridLines, toThemeAware, toUseBlendedImages]
    VT.TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
    VT.Columns = <>
    OnItemDelete = LVItemDelete
    OnItemEdit = LVItemEdit
    OnItemInsert = LVItemInsert
  end
end
