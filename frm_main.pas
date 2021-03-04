unit frm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus, ExtCtrls, XPMan, jpeg, AppEvnts, DB, ADODB;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    aaa1: TMenuItem;
    bbb1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    N19: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    qry1: TADOQuery;
    tmr1: TTimer;
    Image1: TImage;
    N2: TMenuItem;
    N11: TMenuItem;
    N18: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure bbb1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure N19Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    BPLHandle : Cardinal;//HModule;
    AForm : TForm;
    LoadedBplFileName : String;

    procedure LoadBplForm(Const BPLName, TfrmName : String);
    procedure LoadMDIForm(BplFile, TFrmName : String);
    procedure ShowDailyNote;//ÿ������
    procedure CheckNotice;//���ϵͳ��Ϣ

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses DataMoudle,frm_ABOUT, frm_login, frm_pwd;


{$R *.dfm}

var
  hThread: THandle;

procedure TMainForm.CheckNotice; // ���ϵͳ��Ϣ
begin
  try
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select top 1 patindex(''%'+frm_login.USER+'%'',isReader) as iNo,OperTime,Notice,isreader '
            +'from T_sys_Notice where (OperTime >Getdate()-30) And OperName=''Admin'' '
            +'And (Notice is Not Null) order by opertime desc');
    Open;
  end;
  if (qry1.fieldbyname('iNo').asinteger = 0) AND (qry1.recordcount=1) then
  begin
    Application.MessageBox(PwideChar(qry1.FieldByName('opertime').AsString + ' ϵͳ���ѣ�' +#13#13+ qry1.FieldByName('Notice').AsString), '���Ĺ���', 0+64);
    qry1.edit;
    qry1.FieldByName('isReader').asstring := frm_login.USER + ',' + qry1.FieldByName('isReader').asstring ;
    qry1.post;
    qry1.close;
  end
  else
    qry1.Close;
  except
    exit;
  end;
end;

function MyThreadFun(p: Pointer): DWORD; stdcall;
begin
  MainForm.CheckNotice; {���� Form ��ķ���}
  Result := 99;   {�������ֵ����Ϊ�̵߳��˳�����, 99 ���������������}
end;

//ģ̬����BPL Form
procedure TMainForm.LoadBplForm(Const BPLName, TfrmName : String);
var
  tH : HModule;
  BPLClass : TClass;
  BPLForm : TForm;
begin
  Try
    tH := LoadPackage(BPLName);
    Try
      BPLClass := GetClass(TfrmName);
      if BPLClass <> nil then
        begin
          Application.CreateForm(TComponentClass(BPLClass) , BPLForm);
          BPLForm.ShowModal;
        end;
    Finally
      BPLForm.Free;
      UnRegisterModuleClasses(tH);
      UnLoadPackage(tH);
    End;
  except
    Application.MessageBox(PChar('BPLģ̬���ڼ���ʧ�ܣ�') , '���Ĺ���', MB_OK);
    Exit;
  End;
end;


//װ��Ƕ��BPL����
procedure TMainForm.LoadMDIForm(BplFile, TFrmName : String);
var
  AClass : TClass;
//  AForm : TForm;
begin
  if Not FileExists(ExtractFilePath(paramstr(0)) + BplFile) then
  begin
    Application.MessageBox(PChar('�Ҳ����ļ� ' + BplFile) , '���Ĺ���', MB_OK);
    Exit;
  end;
  Try
    if (AForm <> Nil) And (AForm.Showing) then FreeAndNil(AForm);
    if LoadedBplFileName <> BplFile then
    begin
      if BPLHandle <> 0 then
      begin
        UnloadPackage(BPLHandle);
        BPLHandle := 0;
      end;
      BPLHandle := LoadPackage(BplFile);
    end;
    AClass := GetClass(TFrmName);
    if AClass <> nil then
    begin
      Application.CreateForm(TComponentClass(AClass) , AForm);
      AForm.parent := MainForm.Panel1;
      AForm.bringToFront;
      AForm.Show;
    end;
  Except
    on E: Exception do
    begin
      Application.MessageBox(PChar('����Ƕ��ʧ�ܣ�������Ϣ���£�'+#13+ E.Message ) , '���Ĺ���', MB_OK);
      Exit;
    end;
  End;
  LoadedBplFileName := BplFile;
end;

procedure TMainForm.ShowDailyNote;//ÿ������
begin
with qry1 do
  begin
    close;
    sql.clear;
    SQL.Add('select top 1 ���� from DailySentence order by newid() ');
    open;
  end;
  StatusBar1.Panels[3].Text := ' �� ' + qry1.FieldByName('����').AsString + ' �� ';
  Caption :=  '���Ĺ������    ' + qry1.FieldByName('����').AsString;
  qry1.Close;
end;


procedure TMainForm.StatusBar1Click(Sender: TObject);
begin
  ShowDailyNote;
end;

procedure TMainForm.FormCanResize(Sender: TObject; var NewWidth, //���ڱ�������
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth < 500 then ReSize := False;
    if NewHeight < 200 then Resize := False;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('��ȷ��Ҫ�˳��������','���Ĺ���', MB_ICONQuestion +
     MB_OKCancel + MB_DefButton2 ) = IDOK then
    CanClose := True
    else
    CanClose := False;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LoadedBplFileName := '';
end;


procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if BPLHandle <> 0 then
  begin
    UnRegisterModuleClasses(BPLHandle);
    UnloadPackage(BPLHandle);     //ж�ذ�
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := frm_login.USER;
  StatusBar1.Panels[2].Text := frm_login.DPTNAME;
  ShowDailyNote;
end;

procedure TMainForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  Showmessage(E.message);
end;

procedure TMainForm.bbb1Click(Sender: TObject); //�û�����
begin
  if frm_login.USER <> '������' then
  begin
    Showmessage('������ϵͳ����Ա���޷�ʹ�ñ�Ȩ�ޣ�');
    Exit;
  end;
  MainForm.LoadBPLForm('sysmange.bpl', 'TfrmSoftuser');
end;

//��־�鿴
procedure TMainForm.N7Click(Sender: TObject);
begin
  if frm_login.USER <> '������' then
  begin
    Showmessage('������ϵͳ����Ա���޷�ʹ�ñ�Ȩ�ޣ�');
    Exit;
  end;
  MainForm.LoadBPLForm('sysmange.bpl', 'TfrmLog');
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.tmr1Timer(Sender: TObject);
var
  ID: DWORD;
begin
  tmr1.enabled := false;
  hThread := CreateThread(nil, 0, @MyThreadFun, nil, 0, ID);
end;

procedure TMainForm.N18Click(Sender: TObject); //�ĵ�����
begin
  LoadMDIForm('Filehost.bpl' , 'TfrmFilehost');
end;

{  CloseMDIForm;
  if frmJKBB <> Nil then frmJKBB.Hide;
  frmJKBB := TfrmJKBB.Create(self);
  frmJKBB.Parent := Panel1;
  frmJKBB.WindowState:=wsMaximized;
  frmJKBB.Show;
  frmJKBB.BringToFront;
 }

procedure TMainForm.N19Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  LoadMDIForm('Filehost.bpl' , 'TfrmFilehostQry');
end;

procedure TMainForm.N2Click(Sender: TObject);    //�����³���
begin
  if frm_login.USER <> '������' then
  begin
    Showmessage('�����ǹ���Ա���޷�ʹ�ñ�Ȩ�ޣ�');
    Exit;
  end;
  MainForm.LoadBPLForm('sysmange.bpl', 'TForm4');
end;

procedure TMainForm.N5Click(Sender: TObject);   //�����������
begin
//  LoadMDIForm('taskpool.bpl' , 'TfrmTaskList');
end;

procedure TMainForm.N6Click(Sender: TObject);  //��������
begin
//  if Not Assigned(Form2) then
//  begin
//    Form2 := TForm2.Create(Application);
//  end;
  Form2.ShowModal;
end;

end.

