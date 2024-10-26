unit Excel;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBGrids, DB, ADODB, Grids,ComObj,Excel2000;
type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    ADOConnection1: TADOConnection;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ADOTable1: TADOTable;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  mypath:string;
implementation

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  mypath:=extractfilepath(paramstr(0));
  Adoconnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'Excel.mdb;Persist Security Info=False;Jet OLEDB:Database Password=123';
  Adoconnection1.Connected:=true;
  Adotable1.Open;
  Adoquery1.Close;
  Adoquery1.SQL.Clear;
  Adoquery1.SQL.Add('select dk_name,dk_quality,cp_name,cp_dw,cp_gg,cp_quality,cp_bz,cp_nub,cp_id from cp_quality where dk_name like :abc order by cp_id asc');
  Adoquery1.Parameters.ParamByName('abc').Value:=adotable1.FieldValues['dk_name'];
  Adoquery1.Open;
end;
procedure TForm1.DBGrid2CellClick(Column: TColumn);
begin
  Adoquery1.Close;
  Adoquery1.SQL.Clear;
  Adoquery1.SQL.Add('select dk_name,dk_quality,cp_name,cp_dw,cp_gg,cp_quality,cp_bz,cp_nub,cp_id from cp_quality where dk_name like :abc order by cp_id asc');
  Adoquery1.Parameters.ParamByName('abc').Value:=Adotable1.FieldValues['dk_name'];
  Adoquery1.Open;
end;
procedure TForm1.SpeedButton1Click(Sender: TObject);
var
 i,j,m,n,h,g,d1,d2,s1,s2:integer;
 s,bh1,bh2,bh3,bh4,bh5:string;
 Excelid,xl: Variant;
begin
//**************************�a�U�ްO����******************************************************
  Adoquery2.Close;
  Adoquery2.SQL.Clear;
  Adoquery2.SQL.Add('select dk_name,cp_nub from cp_quality where (dk_name like:abc and cp_nub like:def) ');
  Adoquery2.Parameters.ParamByName('abc').Value:=Adotable1.FieldValues['dk_name'];
  Adoquery2.Parameters.ParamByName('def').Value:=1;
  Adoquery2.Open;
  d1:=Adoquery2.RecordCount;
//**********************************�a�U�ޥ�O����*****************************************
  Adoquery2.Close;
  Adoquery2.SQL.Clear;
  Adoquery2.SQL.Add('select dk_name,cp_nub from cp_quality where (dk_name like:abc and cp_nub like:def) ');
  Adoquery2.Parameters.ParamByName('abc').Value:=Adotable1.FieldValues['dk_name'];
  Adoquery2.Parameters.ParamByName('def').Value:=2;
  Adoquery2.Open;
  d2:=Adoquery2.RecordCount;
//******************************�a���ޥ�O����***********************************
  Adoquery2.Close;
  Adoquery2.SQL.Clear;
  Adoquery2.SQL.Add('select dk_name,cp_nub from cp_quality where (dk_name like:abc and cp_nub like:def) ');
  Adoquery2.Parameters.ParamByName('abc').Value:=Adotable1.FieldValues['dk_name'];
  Adoquery2.Parameters.ParamByName('def').Value:=3;
  Adoquery2.Open;
  s1:=Adoquery2.Recordcount;
//*********************************�a���ްO����******************************************************
  Adoquery2.Close;
  Adoquery2.SQL.Clear;
  Adoquery2.SQL.Add('select dk_name,cp_nub from cp_quality where (dk_name like:abc and cp_nub like:def) ');
  Adoquery2.Parameters.ParamByName('abc').Value:=Adotable1.FieldValues['dk_name'];
  Adoquery2.Parameters.ParamByName('def').Value:=4;
  Adoquery2.Open;
  s2:=Adoquery2.RecordCount;
  try
    Excelid:=CreateOleObject( 'Excel.Application' );
  except
    on Exception do raise exception.Create('�L�k�Ы�Xls���A�нT�{�O�_�w��EXCEL')
  end;
  Excelid.Visible := True;
  Excelid.WorkBooks.Add;
  Excelid.Caption :=adoquery1.FieldValues['dk_name']+'�]'+Adotable1.Fieldbyname('dk_quality').AsString+'�a�^�w��u�{���ƪ�';
  Excelid.worksheets[1].range['A1:G1'].Merge(True);
  Excelid.WorkSheets[1].Cells[1,1].Value :=Adotable1.FieldValues['dk_name']+'�]'+Adotable1.Fieldbyname('dk_quality').AsString+'�a�^�w��u�{���ƪ�' ;
  Excelid.worksheets[1].range['A1:G7'].HorizontalAlignment := $FFFFEFF4;
  Excelid.worksheets[1].range['A1:G7'].VerticalAlignment := $FFFFEFF4;
  Excelid.worksheets[1].Columns[1].ColumnWidth := 5;
  Excelid.worksheets[1].Columns[2].ColumnWidth := 5;
  Excelid.worksheets[1].Columns[3].ColumnWidth := 20;
  Excelid.worksheets[1].Columns[4].ColumnWidth := 20;
  Excelid.worksheets[1].Columns[5].ColumnWidth := 6;
  Excelid.worksheets[1].Columns[6].ColumnWidth := 9;
  Excelid.worksheets[1].Columns[7].ColumnWidth := 16;
//**************************************************************************************************
  i:=2;
  Excelid.WorkSheets[1].Cells[i,1].Value := '�Ǹ�';
  Excelid.WorkSheets[1].Cells[i,2].Value := '����';
  Excelid.WorkSheets[1].Cells[i,3].Value := '���~�W��';
  Excelid.WorkSheets[1].Cells[i,4].Value := '���~�W��';
  Excelid.WorkSheets[1].Cells[i,5].Value := '���';
  Excelid.WorkSheets[1].Cells[i,6].Value := '���~�ζq';
  Excelid.WorkSheets[1].Cells[i,7].Value := '�Ƶ�';
  Excelid.worksheets[1].Range['A1:G7'].Font.Name := '����';
  Excelid.worksheets[1].Range['A1:G1'].Font.Size := 14;
  Excelid.worksheets[1].range['A1:G2'].font.bold:=true;
  Excelid.worksheets[1].Range['A2:G2'].Font.Size := 10;
//*****************************************************************************************
  i:=3;
  Excelid.WorkSheets[1].Cells[i,3].Value := '���߬�';
  Excelid.WorkSheets[1].Cells[i,4].Value := 'Q=   m3/h�A���{=   ��';
  Excelid.WorkSheets[1].Cells[i,5].Value := '�x';
//*************************************************************************
  i:=4;
  Excelid.WorkSheets[1].Cells[i,3].Value := '����+�����L�o��';
  Excelid.WorkSheets[1].Cells[i,4].Value := 'Q=    m3/h';
  Excelid.WorkSheets[1].Cells[i,5].Value := '�x';
//************************************************************************
  i:=5;
  Excelid.WorkSheets[1].Cells[i,3].Value := '�I����';
  Excelid.WorkSheets[1].Cells[i,4].Value := '�P�����t�M';
  Excelid.WorkSheets[1].Cells[i,5].Value := '�M';
//*************************************************************
  i:=6;
  Excelid.WorkSheets[1].Cells[i,3].Value := '���ʱ��Y';
  Excelid.WorkSheets[1].Cells[i,4].Value := '�P�����t�M';
  Excelid.WorkSheets[1].Cells[i,5].Value := '�M';
//*************************************************************
  i:=7;
  Excelid.WorkSheets[1].Cells[i,3].Value := '����';
  Excelid.WorkSheets[1].Cells[i,4].Value := '�P�����t�M';
  Excelid.WorkSheets[1].Cells[i,5].Value := '��';
//*****************************************************************************************
  Excelid.ActiveSheet.Rows[1].RowHeight := 1/0.035;
//*****************************************************************************************
  i:=8;
  Adoquery1.First;
  while not Adoquery1.Eof do
    begin
      Excelid.WorkSheets[1].Cells[i,3].Value := Adoquery1.FieldByName('cp_name').AsString;
      Excelid.WorkSheets[1].Cells[i,4].Value := Adoquery1.FieldByName('cp_gg').AsString;
      Excelid.WorkSheets[1].Cells[i,5].Value := Adoquery1.FieldByName('cp_dw').AsString;
      Excelid.WorkSheets[1].Cells[i,6].Value := Adoquery1.FieldByName('cp_quality').AsString;
      Excelid.WorkSheets[1].Cells[i,7].Value := Adoquery1.FieldByName('cp_bz').AsString;
      Excelid.WorkSheets[1].Cells[i-5,1].Value := i-7;
      Inc(i);
      Adoquery1.Next;
      s:= 'A8:G'+ IntToStr(i-1);
    end;
//*******************************************************************************
      if Adoquery1.RecordCount<=45 then
       begin
         Excelid.ActiveSheet.PageSetup.TopMargin := 0.5/0.035;
         Excelid.worksheets[1].Range[s].Font.size := 10;
         Excelid.worksheets[1].Range[s].RowHeight := 14;
         Excelid.worksheets[1].Range['A3:G7'].Font.size := 10;
         m:=3;
         for n:=3 to 7 do
           begin
              Excelid.worksheets[1].Rows[m].RowHeight := 14;
              m:=m+1;
           end;
       end;
      if (Adoquery1.RecordCount>45) and (Adoquery1.RecordCount<=52) then
       begin
         Excelid.ActiveSheet.PageSetup.TopMargin := 0.5/0.035;
         Excelid.worksheets[1].Range[s].Font.size := 10;
         Excelid.worksheets[1].Range[s].RowHeight := 13;
         Excelid.worksheets[1].Range['A3:G7'].Font.size := 10;
         m:=3;
         for n:=3 to 7 do
           begin
              Excelid.worksheets[1].Rows[m].RowHeight := 13;
              m:=m+1;
           end;
       end;
      if (Adoquery1.RecordCount>52) and (Adoquery1.RecordCount<=57)  then
       begin
         Excelid.ActiveSheet.PageSetup.TopMargin := 0.5/0.035;
         Excelid.worksheets[1].Range[s].Font.size := 9;
         Excelid.worksheets[1].Range[s].RowHeight := 12;
         Excelid.worksheets[1].Range['A3:G7'].Font.size := 9;
         m:=3;
         for n:=3 to 7 do
           begin
              Excelid.worksheets[1].Rows[m].RowHeight := 12;
              m:=m+1;
           end;
       end;
      if Adoquery1.RecordCount>57  then
       begin
         Excelid.ActiveSheet.PageSetup.TopMargin := 1.5/0.035;
         Excelid.worksheets[1].Range[s].Font.size := 10;
         Excelid.worksheets[1].Range[s].RowHeight := 14;
         Excelid.worksheets[1].Range['A3:G7'].Font.size := 10;
         Excelid.ActiveSheet.PageSetup.BottomMargin :=1.8/0.035;
         Excelid.ActiveSheet.PageSetup.CenterFooter := '�@&N���A��&P��';
         m:=3;
         for n:=3 to 7 do
           begin
              Excelid.worksheets[1].Rows[m].RowHeight := 14;
              m:=m+1;
           end;
       end;
      Excelid.worksheets[1].Range[s].HorizontalAlignment := $FFFFEFF4;
      Excelid.worksheets[1].Range[s].VerticalAlignment := $FFFFEFF4;
      Excelid.worksheets[1].Range[s].Font.Name := '����';
      s := 'A2:G'+ IntToStr(i-1);
      Excelid.worksheets[1].Range[s].Borders.LineStyle := 1;
//******************************************************************************
    j:=Adoquery1.RecordCount;
    for i:=1 to 8 do
      begin
      Excelid.WorkSheets[1].Cells[j,1].Value := j-3;
      j:=j+1;
      end;
    Excelid.worksheets[1].range['B3:B7'].select;
    Excelid.worksheets[1].range['B3:B7'].Merge(xl);
//********************************************************************************
    bh1:='B8:B'+inttostr(d1+d2+7);
    Excelid.worksheets[1].range[bh1].Merge(xl);
    bh2:='B'+inttostr(d1+d2+8)+':'+'B'+inttostr(d1+d2+s1+s2+7);
    Excelid.worksheets[1].range[bh2].Merge(xl);
    g:=d1+d2+s1+s2+8;
    Excelid.worksheets[1].Rows[g].RowHeight := 5;
    bh3:='B'+inttostr(d1+d2+s1+s2+9)+':'+'C'+inttostr(d1+d2+s1+s2+9);
    Excelid.worksheets[1].range[bh3].Merge(xl);
    Excelid.WorkSheets[1].Cells[g+1,2].Value := '�� �� �G';
    bh4:='D'+inttostr(d1+d2+s1+s2+9)+':'+'E'+inttostr(d1+d2+s1+s2+9);
    Excelid.worksheets[1].range[bh4].Merge(xl);
    Excelid.WorkSheets[1].Cells[g+1,4].Value := '�� �� �G';
    bh5:='F'+inttostr(d1+d2+s1+s2+9)+':'+'G'+inttostr(d1+d2+s1+s2+9);
    Excelid.worksheets[1].range[bh5].Merge(xl);
    Excelid.WorkSheets[1].Cells[g+1,6].Value := '�� �� �G';
    Excelid.ActiveSheet.Rows[g+1].font.name := '����';
    Excelid.ActiveSheet.Rows[g+1].font.size:=10;
//*********************************************************
    Excelid.WorkSheets[1].Cells[3,2].Value := '����';
    Excelid.worksheets[1].Cells.Item[3,2].Orientation:=xlVertical;
    Excelid.worksheets[1].cells[8,2].value :='�a�U�ޤκޥ�';
    Excelid.worksheets[1].Cells.Item[8,2].Orientation:= xlVertical;
    h:=d1+d2+8;
    Excelid.worksheets[1].cells[h,2].value :='�a���ޤκޥ�';
    Excelid.worksheets[1].Cells.Item[h,2].Orientation:= xlVertical;
    Excelid.ActiveSheet.PageSetup.RightMargin := 0.5/0.035;
    Excelid.ActiveSheet.PageSetup.LeftMargin := 2/0.035;
    Excelid.ActiveSheet.PageSetup.BottomMargin := 0.5/0.035;
end;
end.
