unit frm_viewlog;

interface

uses
  Windows, Messages, SysUtils, Classes,Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActiveX, DB, ADODB, Buttons, ComCtrls;

type
  TfrmLog = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    AQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    pnl1: TPanel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure getlogList;
  public
    { Public declarations }
  end;

var
  frmLog: TfrmLog;

implementation

Uses DataMoudle;

{$R *.dfm}






procedure TfrmLog.btn1Click(Sender: TObject);
begin
  if Trim(edt1.Text)='' then
  begin
    ShowMessage('请输入要发布的信息！');
    edt1.SetFocus;
    Exit;                           
  end; 
  try
    With AQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO T_sys_Notice (OPERTIME,OPERNAME,OPER,NOTICE,SFLAG)'+
      ' VALUES ('+QuotedStr(DateTimetostr(Now))+',''Admin'',''NOTICE'','+QuotedStr(Trim(edt1.Text))+',''Note_Sys'')');
      ExecSQL;
    end;
  finally
    AQuery1.Close;
    edt1.Clear;
    btn2.Click;
  end;
end;

procedure TfrmLog.btn2Click(Sender: TObject);
begin
  if Trim(btn2.Caption) = '历史消息' then
  begin
    With AQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Top 50 Opertime,Notice,isReader from T_sys_Notice Where sflag like ''Note%'' Order By OperTime Desc');
      Open;
    end;
  ListBox1.Items.Clear;
  while not AQuery1.Eof do
  begin
    ListBox1.Items.Add('------------------------');
    ListBox1.Items.Add('发布日期：'+AQuery1.FieldByName('Opertime').AsString);
    ListBox1.Items.Add('消息内容：'+AQuery1.FieldByName('Notice').AsString);
    ListBox1.Items.Add('阅读人员：'+AQuery1.FieldByName('isReader').AsString);
    ListBox1.Items.Add(' ');
    AQuery1.Next;
  end;
  AQuery1.Close;
  btn2.Caption := '系统日志';
  end
  else
  begin
    btn2.Caption := '历史消息';
    getlogList;
  end;
end;

procedure TfrmLog.btn3Click(Sender: TObject);
begin
  Try
    With AQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from T_Log ');
      ExecSQL;
    end;
    AQuery1.Close;
    getlogList;
  Except
    Showmessage('删除日志出错');
  End;
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  getlogList;
end;

procedure TfrmLog.getlogList;
begin
  ListBox1.Clear;
  With AQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select convert(char(20),operdate,20)+ oper +'' ''+ content as logdetail from T_Log Order By operDate Desc');
    Open;
  end;
  while NOt AQuery1.Eof do
  begin
    ListBox1.Items.Add(Trim(AQuery1.FieldByName('logdetail').AsString));
    AQuery1.Next;
  end;
  AQuery1.Close;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmLog);
finalization
  UnRegisterClass(TfrmLog);
  CoUninitialize;
end.
