unit YBSynchronize;

interface

uses
  ADODB, SysUtils, forms, dateUtils, classes;

type
  TSynchronize = class(TObject)
    private
      MySqlConnectionString : String;
      MsSqlConnectionString : String;
      procedure transferUserInfor(QueryConn, ExecConn: TADOQuery; IsDelete: Boolean; UserID,uName,CardNo,Password,DeptID,DelUserIDList:string);
      procedure transferDepartmentInfor(QueryConn, ExecConn: TADOQuery; IsDelete: Boolean; DepartID,departName,DelList:string);
    public
      procedure setMySqlConnectionString(AMySqlConnectionString : String);
      procedure setMsSqlConnectionString(AMsSqlConnectionString : String);
      procedure synchronizeOrderTable;
      procedure synchronizeUserTable;
      procedure statistics_BigSchedule;
      procedure synchronizeDepartTable;
  end;

implementation

uses YBMain, unLib, DB;

{ TSynchronize }

procedure TSynchronize.setMsSqlConnectionString(
  AMsSqlConnectionString: String);
begin
  MsSqlConnectionString := AMsSqlConnectionString;
end;

procedure TSynchronize.setMySqlConnectionString(
  AMySqlConnectionString: String);
begin
  MySqlConnectionString := AMySqlConnectionString;
end;

procedure TSynchronize.transferDepartmentInfor(QueryConn, ExecConn: TADOQuery;
  IsDelete: Boolean; DepartID,departName,DelList:string);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if not IsDelete then
  begin
    //insert or update record
    if QueryConn.Active = true then QueryConn.Active := false;
    QueryConn.SQL.Text := 'select * from tb_department where departmentid='''+DepartID+'''';
    QueryConn.Open ;

    if QueryConn.Eof then
      strsql := 'insert into tb_department (departmentid,departmentname) values (' +
                ''''+DepartID+''','+
                ''''+departName+''')'
    else
      strsql := 'update tb_department set '+
                'departmentname='''+departName+''''+
                'where departmentid='''+DepartID+'''';
  end else
    //delete record
    strsql := 'delete from tb_department where departmentid not in ('+DelList+')';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

procedure TSynchronize.statistics_BigSchedule;
var
  min, max, i : integer;
  ModuleId : String;
  ModuleStatus : integer;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update order information to Mssql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MySqlConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM MOUDLE ';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := msSqlConnectionString;

    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GOrder.MinValue := 0;
        GOrder.MaxValue := max;
        GOrder.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            ModuleId := FixData(FieldByName('moudle').AsString);
            ModuleStatus := FieldByName('isover').AsInteger;
            ADOQueryExec.SQL.Text := 'update tb_order set isover='+IntToStr(ModuleStatus)+' where moduleid='''+ModuleId+'''';
            ADOQueryExec.ExecSQL;
            GOrder.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GOrder.Progress := 0;
      end;
    except
      displayInfo('Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
  end;
end;

procedure TSynchronize.synchronizeDepartTable;
var
  min, max, i : integer;
  AID,AName,DelList : string;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update department information to Mssql...');
    application.ProcessMessages ;

    if tbl_myuser.Active then tbl_myuser.Active := false;
    tbl_myuser.TableName := 'department';
    tbl_myuser.Open;

    if qry_msselect.Active then qry_msselect.Active := false;
    if qry_msexec.Active then qry_msexec.Active := false;

    DelList := '';
    try
      with tbl_myuser do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        Gauge.MinValue := 0;
        Gauge.MaxValue := max;
        Gauge.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            AID := FieldByName('departmentid').AsString;
            AName := FieldByName('tchinese_name').AsString;
            transferDepartmentInfor(qry_msselect,qry_msexec,false,AID,AName,DelList);
            DelList := DelList +''''+ Trim(FieldByName('departmentid').AsString) + ''',';
            Gauge.AddProgress(1);
            displayInfo('import data DEPARTMENT ['+AName+'] count ['+inttostr(i)+']');
            Application.ProcessMessages ;
            Next;
          end;

          //delete extral shift records
          if DelList <> '' then
          begin
            //DelList := DelList + '''''';
            //transferDepartmentInfor(qry_msselect,qry_msexec,true,AID,AName,DelList);
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        Gauge.Progress := 0;
      end;
    except
      displayInfo('DEPARTMENT Import data failed.');
    end;
    qry_msselect.Active := false;
    qry_msexec.Active := false;
  end;
end;

procedure TSynchronize.synchronizeOrderTable;
var
  min, max, i : integer;
  ModuleId : String;
  ModuleStatus : integer;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update order information to Mssql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MySqlConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM MOUDLE ';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := msSqlConnectionString;

    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GOrder.MinValue := 0;
        GOrder.MaxValue := max;
        GOrder.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            ModuleId := FixData(FieldByName('moudle').AsString);
            ModuleStatus := FieldByName('isover').AsInteger;
            ADOQueryExec.SQL.Text := 'update tb_order set isover='+IntToStr(ModuleStatus)+' where moduleid='''+ModuleId+'''';
            ADOQueryExec.ExecSQL;
            GOrder.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GOrder.Progress := 0;
      end;
    except
      displayInfo('Order Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
  end;
end;

procedure TSynchronize.synchronizeUserTable;
var
  min, max, i : integer;
  UserID,uName,CardNo,uPassword,DeptID,DelUserIDList : string;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update user information to Mysql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MySqlConnectionString;

    ADOQuerySelect.SQL.Text := 'SELECT username,tchinese_name,card_id,password as pw FROM user ';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := msSqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := msSqlConnectionString;

    DelUserIDList := '';
    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GUser.MinValue := 0;
        GUser.MaxValue := max;
        GUser.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            UserID := FieldByName('username').AsString;
            uName := FieldByName('tchinese_name').AsString;
            CardNo := FieldByName('card_id').AsString;
            //uPassword := FieldByName('pw').AsString;
            uPassword := '123456';
            transferUserInfor(ADOQueryInner,ADOQueryExec,false,UserID,uName,CardNo,uPassword,DeptID,DelUserIDList);
            DelUserIDList := DelUserIDList +''''+ Trim(FieldByName('username').AsString) + ''',';
            GUser.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;

          //delete extral shift records
          if DelUserIDList <> '' then
          begin
            DelUserIDList := DelUserIDList + '''admin''';
            transferUserInfor(ADOQueryInner,ADOQueryExec,true,UserID,uName,CardNo,uPassword,DeptID,DelUserIDList);
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GUser.Progress := 0;
      end;
    except
      displayInfo('User Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
  end;
end;

procedure TSynchronize.transferUserInfor(QueryConn, ExecConn: TADOQuery;
  IsDelete: Boolean; UserID,uName,CardNo,Password,DeptID,DelUserIDList:string);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if not IsDelete then
  begin
    //insert or update record
    if QueryConn.Active = true then QueryConn.Active := false;
    QueryConn.SQL.Text := 'select * from tb_user where username='''+UserID+'''';
    QueryConn.Open ;

    if QueryConn.Eof then
      strsql := 'insert into tb_user (username,name,cardid,password,departmentid) values (' +
                ''''+UserID+''','+
                ''''+uName+''','+
                ''''+CardNO+''','+
                ''+Password+','+
                ''+DeptID+')'
    else
      strsql := 'update tb_user set '+
                'name='''+uName+''','+
                'cardid='''+CardNO+''' '+
                'where username='''+UserID+'''';
  end else
    //delete record
    strsql := 'delete from tb_user where username not in ('+DelUserIDList+')';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

end.
