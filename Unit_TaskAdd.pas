unit Unit_TaskAdd;

interface

uses
  Windows, SysUtils, Classes,Controls, Forms, StdCtrls, ComCtrls,
  Buttons,  DB, ADODB, Dialogs;

type
  TFrmTaskAdd = class(TForm)
    cbb1: TComboBox;
    lbl_TaskLev: TLabel;
    edt_filenum: TEdit;
    lbl1: TLabel;
    cbb_zhuban: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb_Controller: TComboBox;
    lbl4: TLabel;
    cbb_Operater: TComboBox;
    lbl5: TLabel;
    edt_ViceOperator: TEdit;
    lbl6: TLabel;
    dtp1: TDateTimePicker;
    lbl7: TLabel;
    btn_Save: TButton;
    btn_cancel: TButton;
    cbb_Year: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    edt_Attatch: TEdit;
    btn_AddFile: TSpeedButton;
    dlgOpen: TOpenDialog;
    qry_Add: TADOQuery;
    edt_content: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_AddFileClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
    var
     sTaskID : string;

     procedure GetNewTaskID; //自动编排唯一记录标识号
  public
    { Public declarations }
  end;

var
  FrmTaskAdd: TFrmTaskAdd;

implementation

{$R *.dfm}
procedure TFrmTaskAdd.GetNewTaskID;  //设定文件唯一标识的编号
begin
  with qry_Add do
  begin
    Close;
    sql.Clear;
    sql.Add('select Max(TaskID) as ID From TaskList ');
    open;
  end;
  if qry_add.RecordCount = 0 then
     sTaskID := '000001'
  else
     sTaskID := IntToStr(qry_add.FieldByName('ID').AsInteger + 1);
end;



procedure TFrmTaskAdd.btn_AddFileClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    edt_Attatch.Text := dlgOpen.FileName;
  end;
end;

procedure TFrmTaskAdd.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaskAdd.btn_SaveClick(Sender: TObject);
var
  Stream : TMemoryStream;
  sBlob1,sBlob2 : string ;
begin
  if Trim(cbb1.Text)='' then
  begin
    Application.MessageBox('请确定任务下达单位！','公文管理',0+64);
    exit;
  end;
  if Trim(cbb_Year.Text)='' then  begin
   Application.MessageBox('请选择任务年度！','公文管理',0+64);
   exit;
  end;
  if Trim(cbb_zhuban.Text)='' then
  begin
   Application.MessageBox('请确定主办类型！','公文管理',0+64);
   exit;
  end;
  if Trim(edt_content.Text)='' then
  begin
   Application.MessageBox('请输入任务的主要内容！','公文管理',0+64);
   exit;
  end;
  if Trim(cbb_Operater.Text)='' then
  begin
   Application.MessageBox('请确定任务主办人！','公文管理',0+64);
   exit;
  end;

   if Trim(edt_Attatch.Text)<>'' then
   begin
     sBlob1 :=  ',sFileName,sFileData ';
     sBlob2 :=  ','+QuotedStr(ExtractFileName(edt_Attatch.Text))+',:Blob ';
   end;
 GetNewTaskID;
 //插入数据库
 try
   Screen.Cursor := crHourGlass;
   with qry_Add do
   begin
     Close;
     sql.Clear;

     sql.Add('Insert Into TaskList (TaskID,XDBM,sYear,WJBH,ZBLX,TaskContent,Admin,Operter,ViceOperter,EndDate '+sBlob1+') Values ('+
             sTaskID+','+ QuotedStr(cbb1.Text) +','+QuotedStr(cbb_Year.Text)+','+QuotedStr(edt_filenum.Text)+','+QuotedStr(cbb_zhuban.Text)+
             ','+QuotedStr(edt_content.Text)+','+QuotedStr(cbb_Controller.Text)+','+ QuotedStr(cbb_Operater.Text)+','+
             QuotedStr(edt_ViceOperator.Text)+','+QuotedStr(DateToStr(dtp1.Date))+sBlob2+')');
     if Trim(edt_Attatch.Text)<>'' then
     begin
       Stream := TMemoryStream.Create;
       Stream.LoadFromFile(edt_Attatch.Text);
       Stream.Position := 0;
       Parameters.ParamByName('Blob').LoadFromStream(Stream,ftBlob);;
     end;
     ExecSQL;
    if Trim(edt_Attatch.Text)<>'' then
     begin
       Stream.Free;
     end;
   end;
   Screen.Cursor := crDefault;
   Application.MessageBox('成功添加新任务！','公文管理',0+64);
   qry_Add.Close;
   edt_filenum.Clear;
   edt_content.Clear;
   edt_Attatch.Clear;
 except on E:Exception do
   begin
     Screen.Cursor := crDefault;
     Application.MessageBox(Pchar(E.Message),'公文管理',0+MB_ICONERROR);
     qry_Add.Close;
     exit;
   end;
 end;
 Screen.Cursor := crDefault;
end;

procedure TFrmTaskAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self.Release;
end;

end.
