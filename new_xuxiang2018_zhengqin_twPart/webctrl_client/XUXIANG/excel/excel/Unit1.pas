unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, COMObj, Excel2000, office2000, DateUtils, DB, ADODB,
  OleServer, ExcelXP;

type
  TForm1 = class(TForm)
    ButtonSmall: TButton;
    ButtonMiddle: TButton;
    procedure ButtonSmallClick(Sender: TObject);
    procedure ButtonMiddleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ModuleReport;

{$R *.dfm}
procedure TForm1.ButtonSmallClick(Sender: TObject);
var
  mo : TModuleReport ;
  startdate ,enddate : TDateTime;
begin
  mo := TModuleReport.Create;
  try
    startdate := EncodeDate(2004,11,2);
    enddate := startdate + 10;
    mo.createSmallScheduleReport('EDM',startdate,enddate);
  finally
    mo.Free;
  end;
end;

procedure TForm1.ButtonMiddleClick(Sender: TObject);
var
  mo : TModuleReport ;
  startdate ,enddate : TDateTime;
begin
  mo := TModuleReport.Create;
  try
    startdate := EncodeDate(2004,11,5);
    enddate := startdate + 3;
    mo.createMiddleScheduleReport(startdate,enddate);
  finally
    mo.Free;
  end;
end;

end.
