unit Unit_TaskUpdate;

interface

uses
  Windows,  SysUtils, Classes,  Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TFrmTaskUpdate = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cbb_isEnd: TComboBox;
    lbl3: TLabel;
    btn_save: TButton;
    btn_cancel: TButton;
    edt_Filename: TEdit;
    lbl4: TLabel;
    btn_AddFile: TSpeedButton;
    dlgOpen: TOpenDialog;
    qry1: TADOQuery;
    edt_Content: TEdit;
    edt_NewProgress: TEdit;
    lbl_TaskID: TLabel;
    lbl5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_AddFileClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTaskUpdate: TFrmTaskUpdate;

implementation

uses Unit_TaskList;

{$R *.dfm}

procedure TFrmTaskUpdate.btn_AddFileClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    edt_Filename.Text := dlgOpen.FileName;
  end;
end;

procedure TFrmTaskUpdate.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaskUpdate.btn_saveClick(Sender: TObject);
var
  Stream : TMemoryStream;
  sBlob1, sBlob2, sSQL : string ;
begin
  if (Trim(edt_NewProgress.Text)='') Or (Trim(cbb_isEnd.Text)='') then
  begin
    Application.MessageBox('请填写最新工作进度并选择任务是否完成的状态','公文管理',0+64);
    edt_NewProgress.SetFocus;
    exit;
  end;
 if Trim(edt_Filename.Text)<>'' then
 begin
   sBlob1 :=  ',sFileName,sFileData ';
   sBlob2 :=  ','+QuotedStr(ExtractFileName(edt_Filename.Text))+',:Blob ';
 end;
 //插入数据库 TaskProgress
 try
   with qry1 do
   begin
     Close;
     sql.Clear;
     sql.Add('Insert Into TaskProgress (NewDate,TaskID,Detail '+sBlob1+') Values ('+ QuotedStr(DateTimeToStr(Now)) + ','+
             QuotedStr(lbl_TaskID.Caption) +','+QuotedStr(edt_NewProgress.text)+  sBlob2+')');
     if Trim(edt_Filename.Text)<>'' then
     begin
       Stream := TMemoryStream.Create;
       Stream.LoadFromFile(edt_Filename.Text);
       Stream.Position := 0;
       Parameters.ParamByName('Blob').LoadFromStream(Stream,ftBlob);;
     end;
     ExecSQL;
     if Trim(edt_Filename.Text)<>'' then
     begin
       Stream.Free;
     end;
     Close;
     sql.Clear;
     if Trim(cbb_isEnd.Text)= '继续进行' then
     begin
       sSQL := 'Update TaskList Set isEnd='+QuotedStr('继续进行')+ ' Where TaskID='+lbl_TaskID.Caption;
     end
     else
     begin
       sSQL := 'Update TaskList Set isEnd='+QuotedStr('任务完成')+ ' Where TaskID='+lbl_TaskID.Caption;
     end;
     sql.add(sSQL);
     ExecSQL;
   end;
   Application.MessageBox('最新进展情况保存成功','公文管理',0+64);
   Close;
 except
   Application.MessageBox('更新出错','公文管理',0+64);
   exit;
 end;
end;

procedure TFrmTaskUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self.Release;
end;

procedure TFrmTaskUpdate.FormShow(Sender: TObject);
begin
   edt_NewProgress.SetFocus;
end;

end.
