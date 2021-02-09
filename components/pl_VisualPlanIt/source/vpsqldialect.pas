{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{This unit was provided by Hannes Danzl and is used here with permission       }

// implements a base class for abstracting different SQL dialects<br>
// currently only some basic commands are supported, could be extended in
// future
unit VPSQLDialect;

interface

uses
  db, VPDbIntf, classes, sysutils;

type
  // the base class for all sql dialects
  TVPBaseSQLDialect = class(TComponent)
  protected
    // see Dataset
    fDataset: TDataset;
    // see DBEngine
    fDBEngine: String;
    // see ConnectionParams
    fConnectionParams: TStrings;
    // see SQL
    fSQL: String;
    // see TableName
    fTableName: String;
    // see Session
    fSession: TComponent;
    // see ConnectionParams
    procedure SetConnectionParams(const Value: TStrings);
    // see Session
    procedure SetSession(const Value: TComponent);
    // see SQL
    procedure SetSQL(const Value: String);
    // see DBEngine
    procedure SetDBEngine(const Value: String); virtual;

    // creates the an interface dataset according to the given DBEngine class
    // see swhDatabaseIntf.pas for more info
    function CreateSQLDataSet(DBEngine: String): TDataset; virtual;

    // should return the SQL string for definition of the given field
    // e.g. "Field1 Number" for oracle<br>
    // <flag>override
    function SQLGetColumnDef(const aFieldDef: TFieldDef): String; virtual; abstract;
    // should return the syntax for the create command<br>
    // default is:   create table %TableName% (%Fields%)<br>
    // %tablename% will be substituted by according name, %Fields% is a commadelimited
    // list of fielddefinitions created by calls to SQLGetColumnDef
    // <flag>override
    function GetCreateSyntax: String; virtual;
    // should return the syntax for the select command<br>
    // default is:   select * from %tablename%<br>
    // %tablename% will be substituted by according name;
    // the result set should be read/write so in oracle e.g. use
    // select %tableName%.rowid, %tablename%.* from %tablename%
    // <flag>override
    function GetSelectSyntax: String; virtual;
    // should return the syntax for the select command<br>
    // default is: delete from %tablename%<br>
    // <flag>override
    function GetDeleteSyntax: String; virtual;
    // should return the syntax for checking that a database exists
    // returns blank here because it is very engine dependant
    // <flag override>
    function GetEnsureDatabaseExistsSyntax: String; virtual;
  public
    // calls Dataset.Open
    procedure Open; virtual;
    // calls Dataset.iExecSQL
    procedure ExecSQL; virtual;
    // calls Dataset.Close
    procedure Close; virtual;
    // calls GetCreateSyntax and then passes the result to SQL and calls ExecSQL
    procedure CreateTable(const aTableName: String; const aFieldDefs: TFieldDefs; const aIndexDefs: TIndexDefs); virtual;
    // there is no standard syntax/method for checking.
    // requires that the ConnectionParams property has the required params set.
    procedure EnsureDatabaseExists; virtual; abstract;

    // constructor
    constructor Create(aOwner: TComponent); override;
    // destructor
    destructor Destroy; override;

    // should return the syntax for the select command<br>
    // default is:   select * from %tablename%<br>
    // %tablename% will be substituted by according name;
    // the result set should be read/write so in oracle e.g. use
    // select %tableName%.rowid, %tablename%.* from %tablename%
    property SelectSQL: string read GetSelectSyntax;
    // should return the syntax for the select command<br>
    // default is: delete from %tablename%<br>
    property DeleteSQL: string read GetDeleteSyntax;
    // the name of the (main)table we are querying
    property TableName: String read fTableName write fTableName;
    // the dataset that is used
    property Dataset: TDataset read fDataset;
    // the database engine to use
    property DBEngine: String read fDBEngine write SetDBEngine;
    // the sql statement
    property SQL: String read fSQL write SetSQL;
    // optional connection parameters for the dataset; alternatively use the session
    // proprty to pass in an external session
    property ConnectionParams: TStrings read fConnectionParams write SetConnectionParams;
    // passed through to the Dataset.ISession before it is opened; can be everything
    // and it's the responsibility of the dataset implementation to check it
    property Session: TComponent read fSession write SetSession;
  end;

// factory that can register and create instances of registered TVPBaseSQLDialect
function sSQLDialectFactory: TDBFactory;

implementation

{ TVPBaseSQLDialect }

procedure TVPBaseSQLDialect.Close;
begin
  fDataset.Close;
end;


constructor TVPBaseSQLDialect.Create(aOwner: TComponent);
begin
  inherited;
  fConnectionParams:=TStringList.Create;
end;


function TVPBaseSQLDialect.CreateSQLDataSet(DBEngine: String): TDataset;
begin
  result:=TDataset(sSQLDatasetFactory.CreateInstance(DBEngine));
end;


procedure TVPBaseSQLDialect.CreateTable(const aTableName: String;
  const aFieldDefs: TFieldDefs; const aIndexDefs: TIndexDefs);
var
  j: Integer;
  Fields: String;
  lSQL: String;
  IDS: ISQLDataSet;
begin
  for j := 0 to aFieldDefs.Count-1 do    // Iterate
    Fields:=Fields+SQLGetColumnDef(aFieldDefs[j])+', ';

  lSQL:=GetCreateSyntax;
  lSQL:=StringReplace(SQL, '%TableName%', aTableName, [rfIgnoreCase]);
  lSQL:=StringReplace(SQL, '%Fields%', copy(Fields,1,length(Fields)-2), [rfIgnoreCase]);
  fDataset.GetInterface(ISQLDataSet, ids);
  try
    ids.iSQL:=lSQL;
    ids.IExecSQL;
  finally
    ids:=nil;
  end;
end;


destructor TVPBaseSQLDialect.Destroy;
begin
  fConnectionParams.free;
  fDataset.Free; 
  inherited;
end;


procedure TVPBaseSQLDialect.ExecSQL;
var
  iDS: ISQLDataSet;
begin
  fDataset.GetInterface(ISQLDataSet, iDS);
  try
    iDS.iExecSQL;
  finally
    iDS:=nil;
  end;
end;


function TVPBaseSQLDialect.GetCreateSyntax: String;
begin
  result:='create table %TableName% (%Fields%)';
end;


function TVPBaseSQLDialect.GetDeleteSyntax: String;
begin
  result:='delete from %tablename%';
end;


function TVPBaseSQLDialect.GetSelectSyntax: String;
begin
  result:='select * from %tablename%';
end;


procedure TVPBaseSQLDialect.Open;
begin
  fDataset.Open;
end;


procedure TVPBaseSQLDialect.SetDBEngine(const Value: String);
begin
  fDBEngine := Value;
  if fDataset<>nil then
    FreeAndNil(fDataset);
  fDataset:=CreateSQLDataSet(fDBEngine);
end;


var
  fSQLDialectFactory: TDBFactory;

function sSQLDialectFactory: TDBFactory;
begin
  if fSQLDialectFactory=nil then
    fSQLDialectFactory:=TDBFactory.Create;
  result:=fSQLDialectFactory;
end;


procedure TVPBaseSQLDialect.SetConnectionParams(const Value: TStrings);
var
  iDS: ISQLDataset;
begin
  Close;
  fConnectionParams.Assign(Value);
  Dataset.GetInterface(ISQLDataset, iDS);
  try
    iDS.iConnectionParams:=value.Text;
  finally
    ids:=nil;
  end;
end;


procedure TVPBaseSQLDialect.SetSession(const Value: TComponent);
begin
  Close;
  fSession := Value;
end;


procedure TVPBaseSQLDialect.SetSQL(const Value: String);
var
  iDS: ISQLDataSet;
begin
  fSQL := Value;
  fDataset.Close;
  fDataset.GetInterface(ISQLDataSet, iDS);
  try
    iDS.iSQL:=fSQL;
  finally
    iDS:=nil;
  end;
end;


function TVPBaseSQLDialect.GetEnsureDatabaseExistsSyntax: String;
begin
  Result := '';
end;


initialization
  fSQLDialectFactory:=nil;

end.

