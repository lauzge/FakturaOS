{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2003 Jan Pokrandt / Jan@JP-SOFT.de

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************
}

{

Programm     : CAO-Faktura
Modul        : CAO_ADRESSEN_IMPORT
Stand        : 13.03.2004
Version      : 1.2.5.4
Beschreibung : Adressen-Import via Textdatei

History :

24.06.2003 - Unit zum GNU-Source hinzugefügt
16.01.2004 - Wertzuweisungen wurden nicht berücksichtigt, Bufix
14.03.2004 - Profile eingebaut, Analayse durch Locate beschleunigt
             gesamten Dialog überarbeitet und im Aussehen an den Artikel-Import
             angepaßt
20.05.2004 - Bugfix, wenn beim Import keine Währung zugewiesen wird,
             bleibt dieses Feld leer, jetzt wird in diesem Fall korrekt
             die Leitwährung eingefügt
}

{01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert}

unit cao_adressen_import;

{$IFDEF FPC}{$mode delphi}{$ENDIF}
{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Grids, ZDataset, ZAbstractRODataset;

type

  { TKundenImportForm }

  TKundenImportForm = class(TForm)
    Memo1: TMemo;
    ProfDS: TDataSource;
    KunQuery: TZQuery;
    KunQueryABTEILUNG: TZRawStringField;
    KunQueryANREDE: TZRawStringField;
    KunQueryBANK: TZRawStringField;
    KunQueryBLZ: TZRawStringField;
    KunQueryBRIEFANREDE: TZRawStringField;
    KunQueryDEB_NUM: TZIntegerField;
    KunQueryDIVERSES: TZRawStringField;
    KunQueryEMAIL: TZRawStringField;
    KunQueryEMAIL2: TZRawStringField;
    KunQueryFAX: TZRawStringField;
    KunQueryFUNK: TZRawStringField;
    KunQueryGRUPPE: TZRawStringField;
    KunQueryIBAN: TZRawStringField;
    KunQueryINTERNET: TZRawStringField;
    KunQueryKRD_NUM: TZIntegerField;
    KunQueryKTO: TZRawStringField;
    KunQueryKTO_INHABER: TZRawStringField;
    KunQueryKUNDENGRUPPE: TZIntegerField;
    KunQueryKUNNUM1: TZRawStringField;
    KunQueryKUNNUM2: TZRawStringField;
    KunQueryKUN_GEBDATUM: TZDateField;
    KunQueryKUN_SEIT: TZDateField;
    KunQueryLAND: TZRawStringField;
    KunQueryMATCHCODE: TZRawStringField;
    KunQueryNAME1: TZRawStringField;
    KunQueryNAME2: TZRawStringField;
    KunQueryNAME3: TZRawStringField;
    KunQueryORT: TZRawStringField;
    KunQueryPF_PLZ: TZRawStringField;
    KunQueryPLZ: TZRawStringField;
    KunQueryPOSTFACH: TZRawStringField;
    KunQueryPROVIS_PROZ: TZDoubleField;
    KunQuerySHOP_ID: TZSmallIntField;
    KunQuerySHOP_KUNDE_ID: TZIntegerField;
    KunQuerySTRASSE: TZRawStringField;
    KunQuerySWIFT: TZRawStringField;
    KunQueryTELE1: TZRawStringField;
    KunQueryTELE2: TZRawStringField;
    KunQueryUST_NUM: TZRawStringField;
    PC1: TPageControl;
    Panel1: TPanel;
    ProfTab: TZQuery;
    ProfTabLAST_CHANGE: TZDateTimeField;
    ProfTabMAINKEY: TZRawStringField;
    ProfTabNAME: TZRawStringField;
    ProfTabVAL_BLOB: TZRawCLobField;
    TabSheet1: TTabSheet;
    Logbuch: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
  private

  public

  end;

var
  KundenImportForm: TKundenImportForm;

implementation

{$R *.frm}

end.

