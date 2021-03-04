unit frm_ABOUT;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,  jpeg, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    Copyright: TLabel;
    Comments: TLabel;
    Image1: TImage;
    Lversion: TLabel;
    Button1: TButton;
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CopyrightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CommentsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  AboutBox: TAboutBox;
  function AboutBox: TAboutBox;

implementation

{$R *.dfm}


function AboutBox: TAboutBox;
begin
  Result := TAboutBox.Create(nil);
end;


procedure TAboutBox.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TAboutBox.CommentsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TAboutBox.CopyrightMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutBox.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TAboutBox.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TAboutBox.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

end.

