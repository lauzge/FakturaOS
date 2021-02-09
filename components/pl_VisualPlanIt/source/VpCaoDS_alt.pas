{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I vp.inc}

unit VpCaoDS_alt;

interface

uses
  SysUtils, Classes, DB,
  VpBaseDS, VpDBDS, LResources,
  ZCompatibility, ZConnection, ZDataset;

type
  TVpCaoDatastore = class(TVpCustomDBDatastore)
  private
    FConnection: TZConnection;
    FContactsTable: TZTable;
    FEventsTable: TZTable;
    FResourceTable: TZTable;
    FTasksTable: TZTable;
    procedure SetConnection(const AValue: TZConnection);

  protected
    //-------------
    FEventsTableName   : String;
    FContactsTableName : String;
    FTasksTableName    : String;
    procedure CreateTable(const ATableName: String; CreateIndex: Boolean = true);
    procedure CreateAllTables;
    function GetContactsTable: TDataset; override;
    function GetEventsTable: TDataset; override;
    function GetResourceTable: TDataset; override;
    function GetTasksTable: TDataset; override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetConnected(const AValue: Boolean); override;

  protected
    // Fix old tables
    procedure AddField(ATableName, AFieldName: String; AFieldType: TFieldType;
      ASize: Integer=0);
    procedure RenameFields(ATableName: String; AFields: TStrings);
    procedure FixContactsTable;

  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateTables;
    function GetNextID(TableName: string): integer; override;

    property ResourceTable;
    property EventsTable;
    property ContactsTable;
    property TasksTable;

  published
    property Connection: TZConnection read FConnection write SetConnection;

    // inherited
    property AutoConnect default false;
    property AutoCreate default false;
    property Daybuffer;
    property EventsTabName   : String read FEventsTableName   write FEventsTableName;
    property ContactsTabName : String read FContactsTableName write FContactsTableName;
    property TasksTabName    : String read FTasksTableName    write FTasksTableName;
  end;

procedure Register;

implementation

uses
  LazFileUtils, ZAbstractDataset,
  VpConst;

{ TVpZeosDatastore }

constructor TVpCaoDatastore.Create(AOwner: TComponent);
begin
  inherited;

  FContactsTable := TZTable.Create(self);
  FContactsTable.TableName := ContactsTableName; // 'Contacts';  volker
  FContactsTable.UpdateMode := umUpdateAll;

  FEventsTable := TZTable.Create(Self);
  FEventsTable.TableName :=EventsTableName; // 'Events'; volker
  FEventsTable.UpdateMode := umUpdateAll;

  FResourceTable := TZTable.Create(self);
  FResourceTable.TableName := ResourceTableName; // 'Resources';  volker
  FResourceTable.UpdateMode := umUpdateAll;

  FTasksTable := TZTable.Create(self);
  FTasksTable.TableName := TasksTableName; // 'Tasks';  volker
  FTasksTable.UpdateMode := umUpdateAll;
end;

procedure TVpCaoDatastore.AddField(ATableName, AFieldName: String;
  AFieldType: TFieldType; ASize: Integer=0);
var
  ft: String;
  sql: String;
begin
  if AFieldType = ftInteger then
    ft := 'INTEGER' else
  if (AFieldType = ftString) then
    ft := 'VARCHAR(' + intToStr(ASize) + ')'
  else
    raise Exception.Create('Field type not supported here.');
  sql := Format('ALTER TABLE %s ADD COLUMN %s %s;', [ATablename, AFieldName, ft]);
  FConnection.ExecuteDirect(sql);
end;

procedure TVpCaoDatastore.CreateAllTables;
begin
  if not FContactsTable.Exists then CreateTable(ContactsTableName);
  if not FEventsTable.Exists then CreateTable(EventsTableName);
  if not FResourceTable.Exists then CreateTable(ResourceTableName);
  if not FTasksTable.Exists then CreateTable(TasksTableName);
end;

procedure TVpCaoDatastore.CreateTable(const ATableName: String;
  CreateIndex: Boolean = true);
begin
  if ATableName = ContactsTableName then begin
    FConnection.ExecuteDirect(
      'CREATE TABLE Contacts ('+
        'RECORDID int(11) NOT NULL default '+'0'+', '+
        'RESOURCEID int(11) NOT NULL default '+'0'+', ' +
        'FIRSTNAME char(50) default NULL, '+
        'LASTNAME char(50) NOT NULL default '', '+
        'BIRTHDATE date default NULL, '+
        'ANNIVERSARY date default NULL, '+
        'TITLE char(50) default NULL, '+
        'COMPANY char(50) NOT NULL default '', '+
        'JOB_POSITION char(30) default NULL, '+
        'ADDRESS char(100) default NULL, '+
        'CITY char(50) default NULL, '+
        'STATE char(25) default NULL, '+
        'ZIP char(10) default NULL, '+
        'COUNTRY char(25) default NULL, '+
        'NOTE char(255) default NULL, '+
        'PHONE1 char(25) default NULL, '+
        'PHONE2 char(25) default NULL, '+
        'PHONE3 char(25) default NULL, '+
        'PHONE4 char(25) default NULL, '+
        'PHONE5 char(25) default NULL, '+
        'PHONETYPE1 int(11) default NULL, '+
        'PHONETYPE2 int(11) default NULL, '+
        'PHONETYPE3 int(11) default NULL, '+
        'PHONETYPE4 int(11) default NULL, '+
        'PHONETYPE5 int(11) default NULL, '+
        'CATEGORY int(11) default NULL, '+
        'EMAIL char(100) default NULL, '+
        'CUSTOM1 char(100) default NULL, '+
        'CUSTOM2 char(100) default NULL, '+
        'CUSTOM3 char(100) default NULL, '+
        'CUSTOM4 char(100) default NULL, '+
        'USERFIELD0 char(100) default NULL, '+
        'USERFIELD1 char(100) default NULL, '+
        'USERFIELD2 char(100) default NULL, '+
        'USERFIELD3 char(100) default NULL, '+
        'USERFIELD4 char(100) default NULL, '+
        'USERFIELD5 char(100) default NULL, '+
        'USERFIELD6 char(100) default NULL, '+
        'USERFIELD7 char(100) default NULL, '+
        'USERFIELD8 char(100) default NULL, '+
        'USERFIELD9 char(100) default NULL, '+
        'PRIMARY KEY (RECORDID), '+
        'KEY ResID_ndx(RESOURCEID), '+
        'KEY LName_ndx(LASTNAME), '+
        'KEY Company_ndx(COMPANY) )'
    );
    if CreateIndex then begin
      FConnection.ExecuteDirect(
        'CREATE INDEX ResID_ndx ON Contacts(RESOURCEID)'
      );
      FConnection.ExecuteDirect(
        'CREATE INDEX LName_ndx ON Contacts(LASTNAME)'
      );
      FConnection.ExecuteDirect(
        'CREATE INDEX Company_ndx ON Contacts(COMPANY)'
      );
    end;
  end else
  if ATableName = EventsTableName then begin
    FConnection.ExecuteDirect(
      'CREATE TABLE Events ('+
        'RECORDID int(11) NOT NULL default '+'0'+', '+
        'STARTTIME  DATETIME NOT NULL, '+
        'ENDTIME  DATETIME NOT NULL, '+
        'RESOURCEID int(11) NOT NULL default '+'0'+', '+
        'DESCRIPTION char(255) default NULL, '+
        'NOTES char(255) default NULL, '+
        'CATEGORY int(11) default NULL, ' +
        'ALLDAYEVENT enum('+'N'+','+'Y'+') NOT NULL default '+'N'+', '+
        'DINGPATH char(255) default NULL, '+
        'ALARMSET enum('+'N'+','+'Y'+') NOT NULL default '+'N'+', '+
        'ALARMADVANCE int(11) default NULL, '+
        'ALARMADVANCETYPE int(11) default NULL, '+
        'SNOOZETIME  DATETIME, '+
        'REPEATCODE int(11) default NULL, '+
        'REPEATRANGEEND  DATETIME, '+
        'CUSTOMINTERVAL int(11) default NULL, '+
        'USERFIELD0 char(100) default NULL, '+
        'USERFIELD1 char(100) default NULL, '+
        'USERFIELD2 char(100) default NULL, '+
        'USERFIELD3 char(100) default NULL, '+
        'USERFIELD4 char(100) default NULL, '+
        'USERFIELD5 char(100) default NULL, '+
        'USERFIELD6 char(100) default NULL, '+
        'USERFIELD7 char(100) default NULL, '+
        'USERFIELD8 char(100) default NULL, '+
        'USERFIELD9 char(100) default NULL, '+
        'PRIMARY KEY (RECORDID)) )'
    );
    if CreateIndex then begin
      FConnection.ExecuteDirect(
        'CREATE INDEX rid_st_ndx ON Events(RESOURCEID,STARTTIME)'
      );
      if CreateIndex then begin
        FConnection.ExecuteDirect(
          'CREATE INDEX st_ndx ON Events(STARTTIME)'
        );
      FConnection.ExecuteDirect(
        'CREATE INDEX et_ndx ON Events(ENDTIME)'
      );
      FConnection.ExecuteDirect(
        'CREATE INDEX ResID_ndx ON Events(RESOURCEID)'
      );
    end;
  end else
  if ATableName = ResourceTableName then begin
    FConnection.ExecuteDirect(
      'CREATE TABLE Resources ( '+
         'RESOURCEID int(11) NOT NULL default '+'0'+', '+
         'DESCRIPTION char(255) NOT NULL default '', '+
         'NOTES char(255) default NULL, '+
         'IMAGEINDEX int(11) default NULL, '+
         'RESOURCEACTIVE enum('+'N'+','+'Y'+') NOT NULL default '+'N'+', '+
         'USERFIELD0 char(100) default NULL, '+
         'USERFIELD1 char(100) default NULL, '+
         'USERFIELD2 char(100) default NULL, '+
         'USERFIELD3 char(100) default NULL, '+
         'USERFIELD4 char(100) default NULL, '+
         'USERFIELD5 char(100) default NULL, '+
         'USERFIELD6 char(100) default NULL, '+
         'USERFIELD7 char(100) default NULL, '+
         'USERFIELD8 char(100) default NULL, '+
         'USERFIELD9 char(100) default NULL, '+
         'PRIMARY KEY (RESOURCEID), '+
         'KEY ResID_ndx(RESOURCEID), '+
         'KEY Descr_ndx(DESCRIPTION) )'
    );
  end else
  if ATableName = TasksTableName then begin
    FConnection.ExecuteDirect(
      'CREATE TABLE Tasks ( '+
        'RECORDID int(11) NOT NULL default '+'0'+', '+
        'RESOURCEID int(11) NOT NULL default '+'0'+', '+
        'COMPLETE enum('+'N'+','+'Y'+') default '+'N'+', '+
        'DESCRIPTION char(255) default NULL, '+
        'DETAILS char(255) default NULL, '+
        'CREATEDON  DATETIME NOT NULL, '+
        'PRIORITY int(11) default NULL, '+
        'CATEGORY int(11) default NULL, '+
        'COMPLETEDON  DATETIME, '+
        'DUEDATE  DATETIME, '+
        'USERFIELD0 char(100) default NULL, '+
        'USERFIELD1 char(100) default NULL, '+
        'USERFIELD2 char(100) default NULL, '+
        'USERFIELD3 char(100) default NULL, '+
        'USERFIELD4 char(100) default NULL, '+
        'USERFIELD5 char(100) default NULL, '+
        'USERFIELD6 char(100) default NULL, '+
        'USERFIELD7 char(100) default NULL, '+
        'USERFIELD8 char(100) default NULL, '+
        'USERFIELD9 char(100) default NULL, '+
        'PRIMARY KEY (RECORDID) )'
    );
    if CreateIndex then begin
      FConnection.ExecuteDirect(
        'CREATE INDEX ResID_ndx ON Tasks(RESOURCEID)'
      );
      FConnection.ExecuteDirect(
        'CREATE INDEX DueDate ON Tasks(DUEDATE)'
      );
      FConnection.ExecuteDirect(
        'CREATE INDEX CompletedOn ON Tasks(COMPLETEDON)'
      );
    end;
   end;
  end;
end;

procedure TVpCaoDatastore.CreateTables;
var
  wasConnected: Boolean;
begin
  wasConnected := FConnection.Connected;
  FConnection.Connected := true;
  CreateAllTables;
  SetConnected(wasConnected or AutoConnect);
end;

procedure TVpCaoDatastore.FixContactsTable;
var
  list: TStrings;
  autocommit: Boolean;
  fieldnames: TStrings;
begin
  autocommit := FConnection.AutoCommit;
  ContactsTable.Close;
  list := TStringList.Create;
  try
    FConnection.GetColumnNames(ContactsTableName, '', list);
    FConnection.AutoCommit := false;
    try
      // Fields renamed in 1.05
      fieldnames := TStringList.Create;
      try
        if list.IndexOf('Address') > -1 then fieldnames.Add('Address|Address1');
        if list.IndexOf('City') > -1 then fieldnames.Add('City|City1');
        if list.IndexOf('State') > -1 then fieldnames.Add('State|State1');
        if list.IndexOf('Zip') > -1 then fieldnames.Add('Zip|Zip1');
        if list.IndexOf('Country') > -1 then fieldnames.Add('Country|Country1');
        if list.IndexOf('EMail') > -1 then fieldnames.Add('EMail|EMail1');
        if fieldnames.Count > 0 then begin
          RenameFields(ContactsTableName, fieldnames);
          exit;   // This automatically creates the new fields
        end;
      finally
        fieldnames.Free;
      end;

      // Fields added in 1.05
      if list.IndexOf('Department') = -1 then
        AddField(ContactsTableName, 'Department', ftString, 50);
      if list.IndexOf('AddressType1') = -1 then
        AddField(ContactsTableName, 'AddressType1', ftInteger);
      if list.IndexOf('AddressType2') = -1 then
        AddField(ContactsTableName, 'AddressType2', ftInteger);
      if list.IndexOf('Address2') = -1 then
        AddField(ContactsTableName, 'Address2', ftString, 100);
      if list.IndexOf('City2') = -1 then
        AddField(ContactsTableName, 'City2', ftString, 50);
      if list.IndexOf('State2') = -1 then
        AddField(ContactsTableName, 'State2', ftString, 25);
      if list.IndexOf('Zip2') = -1 then
        AddField(ContactsTableName, 'Zip2', ftString, 10);
      if list.IndexOf('country2') = -1 then
        AddField(ContactsTableName, 'Country2', ftString, 25);
      if list.IndexOf('EMail2') = -1 then
        AddField(ContactsTableName, 'EMail2', ftString, 100);
      if list.IndexOf('EMail3') = -1 then
        AddField(ContactsTableName, 'EMail3', ftString, 100);
      if list.IndexOf('EMailType1') = -1 then
        AddField(ContactsTableName, 'EMailType1', ftInteger);
      if list.IndexOf('EMailType2') = -1 then
        AddField(ContactsTableName, 'EMailType2', ftInteger);
      if list.IndexOf('EMailType3') = -1 then
        AddField(ContactsTableName, 'EMailType3', ftInteger);
      if list.IndexOf('Website1') = -1 then
        AddField(ContactsTableName, 'Website1', ftString, 100);
      if list.IndexOf('Website2') = -1 then
        AddField(ContactsTableName, 'Website2', ftString, 100);
      if list.IndexOf('WebsiteType1') = -1 then
        AddField(ContactsTableName, 'WebsiteType1', ftInteger);
      if list.IndexOf('WebsiteType2') = -1 then
        AddField(ContactsTableName, 'WebsiteType2', ftInteger);

      FConnection.Commit;
    except
      FConnection.Rollback;
      raise Exception.Create('Fehler beim Aktualisieren der Tabellenstruktur auf die aktuelle VisualPlanIt-Version');
    end;
  finally
    list.Free;
  end;

  FConnection.Connected := false;
  FConnection.AutoCommit := autocommit;
  FConnection.Connected := true;
end;

function TVpCaoDatastore.GetContactsTable: TDataset;
begin
  Result := FContactsTable;
end;

function TVpCaoDatastore.GetEventsTable: TDataset;
begin
  Result := FEventsTable;
end;

function TVpCaoDataStore.GetNextID(TableName: string): integer;
begin
  { This is not needed in the ZEOS datastore as these tables use
    autoincrement fields. }
  result := -1;
end;

function TVpCaoDatastore.GetResourceTable : TDataset;
begin
  Result := FResourceTable;
end;

function TVpCaoDatastore.GetTasksTable : TDataset;
begin
  Result := FTasksTable;
end;

procedure TVpCaoDatastore.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    Connected := AutoConnect and (
      AutoCreate or
      (FContactsTable.Exists and FEventsTable.Exists and FResourceTable.Exists and FTasksTable.Exists)
    );
end;

procedure TVpCaoDatastore.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FConnection) then
    FConnection := nil;
end;

{ Renames the fields specified in the list. Each list item contains old and new
  fieldnames separated by a bar character (|).

  Note that sqlite3 does not provide a command for renaming of fields. Therefore,
  the old table is renamed to a temp table, a new table with the renamed fields
  is created and the content of the temp table is copied to the new table.
  Finally the temp table is deleted.

  See:
  https://stackoverflow.com/questions/805363/how-do-i-rename-a-column-in-a-sqlite-database-table

  TO DO:
  Take care of the case that a renamed field belongs to an index, constraint, etc.
  (this case is ignored currently). }
procedure TVpCaoDatastore.RenameFields(ATableName: String; AFields: TStrings);
const
  NO_INDEX = false;
var
  sql: String;
  oldFields: TStrings;
  oldfn, newfn: String;
  srcfn, destfn: String;
  i, j, p: Integer;
  done: Boolean;
begin
  oldfields := TStringList.Create;
  try
    FConnection.GetColumnNames(ATableName, '', oldfields);

    { 1 - Rename old table (append _TMP to tablename) }
    sql := Format('ALTER TABLE %0:s RENAME TO %0:s_TMP;', [ATableName]);
    FConnection.ExecuteDirect(sql);

    { 2 - Create new table }
    if ATableName = ContactsTableName then
      CreateTable(ContactsTableName, NO_INDEX) else
    if ATablename = EventsTableName then
      CreateTable(EventsTablename, NO_INDEX) else
    if ATableName = ResourceTableName then
      CreateTable(ResourceTableName, NO_INDEX) else
    if ATableName = TasksTableName then
      CreateTable(TasksTableName, NO_INDEX)
    else
      raise Exception.Create('Unknown table in RenameFields.');

    { 3 - Copy contents from temp table to new table }
    srcfn := '';
    destfn := '';
    for i:=0 to oldfields.Count-1 do begin
      done := false;
      // Is field "oldfields[i]" contained in the list of fields to be renamed?
      for j:=0 to AFields.Count-1 do begin
        p := pos('|', AFields[j]);
        oldfn := copy(AFields[j], 1, p-1);
        newfn := copy(AFields[j], p+1, MaxInt);
        if oldfn = oldfields[i] then begin
          // yes: add old field name to srcfn, new field name to destfn
          srcfn := srcfn + ',' + oldfn;
          destfn := destfn + ',' + newfn;
          done := true;
          break;
        end;
      end;
      if not done then begin
        // no: add current field name to srcfn and destfn
        srcfn := srcfn + ',' + oldfields[i];
        destfn := destfn + ',' + oldfields[i];
      end;
    end;
    // Remove the beginning comma added above.
    if srcfn <> '' then System.Delete(srcfn, 1, 1);
    if destfn <> '' then System.Delete(destfn, 1, 1);
    // Execute INSERT command
    sql := Format(
      'INSERT INTO %0:s (%1:s) SELECT %2:s FROM %0:s_TMP;', [
      ATableName, destfn, srcfn
    ]);
    FConnection.ExecuteDirect(sql);

    { 4 - Finally delete the temp table }
    sql := Format('DROP TABLE %s_TMP;', [ATableName]);
    FConnection.ExecuteDirect(sql);

    FConnection.Disconnect;
    FConnection.Connect;
  finally
    oldfields.Free;
  end;
end;

procedure TVpCaoDatastore.SetConnected(const AValue: Boolean);
begin
  if (AValue = Connected) or (FConnection = nil) then
    exit;

  if AValue and AutoCreate then
    CreateTables;

  FConnection.Connected := AValue;
  if FConnection.Connected then begin
    FixContactsTable;
    FContactsTable.Open;
    FEventsTable.Open;
    FResourceTable.Open;
    FTasksTable.Open;
  end;

  inherited SetConnected(AValue);

  if FConnection.Connected then
    Load;
end;

procedure TVpCaoDatastore.SetConnection(const AValue: TZConnection);
var
  wasConnected: Boolean;
begin
  if AValue = FConnection then
    exit;

  // To do: clear planit lists...
  if FConnection <> nil then begin
    wasConnected := FConnection.Connected;
    Connected := false;
  end else
    wasConnected := false;
  FConnection := AValue;
  FContactsTable.Connection := FConnection;
  FEventsTable.Connection := FConnection;
  FResourceTable.Connection := FConnection;
  FTasksTable.Connection := FConnection;
  if wasConnected then Connected := true;
end;

procedure Register;
begin
  {$I ..\resources\vpcaods_icon.ctrs}
  RegisterComponents('Visual PlanIt',[TVpCaoDataStore]);
end;

end.
