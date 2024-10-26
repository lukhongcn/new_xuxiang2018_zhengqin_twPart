unit ModuleReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, COMObj, Excel2000, office2000, DateUtils, DB, ADODB, Global;

type
  TModuleReport = class(TObject)
    private
    { Private declarations }
      ADOConn : TADOConnection;
      alpha : array[1..26] of string;
      colors : array[0..1] of integer; 
      function transRowsNum(row : integer):string;

      function _setSmallSheetHeader(OleApp : Variant; sheet : integer; dt:TDateTime; days :integer) : integer;
      function _setSmallBlockHeaderFooter(OleApp : Variant; sheet : integer; rowNum:integer; dt:TDateTime; days :integer; isHeader : boolean) : integer;
      function _setSmallMachineInfo(OleApp : Variant; sheet : integer; processid : string; machineid : string; dt:TDateTime; days : integer; rowNum : integer; scheduleNum : integer; interNum : integer) : integer;

      procedure setMiddleBlockHeaderFooter(OleApp : Variant; sheet : integer; rowNum : Integer; dt:TDateTime; days :integer; isHeader : boolean);
      function setMiddleMachineInfo(OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleDesignProcessInfo  (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddlePrepareProcessInfo (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleCutProcessInfo     (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleCNCProcessInfo     (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleCNCNProcessInfo    (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleEDMProcessInfo     (OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
      function _setMiddleAssembleProcessInfo(OleApp : Variant; sheet : integer; rowNum : integer; dt:TDateTime; days : integer) : integer;
    public
    { Public declarations }
      constructor Create();
      destructor Destroy();

      function createSmallScheduleReport(processid : string; startdate:TDateTime; enddate:TDateTime):string;
      function createMiddleScheduleReport(startdate : TDateTime; enddate : TDateTime): string;
  end;

implementation

{ TModuleReport }

constructor TModuleReport.Create;
var
  connectedStr : String;
begin
  connectedStr := CONNECTSTRING;
  ADOConn := TADOConnection.Create(nil);
  ADOConn.ConnectionString := CONNECTSTRING;
  try
    ADOConn.Connected := true;
  except
    on EDatabaseError do
      begin
        MessageDlg('The MsSql DB connection failed.', mtInformation, [mbOk], 0);
      end;
  end;
  
  alpha[1]  := 'A';
  alpha[2]  := 'B';
  alpha[3]  := 'C';
  alpha[4]  := 'D';
  alpha[5]  := 'E';
  alpha[6]  := 'F';
  alpha[7]  := 'G';
  alpha[8]  := 'H';
  alpha[9]  := 'I';
  alpha[10] := 'J';
  alpha[11] := 'K';
  alpha[12] := 'L';
  alpha[13] := 'M';
  alpha[14] := 'N';
  alpha[15] := 'O';
  alpha[16] := 'P';
  alpha[17] := 'Q';
  alpha[18] := 'R';
  alpha[19] := 'S';
  alpha[20] := 'T';
  alpha[21] := 'U';
  alpha[22] := 'V';
  alpha[23] := 'W';
  alpha[24] := 'X';
  alpha[25] := 'Y';
  alpha[26] := 'Z';

  colors[0] := 6;
  colors[1] := 39;
end;

destructor TModuleReport.Destroy;
begin
  ADOConn.Free;
end;

function TModuleReport.transRowsNum(row: integer): string;
var
  str : string;
  multiple : integer;
begin
  str := '';
  if row div 27 > 0 then
  begin
    multiple := row div 26;
    str := alpha[multiple];
  end;
  multiple := row mod 26;
  if (multiple = 0) then begin
    multiple := 26;
    str := '';
    if row div 27 > 0 then str := alpha[row div 26 - 1];
    str := str + alpha[multiple];
    result := str;
  end else begin
    str := str + alpha[multiple];
    result := str;
  end;
end;

function TModuleReport.createSmallScheduleReport(processid: string;
  startdate, enddate: TDateTime): string;
const
  DAYSPERSHEET : integer = 7;
var
  OleApp: Variant;
  days,sheetCount,i,j,rownum,realnum : integer;
  retStr : string;
  query : TADOQuery;
  FileName : String;
begin
  FileName := 'Small_'+
              formatDateTime('yyyyMMdd',startdate)+'_'+
              formatDateTime('yyyyMMdd',enddate)+'.xls';
  retStr := '';
  days := trunc(enddate-startdate+1);
  if days > 0 then begin
    try
      query := TADOQuery.Create(nil);
      query.Connection := ADOConn;
      query.SQL.Text := 'select * from tb_'+processid+' order by priority';
      query.Open ;

      OleApp:=CreateOleObject('Excel.Application');
      //OleApp.Visible:=true;
      OleApp.Workbooks.add;

      OleApp.Caption :=processid+'¡¼¡¼¥Ü';

      startdate := trunc (startdate);
      enddate := trunc (enddate);

      days := trunc(enddate - startdate);
      sheetCount := days div DAYSPERSHEET;
      if days mod DAYSPERSHEET <> 0 then sheetCount := sheetCount + 1;

      for i:=1 to sheetCount do begin
        rownum := 1;
        if OleApp.WorkSheets.Count < i then
          OleApp.Sheets.Add(EmptyParam,OleApp.Sheets[OleApp.WorkSheets.Count],EmptyParam,EmptyParam);
        OleApp.WorkSheets[i].Select;
        if i = sheetCount then begin
          days := days mod DAYSPERSHEET;
          if days = 0 then days := DAYSPERSHEET;
        end else begin
          days := DAYSPERSHEET;
        end;

        //************************************************************************
        //setting sheet header
        //************************************************************************
        rownum := _setSmallSheetHeader(OleApp, i,startdate, days);

        //************************************************************************
        //setting block header
        //************************************************************************
        rownum := _setSmallBlockHeaderFooter(OleApp,i,rownum,startdate,days,true);

        //************************************************************************
        //setting file body part
        //************************************************************************
        if (query.RecordCount > 0) then begin
          query.First ;
          for j:= 1 to query.RecordCount do begin
            realnum := _setSmallMachineInfo(OleApp,i,processid,query.fieldbyName('MachineId').AsString,startdate,days,rownum,4,3);
            if realnum = 0 then begin
              rowNum := rowNum + 4 + 3;
            end else begin
              _setSmallMachineInfo(OleApp,i,processid,query.fieldbyName('MachineId').AsString,startdate,days,rownum,realnum,3);
              rowNum := rowNum + realnum + 3;
            end;
            query.Next ;
          end; 
        end;

        //************************************************************************
        //setting block footer
        //************************************************************************
        _setSmallBlockHeaderFooter(OleApp,i,rownum,startdate,days,false);

        startdate := startdate + DAYSPERSHEET;
      end;

      OleApp.ActiveWorkBook.SaveAs( ExcelPath + FileName );
      OleApp.ActiveWorkBook.Saved := True;
      retStr := FileName;
    finally
      OleApp.WorkBooks.Close;
      OleApp.Quit;
      OleApp := Unassigned;
      query.Free;
    end;
  end;
  result := retStr;
end;

function TModuleReport._setSmallSheetHeader(OleApp : Variant; sheet : integer;
  dt:TDateTime; days :integer) : integer;
var
  dtStart,dtEnd : TDateTime;
begin
  dtStart := dt;
  dtEnd := dt + days - 1;

  OleApp.WorkSheets[sheet].Name := FormatDateTime('MM¡¼dd¡¼',dtStart)+'-'+FormatDateTime('MM¡¼dd¡¼',dtEnd);
  //****************************************************************************
  //setting file header part
  //****************************************************************************
  OleApp.WorkSheets[sheet].Cells[1,1].Value := 'A-¡¼®a';
  OleApp.WorkSheets[sheet].Cells[2,1].Value := 'B-¡¼¶]';
  OleApp.WorkSheets[sheet].Cells[3,1].Value := 'C-¡¼®a';
  OleApp.WorkSheets[sheet].Cells[4,1].Value := 'H-¡¼¤B(30min¡¼ÂÎ¡¼)';
  //set style
  OleApp.worksheets[sheet].Columns[1].ColumnWidth := 10;
  OleApp.worksheets[sheet].Columns[2].ColumnWidth := 2.5;
  OleApp.worksheets[sheet].range['A1:A4'].select;
  OleApp.Selection.Font.Bold := True;
  OleApp.WorkSheets[sheet].Cells[2,1].Font.ColorIndex := 5;
  OleApp.WorkSheets[sheet].Cells[3,1].Font.ColorIndex := 3;

  OleApp.WorkSheets[sheet].Cells[1,3].Value := 'i-Â¦¡¼(Íg¡¼¡¼¡¼¡¼£K,¢|¡¼±Y¡¼Â¦¡¼¹ní~)';
  OleApp.WorkSheets[sheet].Cells[2,3].Borders[xlDiagonalDown].LineStyle := xlContinuous;
  OleApp.WorkSheets[sheet].Cells[2,4].Value := '¢|¡¼±Y¡¼¡¼';
  OleApp.WorkSheets[sheet].Cells[3,3].Interior.ColorIndex := 39;
  OleApp.WorkSheets[sheet].Cells[3,4].Value := '¡¼£K';
  OleApp.WorkSheets[sheet].range['A1:D3'].Select;
  OleApp.Selection.Font.Size := 10;
  OleApp.Selection.Font.Bold := True;
  result := 5;
end;

function TModuleReport._setSmallBlockHeaderFooter(OleApp: Variant; sheet : integer;
  rowNum: integer; dt: TDateTime; days: integer; isHeader: boolean) : integer;
var
  i : integer;
  sStartLocate, sEndLocate : string;
begin
  OleApp.WorkSheets[sheet].range['A'+IntToStr(rowNum)+':B'+IntToStr(rowNum)].Select;
  OleApp.Selection.Merge(True);
  OleApp.Selection.WrapText := true;
  OleApp.Selection.Borders[xlDiagonalDown].LineStyle := xlContinuous;
  OleApp.Selection.Borders[xlEdgeLeft].LineStyle := xlNone;
  OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlNone;
  OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlNone;
  OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlNone;
  OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlNone;
  OleApp.Selection.Borders.Weight := xlThin;
  OleApp.Selection.Borders[xlEdgeTop].Weight := xlMedium;
  OleApp.Selection.Font.Size := 8;
  OleApp.Selection.Font.Bold := True;
  OleApp.worksheets[sheet].Rows[rowNum].RowHeight := 30;

  OleApp.ActiveCell.FormulaR1C1 := '    ¡¼ÂW      ³Z¡¼Úñ¸¡';
  OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':B'+IntToStr(rowNum)].select;
  OleApp.Selection.Interior.ColorIndex := 37;

  //****************************************************************************
  for i:=0 to (days)*2-1 do begin
    OleApp.worksheets[sheet].Columns[1+i*4+LOCATEDAYS].ColumnWidth := 18;
    OleApp.worksheets[sheet].Columns[2+i*4+LOCATEDAYS].ColumnWidth := 1.5;
    OleApp.worksheets[sheet].Columns[3+i*4+LOCATEDAYS].ColumnWidth := 3.5;
    OleApp.worksheets[sheet].Columns[4+i*4+LOCATEDAYS].ColumnWidth := 1.5;
  end;

  //Merge
  for i:=0 to days-1 do begin
    sStartLocate := transRowsNum(1+i*8+LOCATEDAYS);
    sEndLocate := transRowsNum(8+i*8+LOCATEDAYS);
    OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum)+':'+sEndLocate+IntToStr(rowNum)].Select;
    OleApp.Selection.Merge(True);
    if isHeader = true then begin
      OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeTop].Weight := xlMedium;
    end else begin
      OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
    end ;
    if i = days-1 then begin
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlMedium;
    end else begin
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThick;
    end;

    if isHeader = true then begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThin;
    end else begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlMedium;
    end ;


    OleApp.Selection.HorizontalAlignment := xlCenter;
    OleApp.Selection.ReadingOrder := xlContext;
    OleApp.Selection.NumberFormatLocal := '@';
    OleApp.Selection.Font.Size := 12;
    OleApp.Selection.Font.Bold := True;
    OleApp.Selection.Value := FormatDateTime('M/dd',dt);

    dt := dt + 1;
  end;
  result := rowNum + 1;
end;


function TModuleReport._setSmallMachineInfo(OleApp: Variant; sheet : integer;
  processid, machineid: string; dt: TDateTime; days, rowNum, scheduleNum,
  interNum: integer): integer;
var
  i,locate,vOffset,hOffset : integer;
  queryMachine,queryProcess : TADOQuery;
  cdt : TDateTime;
  errorCode : integer;
begin
  errorCode := 0;
  queryMachine := TADOQuery.Create(nil);
  queryProcess := TADOQuery.Create(nil);
  try
    queryMachine.Active := false;
    queryMachine.Connection := ADOConn;
    queryProcess.Active := false;
    queryProcess.Connection := ADOConn;

    //get machine detail
    queryMachine.SQL.Text := 'select * from tb_'+processid+' where machineid='''+machineid+'''';
    queryMachine.Open ;
    if queryMachine.RecordCount = 0 then exit;

    OleApp.WorkSheets[sheet].Cells[rowNum+2,1].Value := machineid;
    OleApp.WorkSheets[sheet].Cells[rowNum+3,1].Value := queryMachine['Description'];
    OleApp.WorkSheets[sheet].Cells[rowNum+1,2].Value := 'ð@';
    OleApp.WorkSheets[sheet].Cells[rowNum+2,2].Value := 'ÁÊ';
    OleApp.WorkSheets[sheet].Cells[rowNum+4,2].Value := 'Â¦';
    OleApp.WorkSheets[sheet].Cells[rowNum+6,2].Value := '¡¼';
    OleApp.WorkSheets[sheet].range['A'+IntToStr(rowNum)+':A'+IntToStr(rowNum+scheduleNum+interNum-1)].Select;
    OleApp.Selection.Font.Size := 12;
    OleApp.Selection.Font.Bold := True;
    OleApp.Selection.Interior.ColorIndex := 37;
    OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    OleApp.WorkSheets[sheet].range['B'+IntToStr(rowNum)+':B'+IntToStr(rowNum+scheduleNum+interNum-1)].Select;
    OleApp.Selection.Font.Size := 10;
    OleApp.Selection.Font.Bold := True;
    OleApp.Selection.Interior.ColorIndex := 37;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    OleApp.WorkSheets[sheet].Cells[rowNum+4,2].Borders[xlEdgeTop].LineStyle := xlContinuous;
    OleApp.WorkSheets[sheet].Cells[rowNum+4,2].Borders[xlEdgeTop].Weight := xlThin;

    for i := 0 to days - 1 do begin
      OleApp.WorkSheets[sheet].range[transRowsNum(3+i*8)+IntToStr(rowNum)+':'+transRowsNum(3+7+i*8)+IntToStr(rowNum+scheduleNum-1)].Select;
      OleApp.Selection.Borders[xlEdgeLeft].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeLeft].Weight := xlThick;
      OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThin;
      if i = days-1 then begin
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlThick;
      end else begin
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlMedium;
      end;
      OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
      OleApp.Selection.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlInsideHorizontal].Weight := xlHairline;

      OleApp.WorkSheets[sheet].range[transRowsNum(3+i*8)+IntToStr(rowNum+scheduleNum)+':'+transRowsNum(3+7+i*8)+IntToStr(rowNum+scheduleNum+interNum-1)].Select;
      OleApp.Selection.Borders[xlEdgeLeft].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeLeft].Weight := xlThick;
      OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      if i = days-1 then begin
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlThick;
      end else begin
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlMedium;
      end;
      OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
      OleApp.Selection.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlInsideHorizontal].Weight := xlHairline;
    end;

    queryProcess.SQL.Text := 'select * from tb_process'+processid+' e LEFT JOIN tb_order o ON e.ModuleId = o.ModuleId '+
                             ' where e.processdate >='''+formatDateTime('yyyy-MM-dd',dt)+''' AND '+
                             ' e.processdate <='''+formatDateTime('yyyy-MM-dd',dt+days)+''' AND '+
                             ' e.'+processid+'id ='''+machineid+''' '+
                             ' order by e.processDate,e.partno ';
    queryProcess.Open ;

    i := 0;
    locate := 1;
    while not queryProcess.Eof do begin
      cdt := queryProcess['processDate'];
      if trunc(cdt-dt) <> i then begin
        i := trunc(cdt-dt);
        locate := 1;
      end;
      if locate - scheduleNum <= 0 then begin
        hOffset := 0;
        vOffset := locate;
      end else begin
        hOffset := 4;
        vOffset := locate - scheduleNum;
      end;

      OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,3+hOffset+i*8].Value :=
            IntToStr(vOffset)+'.'+queryProcess.FieldByName('moduleid').AsString+' '+queryProcess.FieldByName('partno_id').AsString;
      if not queryProcess.FieldByName('producttypeid').IsNull then begin
        if queryProcess.FieldByName('producttypeid').AsString = 'CH' then
          OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,4+hOffset+i*8].Value := 'B';
        if queryProcess.FieldByName('producttypeid').AsString = 'FIX' then
          OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,4+hOffset+i*8].Value := 'C';
        if queryProcess.FieldByName('producttypeid').AsString = 'NEW' then
          OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,4+hOffset+i*8].Value := 'A';
      end;

      OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,5+hOffset+i*8].Value := Format('%.1d',[queryProcess.FieldByName('processminutes').AsInteger div 30]);
      OleApp.WorkSheets[sheet].Cells[rowNum+vOffset-1,6+hOffset+i*8].Value := 'H';

      OleApp.WorkSheets[sheet].Range[transRowsNum(3+hOffset+i*8)+IntToStr(rowNum+vOffset-1)+':'+transRowsNum(6+hOffset+i*8)+IntToStr(rowNum+vOffset-1)].Select;
      OleApp.Selection.Font.Size := 8;
      OleApp.Selection.Interior.ColorIndex := 39;

      locate := locate + 1;
      if locate > scheduleNum * 2 then begin
        errorCode := (locate - scheduleNum * 2) div 2;
        if (locate - scheduleNum * 2) div 2 <> 0 then begin
          errorCode := errorCode + 1;
        end;
      end;

      queryProcess.Next ; 
    end;
  finally
    queryMachine.Close ;
    queryMachine.Free ;
    queryProcess.Close ;
    queryProcess.Free ;
  end;
  result := errorCode;
end;

//******************************************************************************
//***************     Middle Schedule Create   *********************************
//******************************************************************************

function TModuleReport.createMiddleScheduleReport(startdate,
  enddate: TDateTime): string;
var
  days,i,count,rownum : integer;
  dt : TDateTime;
  OleApp: Variant;
  retStr : String;
  FileName : String;
begin
  FileName := 'Middle_'+
              formatDateTime('yyyyMMdd',startdate)+'_'+
              formatDateTime('yyyyMMdd',enddate)+'.xls';
  retStr := '';
  days := trunc(enddate-startdate+1);
  if days > 0 then begin
    OleApp:=CreateOleObject('Excel.Application');
    OleApp.Visible:=true;
    OleApp.Workbooks.add;

    startdate := trunc (startdate);
    enddate := trunc (enddate);

    days := trunc(enddate - startdate);
    count := days div 10;
    if days mod 10 <> 0 then count := count + 1;

    for i:=1 to count do begin
      if OleApp.WorkSheets.Count < i then
        OleApp.Sheets.Add(EmptyParam,OleApp.Sheets[OleApp.WorkSheets.Count],EmptyParam,EmptyParam);
      OleApp.WorkSheets[i].Select;
      OleApp.WorkSheets[i].Name := FormatDateTime('MM¡¼dd¡¼',startdate)+'-'+FormatDateTime('MM¡¼dd¡¼',startdate+10);
      if (i = count) AND (days mod 10 <> 0) then begin
        setMiddleBlockHeaderFooter(OleApp,i,3,startdate+(i-1)*10,days mod 10,true); //header
        rownum := setMiddleMachineInfo(OleApp,i,4,startdate+(i-1)*10,days mod 10);
        setMiddleBlockHeaderFooter(OleApp,i,rownum,startdate+(i-1)*10,days mod 10,false); //footer
      end else begin
        setMiddleBlockHeaderFooter(OleApp,i,3,startdate+(i-1)*10,10,true); //header
        rownum := setMiddleMachineInfo(OleApp,i,4,startdate+(i-1)*10,10);
        setMiddleBlockHeaderFooter(OleApp,i,rownum,startdate+(i-1)*10,10,false); //footer
      end;
    end;
    OleApp.ActiveWorkBook.SaveAs( ExcelPath + FileName );
    OleApp.ActiveWorkBook.Saved := True;
    OleApp.WorkBooks.Close;
    OleApp.Quit;
    OleApp := Unassigned;
    retStr := FileName;
  end;   

  result := retStr;
end;

procedure TModuleReport.setMiddleBlockHeaderFooter(OleApp: Variant; sheet,
  rowNum: Integer; dt: TDateTime; days: integer; isHeader: boolean);
var
  i : integer;
  sStartLocate, sEndLocate : string;
begin
  //change column with
  OleApp.WorkSheets[sheet].Select;
  sStartLocate := transRowsNum(days*24+MIDLOCATEDAYS);
  OleApp.WorkSheets[sheet].Columns['C:'+sStartLocate].Select;
  OleApp.Selection.ColumnWidth := 1;
  OleApp.WorkSheets[sheet].Columns[1].ColumnWidth := 4.5;
  OleApp.WorkSheets[sheet].Columns[1].Font.Size := 14;
  OleApp.WorkSheets[sheet].Columns[2].ColumnWidth := 4.15;

  //change view percent
  OleApp.ActiveWindow.Zoom := 75;

  OleApp.WorkSheets[sheet].Cells[rowNum,1].Value := '¡¼ÂW';
  OleApp.WorkSheets[sheet].Cells[rowNum,2].Value := YearOf(dt);
  OleApp.WorkSheets[sheet].Cells[rowNum,2].Interior.ColorIndex := 36;

  //Merge
  for i:=0 to days-1 do begin
    sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
    sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
    OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum)+':'+sEndLocate+IntToStr(rowNum)].Select;
    OleApp.Selection.Merge;
    OleApp.Selection.HorizontalAlignment := xlCenter;
    OleApp.Selection.ReadingOrder := xlContext;
    OleApp.Selection.NumberFormatLocal := '@';
    OleApp.Selection.Font.Size := 12;
    OleApp.Selection.Font.Bold := True;
    OleApp.Selection.Value := FormatDateTime('M/dd',dt);
    OleApp.Selection.Interior.ColorIndex := 36;
    dt := dt + 1;
  end;

  sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
  OleApp.WorkSheets[sheet].Cells[rowNum,sEndLocate].Value := '¡¼ÂW';
  OleApp.WorkSheets[sheet].Cells[rowNum,sEndLocate].Interior.ColorIndex := 36;

  OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+sEndLocate+IntToStr(rowNum)].Select;
  OleApp.Selection.Borders.LineStyle := xlContinuous;
  OleApp.Selection.Borders.Weight := xlThin;
end;

function TModuleReport.setMiddleMachineInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  HeaderHeight : integer = 10;
  DesignHeight : integer = 28;
  PrepareHeight : integer = 8;
  PrepareOutHeight : integer = 4;
var
  i,j,locate,vOffset,hOffset : integer;
  query : TADOQuery;
  cdt : TDateTime;
  sStartLocate, sEndLocate : string;
begin
  dt := trunc(dt);
  query := TADOQuery.Create(nil);
  try
    query.Active := false;
    query.Connection := ADOConn;

    //Header
    OleApp.WorkSheets[sheet].Range['A'+IntToStr(rowNum)+':A'+IntToStr(rowNum+HeaderHeight-1)].Select;
    OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    OleApp.WorkSheets[sheet].Range['B'+IntToStr(rowNum)+':B'+IntToStr(rowNum+HeaderHeight-1)].Select;
    OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    OleApp.Selection.Interior.ColorIndex := 15;
    
    for i:=0 to days-1 do begin
      sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
      sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
      OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum)+':'+sEndLocate+IntToStr(rowNum+HeaderHeight-1)].Select;
      OleApp.Selection.Interior.ColorIndex := 2;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
      if i = days -1 then begin
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      end;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    end;

    sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
    OleApp.worksheets[sheet].range[sEndLocate+IntToStr(rowNum)+':'+sEndLocate+IntToStr(rowNum+HeaderHeight-1)].Select;
    OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeTop].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    OleApp.Selection.Interior.ColorIndex := 15;

    //Design part
    rowNum := rowNum + HeaderHeight;
    _setMiddleDesignProcessInfo(OleApp, sheet, rowNum, dt, days);
    //Prepare part
    rowNum := rowNum + DesignHeight;
    _setMiddlePrepareProcessInfo(OleApp, sheet, rowNum, dt, days);
    //Cut part
    rowNum := rowNum + PrepareHeight + PrepareOutHeight;
    rowNum := _setMiddleCutProcessInfo(OleApp, sheet, rowNum, dt, days);
    rowNum := _setMiddleCncProcessInfo(OleApp, sheet, rowNum, dt, days);
    rowNum := _setMiddleCncnProcessInfo(OleApp, sheet, rowNum, dt, days);
    rowNum := _setMiddleEdmProcessInfo(OleApp, sheet, rowNum, dt, days);
    result := rowNum;
  finally
    query.Close ;
    query.Free ;
  end;
end;

///*************************************************************************
///***************** Middle Design Part ************************************
///*************************************************************************
function TModuleReport._setMiddleDesignProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  DesignHeight : integer = 28;
var
  i,j: integer;
  sStartLocate, sEndLocate : string;
begin
  OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+DesignHeight-1)].Select;
  OleApp.Selection.Merge;
  OleApp.ActiveCell.FormulaR1C1 := '¡¼ð@';
  OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
  OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
  OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
  OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
  //design left
  for i:=0 to DesignHeight div 2 - 1 do begin
    OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
    OleApp.Selection.Merge;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
    if i = DesignHeight div 2 - 1 then begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    end;
    if i mod 2 = 0 then
      OleApp.Selection.Interior.ColorIndex := 15;
  end;
  //design center
  for i:=0 to days-1 do begin
    sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
    sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
    for j:=0 to DesignHeight div 2 - 1 do begin
      if j mod 2 = 0 then begin
        OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
        OleApp.Selection.Interior.ColorIndex := 2;
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
        if i = days -1 then begin
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
        end;
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
        if j = DesignHeight div 2 - 1 then begin
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
        end;
      end else begin
        OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
        OleApp.Selection.Interior.ColorIndex := 2;
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
        if i = days -1 then begin
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
        end;
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
        OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
        if j = DesignHeight div 2 - 1 then begin
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
        end;
      end;
    end;
  end;
  //design right
  sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
  for i:=0 to DesignHeight div 2 - 1 do begin
    OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
    OleApp.Selection.Merge;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
    if i = DesignHeight div 2 - 1 then begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    end;
    if i mod 2 = 0 then
      OleApp.Selection.Interior.ColorIndex := 15;
  end;
end;

///*************************************************************************
///***************** Middle Prepare Part ***********************************
///*************************************************************************
function TModuleReport._setMiddlePrepareProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  PrepareHeight : integer = 8;
  PrepareOutHeight : integer = 4;
var
  i,j: integer;
  sStartLocate, sEndLocate : string;
begin
  OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+PrepareHeight+PrepareOutHeight-1)].Select;
  OleApp.Selection.Merge;
  OleApp.ActiveCell.FormulaR1C1 := 'ºÙ¡¼';
  OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
  OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
  OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
  OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
  //prepare left
  for i:=0 to (PrepareHeight+PrepareOutHeight) div 2 - 1 do begin
    OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
    OleApp.Selection.Merge;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
    if i = (PrepareHeight+PrepareOutHeight) div 2 - 1 then begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    end;
    if i mod 2 = 0 then
      OleApp.Selection.Interior.ColorIndex := 15;
    if (i mod 2 = 0) AND (i > PrepareHeight div 2 - 1) then
      OleApp.Selection.Value := '¡¼Ò©';
  end;
  //prepare center
  for i:=0 to days-1 do begin
    sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
    sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
    for j:=0 to (PrepareHeight+PrepareOutHeight) div 2 - 1 do begin
      if j mod 2 = 0 then begin
        OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
        OleApp.Selection.Interior.ColorIndex := 2;
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
        if i = days -1 then begin
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
        end;
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
        if j = (PrepareHeight+PrepareOutHeight) div 2 - 1 then begin
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
        end;
        if j > PrepareHeight div 2 - 1 then begin
          if j = PrepareHeight div 2 then begin
            OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
          end;
          OleApp.Selection.Interior.ColorIndex := 34;
        end;
      end else begin
        OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
        OleApp.Selection.Interior.ColorIndex := 2;
        OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
        if i = days -1 then begin
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
        end;
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
        OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
        OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
        if j = (PrepareHeight+PrepareOutHeight) div 2 - 1 then begin
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
        end;
        if j > PrepareHeight div 2 - 1 then begin
          if j = PrepareHeight div 2 then begin
            OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
          end;
          OleApp.Selection.Interior.ColorIndex := 34;
        end;
      end;
    end;
  end;
  //prepare right
  sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
  for i:=0 to (PrepareHeight+PrepareOutHeight) div 2 - 1 do begin
    OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
    OleApp.Selection.Merge;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
    if i = (PrepareHeight+PrepareOutHeight) div 2 - 1 then begin
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
    end;
    if i mod 2 = 0 then
      OleApp.Selection.Interior.ColorIndex := 15;
    if (i mod 2 = 0) AND (i > PrepareHeight div 2 - 1) then
      OleApp.Selection.Value := '¡¼Ò©';
  end;
end;

///*************************************************************************
///***************** Middle Cut E C Part ***********************************
///*************************************************************************
function TModuleReport._setMiddleCutProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  OutHeight : integer = 1 * 4;
var
  i,j,x: integer;
  sStartLocate, sEndLocate : string;
  InnerHeight : integer ;

  queryMachine : TADOQuery;
  queryProcess : TADOQuery;
  xlocate, ylocate,yoffset,timeLen : integer;
begin
  queryMachine := TADOQuery.Create(nil);
  queryProcess := TADOQuery.Create(nil);

  try
    queryMachine.Connection := ADOConn;
    queryProcess.Connection := ADOConn;

    queryMachine.SQL.Text := 'select * from tb_cut order by Priority';
    queryMachine.Open ;
    InnerHeight := queryMachine.RecordCount * 4;

    OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+InnerHeight+OutHeight-1)].Select;
    OleApp.Selection.Merge;
    OleApp.ActiveCell.FormulaR1C1 := 'E C';
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    //cut left
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //cut center
    for i:=0 to days-1 do begin
      sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
      sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
      for j:=0 to (InnerHeight + OutHeight) div 2 - 1 do begin
        if j mod 2 = 0 then begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end else begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end;
      end;
    end;

    //cut right
    sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //fill data from db


    queryMachine.First ;
    for i:=0 to queryMachine.RecordCount - 1 do begin //³Z¡¼æÁ¦O
      //¸h¡¼§¨¡¼Å~¡Èíå
      xlocate := rowNum + i * 4;
      ylocate := MIDLOCATEDAYS + 1;

      for j:=1 to days do begin //¡¼ÂW¡¼æÁ¦O
        //÷D¡¼§¨¡¼Å~¡Èíå
        ylocate := ylocate + (j-1)*24;
        yoffset := 0;
        x := 0;
        queryProcess.Active := false ;
        queryProcess.SQL.Text := 'select * from tb_processCut e LEFT JOIN tb_order o ON e.ModuleId = o.ModuleId '+
                               ' where e.processdate ='''+formatDateTime('yyyy-MM-dd',dt+j-1)+''' AND '+
                               ' e.cutid ='''+queryMachine.fieldbyName('machineid').AsString+''' '+
                               ' order by e.processDate,e.partno ';
        queryProcess.Open ;
        if queryProcess.RecordCount > 0 then begin
          //ÆB³Z¡¼¡¼ÆB¡¼ÂW£V¹G¥Ü¡¼»í
          while not queryProcess.Eof do begin
            timeLen := queryProcess.fieldByName('ProcessMinutes').AsInteger;
            if timeLen mod 60 = 0 then begin
              timeLen := timeLen div 60;
            end else begin
              timeLen := timeLen div 60 + 1;
            end;
            if yoffset >= 23 then break;
            if yoffset + timeLen >= 23 then timeLen := 24 - yoffset;
            //fill data
            OleApp.worksheets[sheet].Cells[xlocate,ylocate+yoffset].Value :=
              queryProcess.FieldByName('moduleid').AsString+','+
              queryProcess.FieldByName('partno_id').AsString+','+
              format('%.1d',[queryProcess.FieldByName('ProcessMinutes').AsInteger]); // format : moduleid, partno_id,lens
            //«Ò¡g¹K
            OleApp.worksheets[sheet].Range[transRowsNum(ylocate+yoffset)+IntToStr(xlocate+2)+':'+
                                           transRowsNum(ylocate+yoffset+timeLen-1)+IntToStr(xlocate+3)].Select;
            OleApp.Selection.Interior.ColorIndex := colors[x mod 2];
            x := x + 1;
            yoffset := yoffset + timeLen;
            queryProcess.Next ;
          end;
        end; // queryProcess.RecordCount > 0
      end; // for j
      queryMachine.Next;
    end; // for i
  finally
    queryMachine.Close ;
    queryProcess.Close ;
    queryMachine.Free ;
    queryProcess.Free ;
  end;

  result := rowNum + InnerHeight + OutHeight;
end;

///*************************************************************************
///***************** Middle Assemble Part **********************************
///*************************************************************************
function TModuleReport._setMiddleAssembleProcessInfo(OleApp: Variant;
  sheet, rowNum: integer; dt: TDateTime; days: integer): integer;
begin
end;

///*************************************************************************
///***************** Middle CNCN Part **************************************
///*************************************************************************
function TModuleReport._setMiddleCNCNProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  OutHeight : integer = 1 * 4;
var
  i,j,x: integer;
  sStartLocate, sEndLocate : string;
  InnerHeight : integer ;

  queryMachine : TADOQuery;
  queryProcess : TADOQuery;
  xlocate, ylocate,yoffset,timeLen : integer;
begin
  queryMachine := TADOQuery.Create(nil);
  queryProcess := TADOQuery.Create(nil);

  try
    queryMachine.Connection := ADOConn;
    queryProcess.Connection := ADOConn;

    queryMachine.SQL.Text := 'select * from tb_cncn order by Priority';
    queryMachine.Open ;
    InnerHeight := queryMachine.RecordCount * 4;

    OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+InnerHeight+OutHeight-1)].Select;
    OleApp.Selection.Merge;
    OleApp.ActiveCell.FormulaR1C1 := 'C N C ª¤Þï³Z';
    OleApp.ActiveCell.WrapText := True;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    //cut left
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //cut center
    for i:=0 to days-1 do begin
      sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
      sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
      for j:=0 to (InnerHeight + OutHeight) div 2 - 1 do begin
        if j mod 2 = 0 then begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end else begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end;
      end;
    end;

    //cut right
    sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //fill data from db


    queryMachine.First ;
    for i:=0 to queryMachine.RecordCount - 1 do begin //³Z¡¼æÁ¦O
      //¸h¡¼§¨¡¼Å~¡Èíå
      xlocate := rowNum + i * 4;
      ylocate := MIDLOCATEDAYS + 1;

      for j:=1 to days do begin //¡¼ÂW¡¼æÁ¦O
        //÷D¡¼§¨¡¼Å~¡Èíå
        ylocate := ylocate + (j-1)*24;
        yoffset := 0;
        x := 0;
        queryProcess.Active := false ;
        queryProcess.SQL.Text := 'select * from tb_processCncn e LEFT JOIN tb_order o ON e.ModuleId = o.ModuleId '+
                               ' where e.processdate ='''+formatDateTime('yyyy-MM-dd',dt+j-1)+''' AND '+
                               ' e.cncnid ='''+queryMachine.fieldbyName('machineid').AsString+''' '+
                               ' order by e.processDate,e.partno ';
        queryProcess.Open ;
        if queryProcess.RecordCount > 0 then begin
          //ÆB³Z¡¼¡¼ÆB¡¼ÂW£V¹G¥Ü¡¼»í
          while not queryProcess.Eof do begin
            timeLen := queryProcess.fieldByName('ProcessMinutes').AsInteger;
            if timeLen mod 60 = 0 then begin
              timeLen := timeLen div 60;
            end else begin
              timeLen := timeLen div 60 + 1;
            end;
            if yoffset >= 23 then break;
            if yoffset + timeLen >= 23 then timeLen := 24 - yoffset;
            //fill data
            OleApp.worksheets[sheet].Cells[xlocate,ylocate+yoffset].Value :=
              queryProcess.FieldByName('moduleid').AsString+','+
              queryProcess.FieldByName('partno_id').AsString+','+
              format('%.1d',[queryProcess.FieldByName('ProcessMinutes').AsInteger]); // format : moduleid, partno_id,lens
            //«Ò¡g¹K
            OleApp.worksheets[sheet].Range[transRowsNum(ylocate+yoffset)+IntToStr(xlocate+2)+':'+
                                           transRowsNum(ylocate+yoffset+timeLen-1)+IntToStr(xlocate+3)].Select;
            OleApp.Selection.Interior.ColorIndex := colors[x mod 2];
            x := x + 1;
            yoffset := yoffset + timeLen;
            queryProcess.Next ;
          end;
        end; // queryProcess.RecordCount > 0
      end; // for j
      queryMachine.Next;
    end; // for i
  finally
    queryMachine.Close ;
    queryProcess.Close ;
    queryMachine.Free ;
    queryProcess.Free ;
  end;

  result := rowNum + InnerHeight + OutHeight;
end;

///*************************************************************************
///***************** Middle CNC Part ***************************************
///*************************************************************************
function TModuleReport._setMiddleCNCProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  OutHeight : integer = 2 * 4;
var
  i,j,x: integer;
  sStartLocate, sEndLocate : string;
  InnerHeight : integer ;

  queryMachine : TADOQuery;
  queryProcess : TADOQuery;
  xlocate, ylocate,yoffset,timeLen : integer;
begin
  queryMachine := TADOQuery.Create(nil);
  queryProcess := TADOQuery.Create(nil);

  try
    queryMachine.Connection := ADOConn;
    queryProcess.Connection := ADOConn;

    queryMachine.SQL.Text := 'select * from tb_cnc order by Priority';
    queryMachine.Open ;
    InnerHeight := queryMachine.RecordCount * 4;

    OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+InnerHeight+OutHeight-1)].Select;
    OleApp.Selection.Merge;
    OleApp.ActiveCell.FormulaR1C1 := 'C N C Ä§Öµ³Z';
    OleApp.ActiveCell.WrapText := True;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    //cut left
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //cut center
    for i:=0 to days-1 do begin
      sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
      sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
      for j:=0 to (InnerHeight + OutHeight) div 2 - 1 do begin
        if j mod 2 = 0 then begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end else begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end;
      end;
    end;

    //cut right
    sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //fill data from db


    queryMachine.First ;
    for i:=0 to queryMachine.RecordCount - 1 do begin //³Z¡¼æÁ¦O
      //¸h¡¼§¨¡¼Å~¡Èíå
      xlocate := rowNum + i * 4;
      ylocate := MIDLOCATEDAYS + 1;

      for j:=1 to days do begin //¡¼ÂW¡¼æÁ¦O
        //÷D¡¼§¨¡¼Å~¡Èíå
        ylocate := ylocate + (j-1)*24;
        yoffset := 0;
        x := 0;
        queryProcess.Active := false ;
        queryProcess.SQL.Text := 'select * from tb_processCnc e LEFT JOIN tb_order o ON e.ModuleId = o.ModuleId '+
                               ' where e.processdate ='''+formatDateTime('yyyy-MM-dd',dt+j-1)+''' AND '+
                               ' e.cncid ='''+queryMachine.fieldbyName('machineid').AsString+''' '+
                               ' order by e.processDate,e.partno ';
        queryProcess.Open ;
        if queryProcess.RecordCount > 0 then begin
          //ÆB³Z¡¼¡¼ÆB¡¼ÂW£V¹G¥Ü¡¼»í
          while not queryProcess.Eof do begin
            timeLen := queryProcess.fieldByName('ProcessMinutes').AsInteger;
            if timeLen mod 60 = 0 then begin
              timeLen := timeLen div 60;
            end else begin
              timeLen := timeLen div 60 + 1;
            end;
            if yoffset >= 23 then break;
            if yoffset + timeLen >= 23 then timeLen := 24 - yoffset;
            //fill data
            OleApp.worksheets[sheet].Cells[xlocate,ylocate+yoffset].Value :=
              queryProcess.FieldByName('moduleid').AsString+','+
              queryProcess.FieldByName('partno_id').AsString+','+
              format('%.1d',[queryProcess.FieldByName('ProcessMinutes').AsInteger]); // format : moduleid, partno_id,lens
            //«Ò¡g¹K
            OleApp.worksheets[sheet].Range[transRowsNum(ylocate+yoffset)+IntToStr(xlocate+2)+':'+
                                           transRowsNum(ylocate+yoffset+timeLen-1)+IntToStr(xlocate+3)].Select;
            OleApp.Selection.Interior.ColorIndex := colors[x mod 2];
            x := x + 1;
            yoffset := yoffset + timeLen;
            queryProcess.Next ;
          end;
        end; // queryProcess.RecordCount > 0
      end; // for j
      queryMachine.Next;
    end; // for i
  finally
    queryMachine.Close ;
    queryProcess.Close ;
    queryMachine.Free ;
    queryProcess.Free ;
  end;

  result := rowNum + InnerHeight + OutHeight;
end;

///*************************************************************************
///***************** Middle EDM Part ***************************************
///*************************************************************************
function TModuleReport._setMiddleEDMProcessInfo(OleApp: Variant; sheet,
  rowNum: integer; dt: TDateTime; days: integer): integer;
const
  OutHeight : integer = 1 * 4;
var
  i,j,x: integer;
  sStartLocate, sEndLocate : string;
  InnerHeight : integer ;

  queryMachine : TADOQuery;
  queryProcess : TADOQuery;
  xlocate, ylocate,yoffset,timeLen : integer;
begin
  queryMachine := TADOQuery.Create(nil);
  queryProcess := TADOQuery.Create(nil);

  try
    queryMachine.Connection := ADOConn;
    queryProcess.Connection := ADOConn;

    queryMachine.SQL.Text := 'select * from tb_edm order by Priority';
    queryMachine.Open ;
    InnerHeight := queryMachine.RecordCount * 4;

    OleApp.worksheets[sheet].range['A'+IntToStr(rowNum)+':'+'A'+IntToStr(rowNum+InnerHeight+OutHeight-1)].Select;
    OleApp.Selection.Merge;
    OleApp.ActiveCell.FormulaR1C1 := 'EDM';
    OleApp.ActiveCell.WrapText := True;
    OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
    OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
    OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
    OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;

    //cut left
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range['B'+IntToStr(rowNum+i*2)+':'+'B'+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //cut center
    for i:=0 to days-1 do begin
      sStartLocate := transRowsNum(1+i*24+MIDLOCATEDAYS);
      sEndLocate := transRowsNum(24+i*24+MIDLOCATEDAYS);
      for j:=0 to (InnerHeight + OutHeight) div 2 - 1 do begin
        if j mod 2 = 0 then begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end else begin
          OleApp.worksheets[sheet].range[sStartLocate+IntToStr(rowNum+j*2)+':'+sEndLocate+IntToStr(rowNum+j*2+1)].Select;
          OleApp.Selection.Interior.ColorIndex := 2;
          OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeRight].Weight := xlHairline;
          if i = days -1 then begin
            OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
            OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
          end;
          OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
          OleApp.Selection.Borders[xlInsideVertical].LineStyle := xlContinuous;
          OleApp.Selection.Borders[xlInsideVertical].Weight := xlHairline;
          if j = (InnerHeight+OutHeight) div 2 - 1 then begin
            OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
            OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
          end;
          if j > InnerHeight div 2 - 1 then begin
            if j = InnerHeight div 2 then begin
              OleApp.Selection.Borders[xlEdgeTop].LineStyle := xlDouble;
              OleApp.Selection.Borders[xlEdgeTop].Weight := xlThick;
            end;
            OleApp.Selection.Interior.ColorIndex := 34;
          end;
        end;
      end;
    end;

    //cut right
    sEndLocate := transRowsNum(24+(days-1)*24+MIDLOCATEDAYS+1);
    queryMachine.First ;
    for i:=0 to (InnerHeight+OutHeight) div 2 - 1 do begin
      OleApp.worksheets[sheet].Range[sEndLocate+IntToStr(rowNum+i*2)+':'+sEndLocate+IntToStr(rowNum+i*2+1)].Select;
      OleApp.Selection.Merge;
      OleApp.Selection.Borders[xlEdgeRight].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeRight].Weight := xlThin;
      OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      OleApp.Selection.Borders[xlEdgeBottom].Weight := xlHairline;
      if i = (InnerHeight+OutHeight) div 2 - 1 then begin
        OleApp.Selection.Borders[xlEdgeBottom].LineStyle := xlDouble;
        OleApp.Selection.Borders[xlEdgeBottom].Weight := xlThick;
      end;
      if i mod 2 = 0 then
        OleApp.Selection.Interior.ColorIndex := 15;
      if (i mod 2 = 0) AND (i > InnerHeight div 2 - 1) then
        OleApp.Selection.Value := '¡¼Ò©';
      if (i mod 2 = 0) AND (i <= InnerHeight div 2 - 1) then begin
        OleApp.Selection.Value := queryMachine.FieldByName('MachineId').AsString;
        queryMachine.Next ;
      end;
    end;

    //fill data from db


    queryMachine.First ;
    for i:=0 to queryMachine.RecordCount - 1 do begin //³Z¡¼æÁ¦O
      //¸h¡¼§¨¡¼Å~¡Èíå
      xlocate := rowNum + i * 4;
      ylocate := MIDLOCATEDAYS + 1 - 24;

      for j:=1 to days do begin //¡¼ÂW¡¼æÁ¦O
        //÷D¡¼§¨¡¼Å~¡Èíå
        ylocate := ylocate + 24;
        yoffset := 0;
        x := 0;
        queryProcess.Active := false ;
        queryProcess.SQL.Text := 'select * from tb_processEdm e LEFT JOIN tb_order o ON e.ModuleId = o.ModuleId '+
                               ' where e.processdate ='''+formatDateTime('yyyy-MM-dd',dt+j-1)+''' AND '+
                               ' e.edmid ='''+queryMachine.fieldbyName('machineid').AsString+''' '+
                               ' order by e.processDate,e.partno ';
        queryProcess.Open ;
        if queryProcess.RecordCount > 0 then begin
          //ÆB³Z¡¼¡¼ÆB¡¼ÂW£V¹G¥Ü¡¼»í
          while not queryProcess.Eof do begin
            timeLen := queryProcess.fieldByName('ProcessMinutes').AsInteger;
            if timeLen mod 60 = 0 then begin
              timeLen := timeLen div 60;
            end else begin
              timeLen := timeLen div 60 + 1;
            end;
            if yoffset >= 23 then break;
            if yoffset + timeLen >= 23 then timeLen := 24 - yoffset;
            //fill data
            OleApp.worksheets[sheet].Cells[xlocate,ylocate+yoffset].Value :=
              queryProcess.FieldByName('moduleid').AsString+','+
              queryProcess.FieldByName('partno_id').AsString+','+
              format('%.1d',[queryProcess.FieldByName('ProcessMinutes').AsInteger]); // format : moduleid, partno_id,lens
            //«Ò¡g¹K
            OleApp.worksheets[sheet].Range[transRowsNum(ylocate+yoffset)+IntToStr(xlocate+2)+':'+
                                           transRowsNum(ylocate+yoffset+timeLen-1)+IntToStr(xlocate+3)].Select;
            OleApp.Selection.Interior.ColorIndex := colors[x mod 2];
            x := x + 1;
            yoffset := yoffset + timeLen;
            queryProcess.Next ;
          end;
        end; // queryProcess.RecordCount > 0
      end; // for j
      queryMachine.Next;
    end; // for i
  finally
    queryMachine.Close ;
    queryProcess.Close ;
    queryMachine.Free ;
    queryProcess.Free ;
  end;

  result := rowNum + InnerHeight + OutHeight;
end;

end.
