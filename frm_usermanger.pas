unit frm_usermanger;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Dialogs, ActiveX, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TfrmSoftuser = class(TForm)
    btn1: TButton;
    dbgrd1: TDBGrid;
    qry1: TADOQuery;
    ds1: TDataSource;
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn_save: TButton;
    btn_cancel: TButton;
    qry2: TADOQuery;
    cbb1: TComboBox;
    lblDpt: TLabel;
    btn_Add: TButton;
    btn_modi: TButton;
    btn_dele: TButton;
    pnl1: TPanel;
    pgc1: TPageControl;
    ts_user: TTabSheet;
    ts_Dept: TTabSheet;
    dbgrd_dept: TDBGrid;
    ds_dept: TDataSource;
    qry_dept: TADOQuery;
    ts_app: TTabSheet;
    qry_app: TADOQuery;
    dbgrd_app: TDBGrid;
    ds_app: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_modiClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_deleClick(Sender: TObject);
    procedure ts_appShow(Sender: TObject);
    procedure ts_userShow(Sender: TObject);
    procedure ts_DeptShow(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    var
      ADDAmend : Integer;    //1-��� 2-�޸� 3-ɾ��
    procedure showuser(E1,E2 : TEdit;ADOQuer:TADOQuery);
    procedure EnabledTF(T,F:Boolean);//�������ư�ť����״̬
  public
    { Public declarations }
  end;

var
  frmSoftuser: TfrmSoftuser;

implementation

{$R *.dfm}

procedure TfrmSoftuser.showuser(E1,E2 : TEdit;ADOQuer:TADOQuery);//ˢ���û�
begin
  ADOQuer.First;
  E1.Text := ADOQuer.FieldByName('��¼��').AsString;
  E2.Text := ADOQuer.FieldByName('����').AsVariant;
end;

procedure TfrmSoftuser.ts_appShow(Sender: TObject); //��ʾ����汾������Ϣҳ��
begin
  with qry_app do
  begin
    Close;
    sql.Clear;
    SQL.Add('Select * from appversion');
    open;
  end;
end;

procedure TfrmSoftuser.ts_DeptShow(Sender: TObject);
begin
   {��ʾ�����б�Ĳ�������}
  with qry_dept do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Dept order by DeptNo ASC');
    open;
  end;
  dbgrd_dept.Fields[0].DisplayLabel :='�������';
  dbgrd_dept.Fields[1].DisplayLabel :='��������';
  dbgrd_dept.Fields[2].DisplayLabel :='���Ų㼶';
  dbgrd_dept.Fields[3].DisplayLabel :='��������';
  dbgrd_dept.Fields[4].DisplayLabel :='���';
  dbgrd_dept.Fields[5].DisplayLabel :='�ĺ�';
end;

procedure TfrmSoftuser.ts_userShow(Sender: TObject);
begin
  btn_save.Enabled   := false;
  btn_cancel.Enabled := false;
  edt1.Enabled := false;
  edt2.Enabled := false;
  cbb1.Enabled := false;
  {ˢ�²����б�������}
  with qry_dept do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select DeptName from Dept Order by DeptNo Asc');
    open;
    cbb1.Clear;
    while not Eof do
    begin
      cbb1.Items.Add(FieldByName('DeptName').AsString);
      Next;
    end;
    Close;
  end;
  {��ʾ�û���}
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select LoginNO as ���,LoginName as ��¼��,cast(password as varchar(20)) as ����,DeptNO as ���� from Login Order by LoginNo');
    Open;
  end;
  if qry1.RecordCount > 0 then
  showuser(edt1,edt2,qry1)
  else
  begin
    edt1.Clear;
    edt2.Clear;
    cbb1.ItemIndex := -1;
  end;
end;

procedure TfrmSoftuser.EnabledTF(T,F:Boolean);//�����û�����ҳ�水ť
begin
  btn_add.Enabled := T;         //    1 ���
  btn_modi.Enabled := T;          //  2 �޸�
  btn_dele.Enabled := T;
  btn_save.Enabled := F; //4����
  btn_cancel.Enabled := F;          //  5ȡ��
  edt1.Enabled := F;
  edt2.Enabled := F;
  cbb1.Enabled :=F;
end;

procedure TfrmSoftuser.btn1Click(Sender: TObject); //�ر�
begin
  Close;
end;

procedure TfrmSoftuser.btn_AddClick(Sender: TObject);   //����û�
begin
  ADDAmend := 1;
  EnabledTF(False,True);
  edt1.Clear;
  edt2.Clear;
  cbb1.Style := csDropDownList;
end;

procedure TfrmSoftuser.btn_cancelClick(Sender: TObject);   //ȡ������û�
begin
  EnabledTF(True,False);
  showuser(edt1,edt2,qry1);
  dbgrd1.Enabled := true;
  cbb1.Style := csDropDown;
end;

procedure TfrmSoftuser.btn_deleClick(Sender: TObject);     //ɾ���û�
begin
  if Application.MessageBox('�Ƿ�ɾ����ǰ�û���','��ʾ',MB_YesNO+MB_ICONQUESTION) =IDYES then
  begin
    qry1.Delete;
    EnabledTF(True,False);
    qry1.Active := False;
    qry1.Active := True;
    showuser(edt1,edt2,qry1);
  end;

end;

procedure TfrmSoftuser.btn_modiClick(Sender: TObject);   //�޸��û�
begin
  ADDAmend := 2;
  EnabledTF(False,True);
  dbgrd1.Enabled := false;
  cbb1.Style := csDropDownList;
end;

procedure TfrmSoftuser.btn_saveClick(Sender: TObject); //������ӵ��û���Ϣ
var
 i,maxid : SmallInt;
begin
  if ((edt1.text <>'') and (edt2.Text<>'')) then
  begin
    with qry2 do
    begin
      if ADDAmend = 1 then           //�½��û�
       begin
         close;
         SQL.Clear;
         sql.add('select * from Login where loginname='+QuotedStr(Trim(edt1.Text)));
         Open;
         if qry2.RecordCount >0 then
         begin
           ShowMessage('�û����Ѵ���');
           edt1.Clear;
           edt2.Clear;
           cbb1.ItemIndex := -1;
           Close;
           exit;
           EnabledTF(True,False);
         end
         else
         begin
           close;
           sql.Clear;
           sql.add('select DeptNo from Dept where DeptName='+QuotedStr(cbb1.Text));
           open;
           i := FieldByName('DeptNo').AsInteger;
           close;
           sql.Clear;
           sql.add('select Max(LoginNo) as maxID from login');
           open;
           maxid := FieldByName('maxID').AsInteger;
           close;
           SQL.Clear;
           sql.add('insert into Login (LoginNO,loginname,password,deptNO) values ( '+IntToStr(maxid+1)+','+
           QuotedStr(trim(edt1.Text))+',cast('+QuotedStr(Trim(edt2.Text))+' as varbinary),'+IntToStr(i)+') ');
         end;
       end
       else
       if ADDAmend = 2 then     //�޸��û�
       begin
         close;
         sql.Clear;
         sql.add('select DeptNo from Dept where DeptName='+QuotedStr(cbb1.Text));
         open;
         i := FieldByName('DeptNo').AsInteger;
         Close;
         SQL.Clear;
         sql.Add('update login set loginname='+QuotedStr(trim(edt1.Text))+',password=cast('+QuotedStr(Trim(edt2.Text))
           +' as varbinary),deptNO='+IntToStr(i)+' where loginNo='+QuotedStr(qry1.FieldByName('���').AsString ))
       end
       else
       begin
         Close;
         exit;
       end;
      ExecSQL;;
    end;
    EnabledTF(True,False);
    cbb1.Style := csDropDown;
    qry1.Active := False;
    qry1.Active := True;
  end
  else
    ShowMessage('�뽫��Ϣ������');
  dbgrd1.Enabled := true;
end;

procedure TfrmSoftuser.ds1DataChange(Sender: TObject; Field: TField);
begin
  Edt1.Text := qry1.FieldByName('��¼��').AsString;
  if qry1.FieldByName('����').IsNull then  edt2.Text := ''
    else Edt2.Text := qry1.FieldByName('����').AsVariant;
  with qry_dept do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select DeptName from Dept WHERE DeptNo = ' + qry1.FieldByName('����').AsString );
    open;
    cbb1.Text := FieldByName('DeptName').AsString;
    Close;
  end;
end;

procedure TfrmSoftuser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry1.close;
  qry2.Close;
  qry_dept.Close;
  qry_app.Close;
  ACtion := caFree;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmSoftuser);
finalization
  UnRegisterClass(TfrmSoftuser);
  CoUninitialize;
end.
