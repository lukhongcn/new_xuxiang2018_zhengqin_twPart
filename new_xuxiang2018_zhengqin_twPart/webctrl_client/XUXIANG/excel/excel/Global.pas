unit Global;

interface
const
  LOCATEDAYS = 2;
  MIDLOCATEDAYS = 2;
  CONNECTSTRING = 'Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;'+
                  'User ID=sa;Initial Catalog=ModuleWorkFlow;Data Source=localhost';
var
  DBPath: string = 'Localhost';
  ExcelPath : string = 'C:\Inetpub\wwwroot\ModuleWorkFlow\excel\';

implementation

end.
