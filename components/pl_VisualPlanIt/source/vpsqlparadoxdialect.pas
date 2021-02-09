{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

// a sql dialect class for paradox
unit VPSQLParadoxDialect;

interface

uses
  VPSQLDialect, VPDbIntf, DBTables, DB, SysUtils;

type
  // a sql dialect class for paradox
  TVPParadoxSQLDialect = class(TBaseSQLDialect)
  protected
    // override to use 'create table "%TableName%" (%Fields%)' since paradox
    // can have the fileextension in the tablename
    function GetCreateSyntax: string; override;
    // return the right strings
    function SQLGetColumnDef(const aFieldDef: TFieldDef): string; override;
    // override to avoid abstract error
    procedure EnsureDatabaseExists; virtual;
  end;

implementation

procedure TVPParadoxSQLDialect.EnsureDatabaseExists;
begin
  // do nothing
end;

function TVPParadoxSQLDialect.GetCreateSyntax: string;
begin
  Result := 'create table "%TableName%" (%Fields%)';
end;

function TVPParadoxSQLDialect.SQLGetColumnDef(const aFieldDef: TFieldDef): string;
var
  aTypeName: string;
begin
  case aFieldDef.DataType of
    ftInteger: aTypeName := 'INTEGER';
    ftFloat: aTypeName := 'NUMERIC';
    ftString:
      if aFieldDef.Size < 256 then
        aTypeName := 'VARCHAR(' + IntToStr(aFieldDef.Size) + ')'
      else
        aTypeName := 'BLOB(1,1)';
    ftBoolean: aTypeName := 'BOOLEAN';
    ftDate: aTypeName := 'DATE';
    ftTime: aTypeName := 'TIME';
    ftDateTime: aTypeName := 'TIMESTAMP';
  end;    // case
  Result := aFieldDef.Name + ' ' + aTypeName;
end;

function CreateParadoxDialect(InterfaceClass: string): TObject;
begin
  Result := TVPParadoxSQLDialect.Create(nil);

end;

initialization
  // IMPORTANT: register it
  sSQLDialectFactory.RegisterInterfaceType('Paradox', @CreateParadoxDialect);
end.
