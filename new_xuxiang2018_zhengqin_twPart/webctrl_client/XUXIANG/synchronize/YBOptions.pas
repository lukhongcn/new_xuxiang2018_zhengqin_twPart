unit YBOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmOptions = class(TForm)
    PageControl1: TPageControl;
    Button1: TButton;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    rbByRange: TRadioButton;
    rbByDays: TRadioButton;
    cbDays: TComboBox;
    Label1: TLabel;
    dtFrom: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtTo: TDateTimePicker;
    Button2: TButton;
    procedure rbByDaysClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

procedure TfrmOptions.rbByDaysClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Tag = 0 then
  begin
    dtFrom.Enabled := false;
    dtTo.Enabled := false;
    cbDays.Enabled := true;
  end else begin
    dtFrom.Enabled := true;
    dtTo.Enabled := true;
    cbDays.Enabled := false;
  end;
end;

end.
