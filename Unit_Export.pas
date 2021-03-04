unit Unit_Export;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GridsEh, DBGridEh, ComCtrls,DB, ADODB,ComObj;

  procedure DBGridToExcel(dbgrdh1 : Tdbgrideh;SheetName : string);

implementation

procedure DBGridToExcel(dbgrdh1 : Tdbgrideh;SheetName : string);
const
  xlHAlignCenter = -4108;
  xlHAlignLeft  = -4131;
  xlHAlignRight  = -4152;
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  BK : TBookMark;
  DataSet:TDataSet;
  Col : TColumneh;
  CellStr : string;
  GAL :TAlignment;
  EAL : Integer;
  Savedialog : TSaveDialog;
  xlsFileName : string;
begin
  Savedialog := TSaveDialog.Create(nil);
  Savedialog.Filter := 'Excel Files(*.xls)|*.xls';
  if Savedialog.Execute then
  begin
    xlsFileName := Savedialog.FileName;

    Savedialog.Free;
  end
  else
  begin
    Savedialog.Free;
    exit;
  end;

  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
    XLApp.WorkBooks.Add;
    XLApp.WorkBooks[1].WorkSheets[1].Name := SheetName;
    Sheet := XLApp.Workbooks[1].WorkSheets[SheetName];
    if not dbgrdh1.DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;
    DataSet := dbgrdh1.DataSource.DataSet;
    DataSet.DisableControls;
    BK := DataSet.GetBookmark();
    DataSet.First;
    //标题
    for iCount := 0 to dbgrdh1.Columns.Count - 1 do
    begin
      Col := dbgrdh1.Columns.Items[iCount];
      Sheet.Cells[1, iCount + 1] := Col.Title.Caption;
      Sheet.Cells[1, iCount + 1].Font.Bold :=True ;//粗体
      GAL := Col.Alignment;
      if GAL = taLeftJustify then
        EAL := xlHAlignLeft
      else if GAL = taCenter then
        EAL := xlHAlignCenter
      else EAL := xlHAlignRight;
      //列数据对齐格式
      Sheet.Columns[iCount + 1].HorizontalAlignment := EAL ;
      //列标题对齐格式
      Sheet.Cells[1, iCount + 1].HorizontalAlignment := xlHAlignCenter;
    end;
    //数据
    jCount := 1;
    while not DataSet.Eof do
    begin
      for iCount := 0 to dbgrdh1.Columns.Count - 1 do
      begin
        Col := dbgrdh1.Columns.Items[iCount];
        CellStr:=  Col.Field.AsString;
        Sheet.Cells[jCount + 1, iCount + 1] := CellStr;
      end;
      Inc(jCount);
      DataSet.Next;
      Application.ProcessMessages;
    end;
    DataSet.GotoBookmark(BK);
    DataSet.FreeBookmark(BK);
    DataSet.EnableControls;
//    Sheet.range['B2:F'+IntToStr(dbgrdh1.RowCount+6)].Style := 'Comma';
    XLApp.WorkBooks[1].WorkSheets[1].Columns.AutoFit;
    Screen.Cursor := crDefault;
    try
      XLApp.DisplayAlerts := False;
      Sheet.SaveAS(xlsFileName);
      XLApp.workBooks.Close;
      if not VarIsEmpty(XLApp) then
      begin
        XLApp.Quit;
      end;
    except
      if not VarIsEmpty(XLApp) then
      begin
        XLApp.Quit;
      end;
    end;
//    XlApp.Visible := True; //用户关掉, 就可以关掉内存中的Excel试验通过2005.2.5
//    Sheet := unAssigned;   //可以不要
   exit;
end;

end.


