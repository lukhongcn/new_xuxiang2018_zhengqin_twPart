unit unLib;
interface
uses
  Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

  procedure Split(s : string;Separator : char;var Terms : TStringList;IgnoreNullCase : Boolean);
  function LeaveTimeLength(lStartTime,lEndTime,nStartTime,nEndTime:TDateTime) : Integer;
  function DecrementDateTime(EndTime,StartTime : TDateTime) : Integer;
  function FixData(s : String) : String;
implementation

procedure Split(s : string;Separator : char;var Terms : TStringList;IgnoreNullCase : Boolean);
{ This browses a string and divide it into terms whenever the given
  separator is found. The separators will be removed }
  var
  hs : string;
  p : integer;

begin
  Terms.Clear; // First remove all remaining terms
  if Length(s)=0 then   // Nothin' to separate
    Exit;
  p:=Pos(Separator,s);
  while P<>0 do
  begin
    hs:=Copy(s,1,p-1);   // Copy term
    if IgnoreNullCase then
    begin
      if hs <> '' then
        Terms.Add(hs);
    end else
      Terms.Add(hs);       // Add to list
    Delete(s,1,p);       // Remove term and separator
    p:=Pos(Separator,s); // Search next separator
  end;
  if Length(s)>0 then
    Terms.Add(s);        // Add remaining term
end;

function LeaveTimeLength(lStartTime,lEndTime,nStartTime,nEndTime:TDateTime) : Integer;
var
  wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs : Word;
  ilStartTime,ilEndTime,inStartTime,inEndTime : integer;
  ret : Integer;
begin
  DeCodeDateTime(lStartTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  ilStartTime := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  DeCodeDateTime(lEndTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  ilEndTime   := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  DeCodeDateTime(nStartTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  inStartTime := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  DeCodeDateTime(nEndTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  inEndTime   := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  if (ilStartTime <= inStartTime) and (ilEndTime >= inEndTime) then begin
    ret := 480;
  end else begin
    if ilStartTime <= ilEndTime then begin
      ret := ilEndTime - inStartTime;
    end else begin
      if ilEndTime < inEndTime then begin
        ret := ilEndTime - ilStartTime;
      end else begin
        ret := inEndTime - ilStartTime;
      end;
    end;
  end;

  if ret > 480 then ret := 480;
  
  result := ret;
end;

// DateTime decrement, return minute.
function DecrementDateTime(EndTime,StartTime : TDateTime) : Integer;
var
  wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs : Word;
  iStartTime,iEndTime : integer;
begin
  DeCodeDateTime(StartTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  iStartTime := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  DeCodeDateTime(EndTime, wYear,wMonth,wDay,wHours,wMins,wSecs,wSSecs);
  iEndTime   := (wYear * 365 + wMonth * 30 + wDay) * 24 * 60 + wHours * 60 + wMins;

  result := iEndTime - iStartTime;
end;

function FixData(s : String) : String;
begin
  result := StringReplace(s,'#', 'u', [rfIgnoreCase]);
end;

end.
