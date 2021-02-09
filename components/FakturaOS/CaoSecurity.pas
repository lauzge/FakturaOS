unit CaoSecurity;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}
{$H+}

interface

uses
  Windows, SysUtils, Classes, Dialogs, DB, LResources;

//------------------------------------------------------------------------------
// tCaoSecurity
//------------------------------------------------------------------------------

type
  tCaoSecurity = class(TComponent)
  private
    { Private-Deklarationen }
    FCurrUser       : String;
    FCurrGroup      : String;
    FCurrUserID     : Integer;
    FCurrGroupID    : Integer;

    //FZDataBase : tZDatabase;

  protected
    { Protected-Deklarationen }
    Procedure SetCurrUser (NewUser : String);
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); virtual;

    function CanOpenModul (ModulID, SubModulID : Integer) : Boolean;
    function CanEdit      (ModulID, SubModulID : Integer) : Boolean;
    function CanInsert    (ModulID, SubModulID : Integer) : Boolean;
    function CanDelete    (ModulID, SubModulID : Integer) : Boolean;
  published
    { Published-Deklarationen }
    property CurrUser       : String Read FCurrUser write SetCurrUser;
    property CurrGroup      : String Read FCurrGroup;
  end;

//------------------------------------------------------------------------------
// tCaoDatasetSecurity
//------------------------------------------------------------------------------

type
  tCaoDatasetSecurity = class(TComponent)
  private
    { Private-Deklarationen }
    FDataset    : tDataset;
    FSecurity   : tCaoSecurity;
    FModulID    : Integer;
    FSubModulID : Integer;

    FOldDatasetBeforeEdit: TDataSetNotifyEvent;
    FOldDatasetBeforeInsert: TDataSetNotifyEvent;
    FOldDatasetBeforeDelete: TDataSetNotifyEvent;
  protected
    { Protected-Deklarationen }
    procedure SetDataset (NewValue : tDataset);

    procedure BeforeEdit   (DataSet: TDataSet);
    procedure BeforeInsert (DataSet: TDataSet);
    procedure BeforeDelete (DataSet: TDataSet);
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); virtual;
  published
    { Published-Deklarationen }
    property CaoSecurity : tCaoSecurity Read FSecurity Write FSecurity;
    property Dataset     : tDataset Read FDataset write SetDataset;
    property ModulID     : Integer Read FModulID write FModulID;
    property SubModulID  : Integer Read FSubModulID write FSubModulID;
  end;

procedure Register;

implementation

//------------------------------------------------------------------------------
// tCaoSecurity
//------------------------------------------------------------------------------
constructor tCaoSecurity.Create(AOwner: TComponent);
begin
     inherited;
     FCurrUser    :='';
     FCurrGroup   :='';
     FCurrUserID  :=-1;
     FCurrGroupID :=-1;
end;
//------------------------------------------------------------------------------
Procedure tCaoSecurity.SetCurrUser (NewUser : String);
begin
     if NewUser <> FCurrUser then
     begin
        FCurrUser :=NewUser;
        // jetzt user laden und dann die Rechte aus der Tabelle BENUTZERRECHTE
        // laden
     end;
end;
//------------------------------------------------------------------------------
function tCaoSecurity.CanOpenModul (ModulID, SubModulID : Integer) : Boolean;
begin
     Result :=True;
     //Result :=False;

     // Muß Bit 0 auswerten
end;
//------------------------------------------------------------------------------
function tCaoSecurity.CanEdit   (ModulID, SubModulID : Integer) : Boolean;
begin
     Result :=True;

     // Muß Bit 1 auswerten
end;
//------------------------------------------------------------------------------
function tCaoSecurity.CanInsert (ModulID, SubModulID : Integer) : Boolean;
begin
     Result :=True;

     // Muß Bit 2 auswerten
end;
//------------------------------------------------------------------------------
function tCaoSecurity.CanDelete (ModulID, SubModulID : Integer) : Boolean;
begin
     Result :=True;


     // Muß Bit 3 auswerten
end;
//------------------------------------------------------------------------------
// tCaoDatasetSecurity
//------------------------------------------------------------------------------
constructor tCaoDatasetSecurity.Create(AOwner: TComponent);
begin
     inherited;
     FDataset                :=nil;
     FSecurity               :=nil;
     FOldDatasetBeforeEdit   :=nil;
     FOldDatasetBeforeInsert :=nil;
     FOldDatasetBeforeDelete :=nil;
end;
//------------------------------------------------------------------------------
procedure tCaoDatasetSecurity.SetDataset (NewValue : tDataset);
begin
     if NewValue <> FDataSet then
     begin
        if assigned (FDataset) then
        begin
           // Alter Ereignisbehandlungsroutinen ggf. wiederherstellen
           if assigned (FOldDatasetBeforeEdit)
            then FDataset.BeforeEdit :=FOldDatasetBeforeEdit;
           if assigned (FOldDatasetBeforeInsert)
            then FDataset.BeforeInsert :=FOldDatasetBeforeInsert;
           if assigned (FOldDatasetBeforeDelete)
            then FDataset.BeforeDelete :=FOldDatasetBeforeDelete;
        end;

        FOldDatasetBeforeEdit   :=nil;
        FOldDatasetBeforeInsert :=nil;
        FOldDatasetBeforeDelete :=nil;

        FDataSet :=NewValue;

        if assigned (FDataset) then
        begin
           // Neue Ereignisbehandlung einhängen
           // Dabei bereits existierende Einträge sichern, damit sie
           // aufgerufen werden können

           if assigned (FDataset.BeforeEdit)
            then FOldDatasetBeforeEdit :=FDataset.BeforeEdit;
           FDataset.BeforeEdit :=BeforeEdit;

           if assigned (FDataset.BeforeInsert)
            then FOldDatasetBeforeInsert :=FDataset.BeforeInsert;
           FDataset.BeforeInsert :=BeforeInsert;

           if assigned (FDataset.BeforeDelete)
            then FOldDatasetBeforeDelete :=FDataset.BeforeDelete;
           FDataset.BeforeDelete :=BeforeDelete;
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure tCaoDatasetSecurity.BeforeEdit(DataSet: TDataSet);
begin
     //ggf. alte Ereignisbehandlungsroutine aufrufen
     if assigned(FOldDatasetBeforeEdit)
      then FOldDatasetBeforeEdit (Dataset);

     // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
     // wenn nein, Abbruch
     if (assigned (FSecurity))and
        (not FSecurity.CanEdit (FModulID, FSubModulID)) then Abort;
end;
//------------------------------------------------------------------------------
procedure tCaoDatasetSecurity.BeforeInsert(DataSet: TDataSet);
begin
     //ggf. alte Ereignisbehandlungsroutine aufrufen
     if assigned(FOldDatasetBeforeInsert)
      then FOldDatasetBeforeInsert (Dataset);

     // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
     // wenn nein, Abbruch
     if (assigned (FSecurity))and
        (not FSecurity.CanInsert (FModulID, FSubModulID)) then Abort;
end;
//------------------------------------------------------------------------------
procedure tCaoDatasetSecurity.BeforeDelete(DataSet: TDataSet);
begin
     //ggf. alte Ereignisbehandlungsroutine aufrufen
     if assigned(FOldDatasetBeforeDelete)
      then FOldDatasetBeforeDelete (Dataset);

     // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
     // wenn nein, Abbruch
     if (assigned (FSecurity))and
        (not FSecurity.CanDelete (FModulID, FSubModulID)) then Abort;
end;
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
procedure Register;
begin
  {$I caosecurity_icon.ctrs}
  {$I caodatasetsecurity_icon.ctrs}
  RegisterComponents('Faktura_OS', [tCaoSecurity,tCaoDatasetSecurity]);
end;

end.
