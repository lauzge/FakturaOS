
{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

unit VPDbIntf;

interface

uses Classes, DB, SysUtils;

type
  // interface for sql capable datasets
  ISQLDataSet = interface
    ['{5855A2B8-8568-4AA5-86BC-6DDB06833F8E}']
    // see iSQL
    procedure SetiSQL(const Value: string);
    // see iSQL
    function GetiSQL: string;
    // see iConnectionParams
    procedure SetiConnectionParams(const Value: string);
    // see iConnectionParams
    function GetiConnectionParams: string;
    // interface to the ExecSQL method
    procedure IExecSQL;
    // interface for setting the SQL statement
    property iSQL: string read GetiSQL write SetiSQL;
    // interface for optional connection parameters for the dataset
    property iConnectionParams: string read GetiConnectionParams write SetiConnectionParams;
  end;

  // interface for datasets capable of creating "tables"
  ICreateTableDataSet = interface
    ['{83FC58AD-C245-4F03-A2B8-D1B737BC1955}']
    // should create the given table
    procedure iCreateTable(const aTableName: string; const aFieldDefs: TFieldDefs; const aIndexDefs: TIndexDefs);
  end;

  // internal storage type
  TCreateInstance = function(InterfaceClass: string): TObject;

  // factory for creating classes that implement ISQLDataset
  TDBFactory = class(TObject)
  protected
    // list of registered creation methods; a method must be of type TCreateInstance
    fStringlist: TStringList;
  public
    // constructor
    constructor Create; virtual;
    // destructor
    destructor Destroy; override;
    // registers a class that implements ISQLDataSet. aproc is a function,
    // that creates an instance of a TDataset descendant with ISQLDataSet
    // implementation and returns it.
    procedure RegisterInterfaceType(InterfaceClass: string; aProc: TCreateinstance);
    // calls the appropriate creation method and returns the dataset; nil if the
    // classtype is not known.
    function CreateInstance(InterfaceClass: string): TObject;
  end;

// the single instance of TSQLDatasetFactory for each application
// use it to register and create datasets
function sSQLDatasetFactory: TDBFactory;

implementation

{ TSQLDatasetFactory }

constructor TDBFactory.Create;
begin
  inherited;
  fStringlist := TStringList.Create;
end;

function TDBFactory.CreateInstance(InterfaceClass: string): TObject;
var
  anindex: integer;
begin
  Result := nil;
  anindex := fStringlist.IndexOf(InterfaceClass);
  if anindex > -1 then
    Result := TCreateinstance(fStringlist.Objects[anIndex])(InterfaceClass)
  else
    assert(False, 'DB type "' + InterfaceClass + '" not registered with factory.');
end;

destructor TDBFactory.Destroy;
begin
  fStringlist.Free;
  inherited;
end;

procedure TDBFactory.RegisterInterfaceType(InterfaceClass: string; aProc: TCreateinstance);
begin
  fStringlist.AddObject(InterfaceClass, TObject(@aProc));
end;

var
  fSQLDatasetFactory: TDBFactory;

function sSQLDatasetFactory: TDBFactory;
begin
  if fSQLDatasetFactory = nil then
    fSQLDatasetFactory := TDBFactory.Create;
  Result := fSQLDatasetFactory;
end;

//==============================

initialization
  fSQLDatasetFactory := nil;
end.


