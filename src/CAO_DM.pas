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


Programm     : CAO-Faktura
Modul        : CAO_DM
Stand        : 20.05.2004
Version      : 1.2.5.4
Beschreibung : allgemeines nichtvisuelles Datenmodul mit Grundfunktionen
               für das Programm

- Funktionen zum öffnen eines Mandanten (Datenbank im MySQL-Server)
- Funktionen zur Anlage einer neuen Datenbank und aller Tabellen + Formualre
- Funktionen für den Zugriff auf die SQL-Registery
  ( ReadString, WriteString etc. )
- Funktionen zum lesen und wirderherstellen von Tabellenlayouts (tDBGrid)
- Funktionen zum Stornieren von Vorgängen
- Funktion CalcLeitWaehrung rechnet beliebige Währung in Leitwährung um


History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
17.01.2003 - Code für Einbindung der Formulare bei anlage eines neuen Mandanten
             implementiert ( Formulare aus Datei formulare.cao )
20.01.2003 - DB-SQL-Code für aktuelle Version der DB (1.03) angepaßt
           - RX-Komponenten durch JEDI-VCL-Komponenten ersetzt
12.02.2003 - Fehler beim Storno von Belegen gefixt
14.03.2003 - Bug in Fkt. Buche_Einkauf entfernt
             (EK-Preis im Artikelstammm wurde nach Einführung der Rabattgruppen
              nicht mehr korrekt gesetzt)
           - neue Funktion "CalcRabGrpPreis" erstellt, die den EK-Preis bei
             Übergabe des VK-Preises bei Artikeln mit Rabattgruppe errechnet
10.05.2003 - neue Tabelle Firma hinzugefügt, in der sich nur 1 DS mit den
             aktuellen Firmendaten für die Formulare befindet
           - Funktion Buche_Einkauf erweitert, damit der Status der Bestellungen
             korrekt aktualisiert wird.
11.05.2003 - neue Routine zum ermitteln der SQL-Benutzerrechte
             Routinen zum öffnen, erzeugen und updaten eines Mandanten verbessert
             bei zu wenigen Benutzerrechten wird jetzt mit einer Fehlermeldung
             abgebrochen
           - Registery-Funktionen brechen jetzt sofort ab, wenn die DB nicht
             connected ist
26.05.2003 - Rabattgruppen um VK-Gruppen erweitert
31.05.2003 - neue Funktion zur aktualisierung der Artikelfelder MENGE_xxx_EDI
           - Funktionen Buche_xxxxx überarbeitet, damit die MENGE_xxx_EDI korrekt
             aktualisiert werden
01.07.2003 - Fehler beim Storno VK mit Barzahlung beseitigt
           - Bug #18 Default '0' aus allen Create anweisungen entfernt
           - Port für MySQL-Server wird jetzt aus der .cfg gelesen
13.07.2003 - Code für Speichern der Mandantentabelle hinzugefügt
           - Code zum einfügen eines neuen Mandanten hinzugefügt
           - Code für Backup + Restore entfernt (jetzt eigene Unit CAO_BACKUP.pas
27.07.2003 - 2 neue Funktionen zum Export vonb Datasets hinzugefügt
30.07.2003 - neue DB-Version 1.07 eingebaut
           - Bug in Funktion CalcRabGrpPreis beseitigt
           - 2 neue Routinen zum Laden und Speichern von Langtexten in die
             SQL-Registery hinzugefügt
20.08.2003 - Beim Buchen von Rechnungen werden jetzt die Stücklisten-Artikel
             mit Artikeltyp "Z" in die Rechnung als Unterartikel eingefügt
06.09.2003 - Bug #32 und Bug #33 beseitigt
21.10.2003 - Automatisches Update für PLZ und BLZ eingebaut, dafür vird die
             Version aus der .CFG-Datei mit der internen Version verglichen und
             dann ggf. die PLZ/BLZ gelöscht und neu eingelesen
16.11.2003 - Mandant-Löschen Funktion hinzugefügt
02.12.2003 - neue Funktion IncNummerStr erstellt, welche eine Nummer aus einem
             best. Nummernkreis mit hilfe des Nummernformates erzeugt
06.12.2003 - SQL-Paßwort wird jetzt verschlüsselt abgelegt
13.02.2004 - beim Storno von VK-Rechnungen werden jetzt auch Stücklistenartikel
             korrekt zurückgebucht
14.05.2004 - Beim Buchen von EK-Rechnungen werden jetzt die VK's berechnet,
             wenn Kalkulationsfaktoren mit im Spiel sind
20.05.2004 - Flag LINUX hinzugefügt, das per Kommandozeile gesetzt werden kann
}

{*******************************************************************************

$Id: CAO_DM.pas,v 1.60 2004/05/23 14:22:47 jan Exp $

CVS-Log :
$Log: CAO_DM.pas,v $
Revision 1.60  2004/05/23 14:22:47  jan
Beim Buchen von EK-Rechnungen werden jetzt die VK's berechnet,  wenn Kalkulationsfaktoren mit im Spiel sind

Revision 1.39  2003/09/22 00:21:55  jan
neue Fkt. zur Ermittlung des Kalkulationsfaktors von Warengruppen eingebaut

*******************************************************************************

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_DM;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Graphics, Windows, Forms, db, dbgrids, dialogs,
  controls, JvStringHolder, DCPdes, DCPmd5, ZConnection, ZDataset,
  ZAbstractRODataset, CAO_Tool1, cao_var_const, CaoSecurity;

type tEkUpdateTyp = (ekuNoUpdate, ekuNewPreis, ekuMittel);

type tDBUserRechte  = (urCreate, urDrop, urAlter,
                       urIndex, urSelect, urInsert,
                       urUpdate, urDelete);

type tSDBUserRechte = set of tDBUserRechte;

type tWgrFaktorCache = Record
         Wgr : Integer;
         FTab : array[1..5] of Double;
     end;

type

  { TDM1 }

  TDM1 = class(TDataModule)
    ArtInfoTabADRESS_ID: TZIntegerField;
    ArtInfoTabALTTEIL_FLAG: TBooleanField;
    ArtInfoTabARTIKELTYP: TZRawStringField;
    ArtInfoTabARTNUM: TZRawStringField;
    ArtInfoTabAUFW_KTO: TZIntegerField;
    ArtInfoTabBARCODE: TZRawStringField;
    ArtInfoTabBESTNUM: TZRawStringField;
    ArtInfoTabDIMENSION: TZRawStringField;
    ArtInfoTabEK_PREIS: TZDoubleField;
    ArtInfoTabERLOES_KTO: TZIntegerField;
    ArtInfoTabERSATZ_ARTNUM: TZRawStringField;
    ArtInfoTabGEWICHT: TZDoubleField;
    ArtInfoTabGROESSE: TZRawStringField;
    ArtInfoTabJID: TZIntegerField;
    ArtInfoTabKAS_NAME: TZRawStringField;
    ArtInfoTabKURZNAME: TZRawStringField;
    ArtInfoTabLAENGE: TZRawStringField;
    ArtInfoTabLANGNAME: TZRawCLobField;
    ArtInfoTabMATCHCODE: TZRawStringField;
    ArtInfoTabMENGE2: TZCardinalField;
    ArtInfoTabMENGE3: TZCardinalField;
    ArtInfoTabMENGE4: TZCardinalField;
    ArtInfoTabMENGE5: TZCardinalField;
    ArtInfoTabMENGE_AKT: TZDoubleField;
    ArtInfoTabMENGE_BESTELLT: TZDoubleField;
    ArtInfoTabMENGE_LIEF: TZBCDField;
    ArtInfoTabMENGE_RESERVIERT: TZDoubleField;
    ArtInfoTabMENGE_SOLL: TZBCDField;
    ArtInfoTabME_EINHEIT: TZRawStringField;
    ArtInfoTabNO_BEZEDIT_FLAG: TBooleanField;
    ArtInfoTabNO_PROVISION_FLAG: TZRawStringField;
    ArtInfoTabNO_RABATT_FLAG: TBooleanField;
    ArtInfoTabNO_VK_FLAG: TBooleanField;
    ArtInfoTabPREIS: TZDoubleField;
    ArtInfoTabPREIS2: TZDoubleField;
    ArtInfoTabPREIS3: TZDoubleField;
    ArtInfoTabPREIS4: TZDoubleField;
    ArtInfoTabPREIS5: TZDoubleField;
    ArtInfoTabPREIS_TYP: TZByteField;
    ArtInfoTabPROVIS_PROZ: TZDoubleField;
    ArtInfoTabPR_EINHEIT: TZDoubleField;
    ArtInfoTabRABGRP_ID: TZRawStringField;
    ArtInfoTabREC_ID: TZIntegerField;
    ArtInfoTabSN_FLAG: TZRawStringField;
    ArtInfoTabSTEUER_CODE: TZShortIntField;
    ArtInfoTabVK1: TZDoubleField;
    ArtInfoTabVK1B: TZDoubleField;
    ArtInfoTabVK2: TZDoubleField;
    ArtInfoTabVK2B: TZDoubleField;
    ArtInfoTabVK3: TZDoubleField;
    ArtInfoTabVK3B: TZDoubleField;
    ArtInfoTabVK4: TZDoubleField;
    ArtInfoTabVK4B: TZDoubleField;
    ArtInfoTabVK5: TZDoubleField;
    ArtInfoTabVK5B: TZDoubleField;
    ArtInfoTabVPE: TZIntegerField;
    ArtInfoTabWARENGRUPPE: TZIntegerField;
    CaoSecurity: tCaoSecurity;
    CpyDstKopfTabADATUM: TZDateField;
    CpyDstKopfTabADDR_ID: TZIntegerField;
    CpyDstKopfTabATMSUMME: TZDoubleField;
    CpyDstKopfTabATRNUM: TZIntegerField;
    CpyDstKopfTabATSUMME: TZDoubleField;
    CpyDstKopfTabBANK_ID: TZIntegerField;
    CpyDstKopfTabBEST_CODE: TZShortIntField;
    CpyDstKopfTabBEST_DATUM: TZDateField;
    CpyDstKopfTabBEST_NAME: TZRawStringField;
    CpyDstKopfTabBRUTTO_FLAG: TBooleanField;
    CpyDstKopfTabBSUMME: TZDoubleField;
    CpyDstKopfTabERSTELLT: TZDateField;
    CpyDstKopfTabERST_NAME: TZRawStringField;
    CpyDstKopfTabFOLGENR: TZIntegerField;
    CpyDstKopfTabFREIGABE1_FLAG: TBooleanField;
    CpyDstKopfTabGEGENKONTO: TZIntegerField;
    CpyDstKopfTabGEWICHT: TZDoubleField;
    CpyDstKopfTabGLOBRABATT: TZDoubleField;
    CpyDstKopfTabINFO: TZRawCLobField;
    CpyDstKopfTabIST_ANZAHLUNG: TZDoubleField;
    CpyDstKopfTabIST_BETRAG: TZDoubleField;
    CpyDstKopfTabIST_SKONTO: TZDoubleField;
    CpyDstKopfTabIST_ZAHLDAT: TZDateField;
    CpyDstKopfTabKFZ_ID: TZIntegerField;
    CpyDstKopfTabKM_STAND: TZIntegerField;
    CpyDstKopfTabKONTOAUSZUG: TZIntegerField;
    CpyDstKopfTabKOST_NETTO: TZDoubleField;
    CpyDstKopfTabKUN_ABTEILUNG: TZRawStringField;
    CpyDstKopfTabKUN_ANREDE: TZRawStringField;
    CpyDstKopfTabKUN_LAND: TZRawStringField;
    CpyDstKopfTabKUN_NAME1: TZRawStringField;
    CpyDstKopfTabKUN_NAME2: TZRawStringField;
    CpyDstKopfTabKUN_NAME3: TZRawStringField;
    CpyDstKopfTabKUN_NUM: TZRawStringField;
    CpyDstKopfTabKUN_ORT: TZRawStringField;
    CpyDstKopfTabKUN_PLZ: TZRawStringField;
    CpyDstKopfTabKUN_STRASSE: TZRawStringField;
    CpyDstKopfTabLDATUM: TZDateField;
    CpyDstKopfTabLIEFART: TZSmallIntField;
    CpyDstKopfTabLIEF_ADDR_ID: TZIntegerField;
    CpyDstKopfTabLOHN: TZDoubleField;
    CpyDstKopfTabMAHNDATUM: TZDateField;
    CpyDstKopfTabMAHNKOSTEN: TZDoubleField;
    CpyDstKopfTabMAHNPRINT: TZSmallIntField;
    CpyDstKopfTabMAHNSTUFE: TZSmallIntField;
    CpyDstKopfTabMSUMME: TZDoubleField;
    CpyDstKopfTabMSUMME_0: TZDoubleField;
    CpyDstKopfTabMSUMME_1: TZDoubleField;
    CpyDstKopfTabMSUMME_2: TZDoubleField;
    CpyDstKopfTabMSUMME_3: TZDoubleField;
    CpyDstKopfTabMWST_0: TZDoubleField;
    CpyDstKopfTabMWST_1: TZDoubleField;
    CpyDstKopfTabMWST_2: TZDoubleField;
    CpyDstKopfTabMWST_3: TZDoubleField;
    CpyDstKopfTabMWST_FREI_FLAG: TBooleanField;
    CpyDstKopfTabNSUMME: TZDoubleField;
    CpyDstKopfTabORGNUM: TZRawStringField;
    CpyDstKopfTabPROJEKT: TZRawStringField;
    CpyDstKopfTabPROVIS_WERT: TZDoubleField;
    CpyDstKopfTabPR_EBENE: TZSmallIntField;
    CpyDstKopfTabQUELLE: TZSmallIntField;
    CpyDstKopfTabQUELLE_SUB: TZShortIntField;
    CpyDstKopfTabRDATUM: TZDateField;
    CpyDstKopfTabREC_ID: TZIntegerField;
    CpyDstKopfTabROHGEWINN: TZDoubleField;
    CpyDstKopfTabSOLL_NTAGE: TZSmallIntField;
    CpyDstKopfTabSOLL_RATBETR: TZDoubleField;
    CpyDstKopfTabSOLL_RATEN: TZSmallIntField;
    CpyDstKopfTabSOLL_RATINTERVALL: TZIntegerField;
    CpyDstKopfTabSOLL_SKONTO: TZDoubleField;
    CpyDstKopfTabSOLL_STAGE: TZSmallIntField;
    CpyDstKopfTabSTADIUM: TZSmallIntField;
    CpyDstKopfTabTERMIN: TZDateField;
    CpyDstKopfTabTKOST: TZDoubleField;
    CpyDstKopfTabUSR1: TZRawStringField;
    CpyDstKopfTabUSR2: TZRawStringField;
    CpyDstKopfTabUW_NUM: TZIntegerField;
    CpyDstKopfTabVERTRETER_ID: TZIntegerField;
    CpyDstKopfTabVLSNUM: TZIntegerField;
    CpyDstKopfTabVRENUM: TZIntegerField;
    CpyDstKopfTabWAEHRUNG: TZRawStringField;
    CpyDstKopfTabWARE: TZDoubleField;
    CpyDstKopfTabWERT_NETTO: TZDoubleField;
    CpyDstKopfTabZAHLART: TZSmallIntField;
    CpySrcKopfTabADATUM: TZDateField;
    CpySrcKopfTabADDR_ID: TZIntegerField;
    CpySrcKopfTabATMSUMME: TZDoubleField;
    CpySrcKopfTabATRNUM: TZIntegerField;
    CpySrcKopfTabATSUMME: TZDoubleField;
    CpySrcKopfTabBANK_ID: TZIntegerField;
    CpySrcKopfTabBEST_CODE: TZShortIntField;
    CpySrcKopfTabBEST_DATUM: TZDateField;
    CpySrcKopfTabBEST_NAME: TZRawStringField;
    CpySrcKopfTabBRUTTO_FLAG: TBooleanField;
    CpySrcKopfTabBSUMME: TZDoubleField;
    CpySrcKopfTabERSTELLT: TZDateField;
    CpySrcKopfTabERST_NAME: TZRawStringField;
    CpySrcKopfTabFOLGENR: TZIntegerField;
    CpySrcKopfTabFREIGABE1_FLAG: TBooleanField;
    CpySrcKopfTabGEGENKONTO: TZIntegerField;
    CpySrcKopfTabGEWICHT: TZDoubleField;
    CpySrcKopfTabGLOBRABATT: TZDoubleField;
    CpySrcKopfTabINFO: TZRawCLobField;
    CpySrcKopfTabIST_ANZAHLUNG: TZDoubleField;
    CpySrcKopfTabIST_BETRAG: TZDoubleField;
    CpySrcKopfTabIST_SKONTO: TZDoubleField;
    CpySrcKopfTabIST_ZAHLDAT: TZDateField;
    CpySrcKopfTabKFZ_ID: TZIntegerField;
    CpySrcKopfTabKM_STAND: TZIntegerField;
    CpySrcKopfTabKONTOAUSZUG: TZIntegerField;
    CpySrcKopfTabKOST_NETTO: TZDoubleField;
    CpySrcKopfTabKUN_ABTEILUNG: TZRawStringField;
    CpySrcKopfTabKUN_ANREDE: TZRawStringField;
    CpySrcKopfTabKUN_LAND: TZRawStringField;
    CpySrcKopfTabKUN_NAME1: TZRawStringField;
    CpySrcKopfTabKUN_NAME2: TZRawStringField;
    CpySrcKopfTabKUN_NAME3: TZRawStringField;
    CpySrcKopfTabKUN_NUM: TZRawStringField;
    CpySrcKopfTabKUN_ORT: TZRawStringField;
    CpySrcKopfTabKUN_PLZ: TZRawStringField;
    CpySrcKopfTabKUN_STRASSE: TZRawStringField;
    CpySrcKopfTabLDATUM: TZDateField;
    CpySrcKopfTabLIEFART: TZSmallIntField;
    CpySrcKopfTabLIEF_ADDR_ID: TZIntegerField;
    CpySrcKopfTabLOHN: TZDoubleField;
    CpySrcKopfTabMAHNDATUM: TZDateField;
    CpySrcKopfTabMAHNKOSTEN: TZDoubleField;
    CpySrcKopfTabMAHNPRINT: TZSmallIntField;
    CpySrcKopfTabMAHNSTUFE: TZSmallIntField;
    CpySrcKopfTabMSUMME: TZDoubleField;
    CpySrcKopfTabMSUMME_0: TZDoubleField;
    CpySrcKopfTabMSUMME_1: TZDoubleField;
    CpySrcKopfTabMSUMME_2: TZDoubleField;
    CpySrcKopfTabMSUMME_3: TZDoubleField;
    CpySrcKopfTabMWST_0: TZDoubleField;
    CpySrcKopfTabMWST_1: TZDoubleField;
    CpySrcKopfTabMWST_2: TZDoubleField;
    CpySrcKopfTabMWST_3: TZDoubleField;
    CpySrcKopfTabMWST_FREI_FLAG: TBooleanField;
    CpySrcKopfTabNSUMME: TZDoubleField;
    CpySrcKopfTabORGNUM: TZRawStringField;
    CpySrcKopfTabPROJEKT: TZRawStringField;
    CpySrcKopfTabPROVIS_WERT: TZDoubleField;
    CpySrcKopfTabPR_EBENE: TZSmallIntField;
    CpySrcKopfTabQUELLE: TZSmallIntField;
    CpySrcKopfTabQUELLE_SUB: TZShortIntField;
    CpySrcKopfTabRDATUM: TZDateField;
    CpySrcKopfTabREC_ID: TZIntegerField;
    CpySrcKopfTabROHGEWINN: TZDoubleField;
    CpySrcKopfTabSOLL_NTAGE: TZSmallIntField;
    CpySrcKopfTabSOLL_RATBETR: TZDoubleField;
    CpySrcKopfTabSOLL_RATEN: TZSmallIntField;
    CpySrcKopfTabSOLL_RATINTERVALL: TZIntegerField;
    CpySrcKopfTabSOLL_SKONTO: TZDoubleField;
    CpySrcKopfTabSOLL_STAGE: TZSmallIntField;
    CpySrcKopfTabSTADIUM: TZSmallIntField;
    CpySrcKopfTabTERMIN: TZDateField;
    CpySrcKopfTabTKOST: TZDoubleField;
    CpySrcKopfTabUSR1: TZRawStringField;
    CpySrcKopfTabUSR2: TZRawStringField;
    CpySrcKopfTabUW_NUM: TZIntegerField;
    CpySrcKopfTabVERTRETER_ID: TZIntegerField;
    CpySrcKopfTabVLSNUM: TZIntegerField;
    CpySrcKopfTabVRENUM: TZIntegerField;
    CpySrcKopfTabWAEHRUNG: TZRawStringField;
    CpySrcKopfTabWARE: TZDoubleField;
    CpySrcKopfTabWERT_NETTO: TZDoubleField;
    CpySrcKopfTabZAHLART: TZSmallIntField;
    FirmaTabFUSSTEXT: TMemoField;
    FirmaTabKOPFTEXT: TMemoField;
    JPosTabALTTEIL_FLAG: TBooleanField;
    JPosTabBEZ_FEST_FLAG: TBooleanField;
    JPosTabBRUTTO_FLAG: TBooleanField;
    JPosTabGEBUCHT: TBooleanField;
    JPosTabSN_FLAG: TBooleanField;
    KunTabBRUTTO_FLAG: TBooleanField;
    KunTabDEFAULT_LIEFANSCHRIFT_ID: TZIntegerField;
    KunTabKTO: TZRawStringField;
    KunTabMWST_FREI_FLAG: TBooleanField;
    RabGrpDS: TDataSource;
    HerstellerDS: TDataSource;
    JourTabADATUM: TZDateField;
    JourTabADDR_ID: TZIntegerField;
    JourTabATMSUMME: TZDoubleField;
    JourTabATRNUM: TZIntegerField;
    JourTabATSUMME: TZDoubleField;
    JourTabBANK_ID: TZIntegerField;
    JourTabBEST_CODE: TZShortIntField;
    JourTabBEST_DATUM: TZDateField;
    JourTabBEST_NAME: TZRawStringField;
    JourTabBRUTTO_FLAG: TZRawStringField;
    JourTabBSUMME: TZDoubleField;
    JourTabBSUMME_0: TZDoubleField;
    JourTabBSUMME_1: TZDoubleField;
    JourTabBSUMME_2: TZDoubleField;
    JourTabBSUMME_3: TZDoubleField;
    JourTabERSTELLT: TZDateField;
    JourTabERST_NAME: TZRawStringField;
    JourTabFOLGENR: TZIntegerField;
    JourTabFREIGABE1_FLAG: TBooleanField;
    JourTabFUSSTEXT: TZRawCLobField;
    JourTabGEGENKONTO: TZIntegerField;
    JourTabGEWICHT: TZDoubleField;
    JourTabGLOBRABATT: TZDoubleField;
    JourTabINFO: TZRawCLobField;
    JourTabIST_ANZAHLUNG: TZDoubleField;
    JourTabIST_BETRAG: TZDoubleField;
    JourTabIST_SKONTO: TZDoubleField;
    JourTabIST_SKONTO_BETR: TFloatField;
    JourTabIST_ZAHLDAT: TZDateField;
    JourTabJAHR: TZDateField;
    JourTabKFZ_ID: TZIntegerField;
    JourTabKLASSE_ID: TZByteField;
    JourTabKM_STAND: TZIntegerField;
    JourTabKONTOAUSZUG: TZIntegerField;
    JourTabKOPFTEXT: TZRawCLobField;
    JourTabKOST_NETTO: TZDoubleField;
    JourTabKUN_ABTEILUNG: TZRawStringField;
    JourTabKUN_ANREDE: TZRawStringField;
    JourTabKUN_LAND: TZRawStringField;
    JourTabKUN_NAME1: TZRawStringField;
    JourTabKUN_NAME2: TZRawStringField;
    JourTabKUN_NAME3: TZRawStringField;
    JourTabKUN_NUM: TZRawStringField;
    JourTabKUN_ORT: TZRawStringField;
    JourTabKUN_PLZ: TZRawStringField;
    JourTabKUN_STRASSE: TZRawStringField;
    JourTabLDATUM: TZDateField;
    JourTabLIEFART: TZShortIntField;
    JourTabLIEF_ADDR_ID: TZIntegerField;
    JourTabLOHN: TZDoubleField;
    JourTabMAHNDATUM: TZDateField;
    JourTabMAHNKOSTEN: TZDoubleField;
    JourTabMAHNPRINT: TZShortIntField;
    JourTabMAHNSTUFE: TZShortIntField;
    JourTabMA_ID: TZIntegerField;
    JourTabMSUMME: TZDoubleField;
    JourTabMSUMME_0: TZDoubleField;
    JourTabMSUMME_1: TZDoubleField;
    JourTabMSUMME_2: TZDoubleField;
    JourTabMSUMME_3: TZDoubleField;
    JourTabMWST_0: TZDoubleField;
    JourTabMWST_1: TZDoubleField;
    JourTabMWST_2: TZDoubleField;
    JourTabMWST_3: TZDoubleField;
    JourTabMWST_FREI_FLAG: TZRawStringField;
    JourTabNSUMME: TZDoubleField;
    JourTabNSUMME_0: TZDoubleField;
    JourTabNSUMME_1: TZDoubleField;
    JourTabNSUMME_2: TZDoubleField;
    JourTabNSUMME_3: TZDoubleField;
    JourTabORGNUM: TZRawStringField;
    JourTabPRINT_FLAG: TZRawStringField;
    JourTabPROJEKT: TZRawStringField;
    JourTabPROVIS_BERECHNET: TZRawStringField;
    JourTabPROVIS_WERT: TZDoubleField;
    JourTabPR_EBENE: TZShortIntField;
    JourTabQUELLE: TZShortIntField;
    JourTabQUELLE_SUB: TZShortIntField;
    JourTabRDATUM: TZDateField;
    JourTabREC_ID: TZIntegerField;
    JourTabROHGEWINN: TZDoubleField;
    JourTabSHOP_CHANGE_FLAG: TZRawStringField;
    JourTabSHOP_ID: TZShortIntField;
    JourTabSHOP_ORDERID: TZIntegerField;
    JourTabSHOP_STATUS: TZByteField;
    JourTabSOLL_NTAGE: TZShortIntField;
    JourTabSOLL_RATBETR: TZDoubleField;
    JourTabSOLL_RATEN: TZShortIntField;
    JourTabSOLL_RATINTERVALL: TZIntegerField;
    JourTabSOLL_SKONTO: TZDoubleField;
    JourTabSOLL_STAGE: TZShortIntField;
    JourTabSTADIUM: TZShortIntField;
    JourTabTERMIN: TZDateField;
    JourTabTERM_ID: TZCardinalField;
    JourTabTKOST: TZDoubleField;
    JourTabUSR1: TZRawStringField;
    JourTabUSR2: TZRawStringField;
    JourTabUW_NUM: TZIntegerField;
    JourTabVERTRETER_ID: TZIntegerField;
    JourTabVLSNUM: TZIntegerField;
    JourTabVRENUM: TZIntegerField;
    JourTabWAEHRUNG: TZRawStringField;
    JourTabWARE: TZDoubleField;
    JourTabWERT_NETTO: TZDoubleField;
    JourTabZAHLART: TZShortIntField;
    JPosTabADDR_ID: TZIntegerField;
    JPosTabALTTEIL_PROZ: TZDoubleField;
    JPosTabALTTEIL_STCODE: TZShortIntField;
    JPosTabARTIKELTYP: TZRawStringField;
    JPosTabARTIKEL_ID: TZIntegerField;
    JPosTabARTNUM: TZRawStringField;
    JPosTabATRNUM: TZIntegerField;
    JPosTabBARCODE: TZRawStringField;
    JPosTabBEZEICHNUNG: TZRawCLobField;
    JPosTabDIMENSION: TZRawStringField;
    JPosTabEPREIS: TZDoubleField;
    JPosTabE_RGEWINN: TZDoubleField;
    JPosTabGEGENKTO: TZIntegerField;
    JPosTabGEWICHT: TZDoubleField;
    JPosTabGROESSE: TZRawStringField;
    JPosTabJOURNAL_ID: TZIntegerField;
    JPosTabLAENGE: TZRawStringField;
    JPosTabMATCHCODE: TZRawStringField;
    JPosTabMENGE: TZDoubleField;
    JPosTabME_EINHEIT: TZRawStringField;
    JPosTabPOSITION: TZIntegerField;
    JPosTabPR_EINHEIT: TZDoubleField;
    JPosTabQUELLE: TZShortIntField;
    JPosTabQUELLE_SRC: TZIntegerField;
    JPosTabQUELLE_SUB: TZShortIntField;
    JPosTabRABATT: TZDoubleField;
    JPosTabRABATT2: TZDoubleField;
    JPosTabRABATT3: TZDoubleField;
    JPosTabREC_ID: TZIntegerField;
    JPosTabSTEUER_CODE: TZShortIntField;
    JPosTabVIEW_POS: TZRawStringField;
    JPosTabVLSNUM: TZIntegerField;
    JPosTabVRENUM: TZIntegerField;
    KasBuchBDATUM: TZDateField;
    KasBuchBELEGNUM: TZRawStringField;
    KasBuchBTXT: TZRawCLobField;
    KasBuchGKONTO: TZIntegerField;
    KasBuchJAHR: TZIntegerField;
    KasBuchJOURNAL_ID: TZIntegerField;
    KasBuchQUELLE: TZIntegerField;
    KasBuchSKONTO: TZDoubleField;
    KasBuchZU_ABGANG: TZDoubleField;
    KunRabGrpADDR_ID: TZIntegerField;
    KunRabGrpBESCHREIBUNG: TZRawStringField;
    KunRabGrpLIEF_RABGRP: TZIntegerField;
    KunRabGrpMIN_MENGE: TZIntegerField;
    KunRabGrpRABATT1: TZDoubleField;
    KunRabGrpRABATT2: TZDoubleField;
    KunRabGrpRABATT3: TZDoubleField;
    KunRabGrpRABGRP_ID: TZRawStringField;
    KunRabGrpRABGRP_TYP: TZShortIntField;
    LiefRabGrpADDR_ID: TZIntegerField;
    LiefRabGrpBESCHREIBUNG: TZRawStringField;
    LiefRabGrpLIEF_RABGRP: TZIntegerField;
    LiefRabGrpMIN_MENGE: TZIntegerField;
    LiefRabGrpRABATT1: TZDoubleField;
    LiefRabGrpRABATT2: TZDoubleField;
    LiefRabGrpRABATT3: TZDoubleField;
    LiefRabGrpRABGRP_ID: TZRawStringField;
    LiefRabGrpRABGRP_TYP: TZShortIntField;
    ReKFZTabADDR_ID: TZIntegerField;
    ReKFZTabFGST_NUM: TZRawStringField;
    ReKFZTabKFZ_ID: TZIntegerField;
    ReKFZTabKM_STAND: TZIntegerField;
    ReKFZTabLE_BESUCH: TZDateField;
    ReKFZTabNAE_AU: TZDateField;
    ReKFZTabNAE_TUEV: TZDateField;
    ReKFZTabPOL_KENNZ: TZRawStringField;
    ReKFZTabSCHL_ZU_2: TZRawStringField;
    ReKFZTabSCHL_ZU_3: TZRawStringField;
    ReKFZTabZULASSUNG: TZDateField;
    ShopOSDS: TDataSource;
    STListTabART_ID: TZIntegerField;
    STListTabERSTELLT: TZDateField;
    STListTabERST_NAME: TZRawStringField;
    STListTabGEAEND: TZDateField;
    STListTabGEAEND_NAME: TZRawStringField;
    STListTabMENGE: TZDoubleField;
    STListTabName: TStringField;
    STListTabREC_ID: TZIntegerField;
    VertreterDS: TDataSource;
    SprachDS: TDataSource;
    WhrungDS: TDataSource;
    ZahlartDS: TDataSource;
    LiefArtDS: TDataSource;
    FirBankTabBLZ: TZIntegerField;
    FirBankTabFIBU_KTO: TZInt64Field;
    FirBankTabINHABER: TZRawStringField;
    FirBankTabKTONR: TZInt64Field;
    FirBankTabKURZBEZ: TZRawStringField;
    FirBankTabMAINKEY: TZRawStringField;
    LandDS: TDataSource;
    NummerTabFORMAT: TZRawStringField;
    NummerTabMAINKEY: TZRawStringField;
    NummerTabMAXLEN: TZInt64Field;
    NummerTabNAME: TZRawStringField;
    NummerTabNEXT_NUM: TZInt64Field;
    NummerTabQUELLE: TZIntegerField;
    WgrDS: TDataSource;
    KgrDS: TDataSource;
    FirmaDS: TDataSource;
    DB1: TZConnection;
    CreateMandantStr: TJvStrHolder;
    DBUpdTo1_02: TJvStrHolder;
    DBUpdTo1_05: TJvStrHolder;
    DBUpdTo1_08: TJvStrHolder;
    DbUpdTo1_0: TJvStrHolder;
    DBUpdTo1_03: TJvStrHolder;
    DBUpdTo1_06: TJvStrHolder;
    DBUpDTo1_09: TJvStrHolder;
    DBUpdTo1_01: TJvStrHolder;
    DBUpdTo1_04: TJvStrHolder;
    DBUpdTo1_07: TJvStrHolder;
    DCP_3des1: TDCP_3des;
    DCP_md5_1: TDCP_md5;
    FirmaTabABSENDER: TZRawStringField;
    FirmaTabANREDE: TZRawStringField;
    FirmaTabBANK1_BLZ: TZRawStringField;
    FirmaTabBANK1_IBAN: TZRawStringField;
    FirmaTabBANK1_KONTONR: TZRawStringField;
    FirmaTabBANK1_NAME: TZRawStringField;
    FirmaTabBANK1_SWIFT: TZRawStringField;
    FirmaTabBANK2_BLZ: TZRawStringField;
    FirmaTabBANK2_IBAN: TZRawStringField;
    FirmaTabBANK2_KONTONR: TZRawStringField;
    FirmaTabBANK2_NAME: TZRawStringField;
    FirmaTabBANK2_SWIFT: TZRawStringField;
    FirmaTabEMAIL: TZRawStringField;
    FirmaTabFAX: TZRawStringField;
    FirmaTabIMAGE1: TZBlobField;
    FirmaTabIMAGE2: TZBlobField;
    FirmaTabIMAGE3: TZBlobField;
    FirmaTabLAND: TZRawStringField;
    FirmaTabLEITWAEHRUNG: TZRawStringField;
    FirmaTabMANDANT_NAME: TZRawStringField;
    FirmaTabMOBILFUNK: TZRawStringField;
    FirmaTabNAME1: TZRawStringField;
    FirmaTabNAME2: TZRawStringField;
    FirmaTabNAME3: TZRawStringField;
    FirmaTabORT: TZRawStringField;
    FirmaTabPLZ: TZRawStringField;
    FirmaTabSTEUERNUMMER: TZRawStringField;
    FirmaTabSTRASSE: TZRawStringField;
    FirmaTabTELEFON1: TZRawStringField;
    FirmaTabTELEFON2: TZRawStringField;
    FirmaTabUSER_AKT: TZRawStringField;
    FirmaTabUST_ID: TZRawStringField;
    FirmaTabVORWAHL: TZRawStringField;
    FirmaTabWEBSEITE: TZRawStringField;
    KGRTabGR: TZIntegerField;
    KGRTabLANGBEZ: TZRawStringField;
    KGRTabMAINKEY: TZRawStringField;
    KGRTabSQL_STATEMENT: TZRawCLobField;
    KunTabANREDE: TZRawStringField;
    KunTabBANK: TZRawStringField;
    KunTabBLZ: TZRawStringField;
    KunTabBRIEFANREDE: TZRawStringField;
    KunTabDEB_NUM: TZIntegerField;
    KunTabEMAIL: TZRawStringField;
    KunTabFAX: TZRawStringField;
    KunTabKRD_NUM: TZIntegerField;
    KunTabKUNNUM1: TZRawStringField;
    KunTabKUNNUM2: TZRawStringField;
    KunTabKUN_LIEFART: TZIntegerField;
    KunTabKUN_ZAHLART: TZIntegerField;
    KunTabLAND: TZRawStringField;
    KunTabLIEF_LIEFART: TZIntegerField;
    KunTabLIEF_ZAHLART: TZIntegerField;
    KunTabNAME1: TZRawStringField;
    KunTabNAME2: TZRawStringField;
    KunTabNAME3: TZRawStringField;
    KunTabORT: TZRawStringField;
    KunTabPLZ: TZRawStringField;
    KunTabPR_EBENE: TZSmallIntField;
    KunTabREC_ID: TZIntegerField;
    KunTabSTATUS: TZIntegerField;
    KunTabSTRASSE: TZRawStringField;
    KunTabUST_NUM: TZRawStringField;
    LandTabFORMAT: TZShortIntField;
    LandTabID: TZRawStringField;
    LandTabISO_CODE_3: TZRawStringField;
    LandTabNAME: TZRawStringField;
    LandTabPOST_CODE: TZRawStringField;
    LandTabSPRACHE: TZRawStringField;
    LandTabVORWAHL: TZRawStringField;
    LandTabWAEHRUNG: TZRawStringField;
    RegTab: TZQuery;
    RegTabMAINKEY: TZRawStringField;
    RegTabNAME: TZRawStringField;
    RegTabVAL_BIN: TZBlobField;
    RegTabVAL_BLOB: TZRawCLobField;
    RegTabVAL_CHAR: TZRawStringField;
    RegTabVAL_DATE: TZDateTimeField;
    RegTabVAL_DOUBLE: TZDoubleField;
    RegTabVAL_INT: TZIntegerField;
    RegTabVAL_INT2: TZInt64Field;
    RegTabVAL_INT3: TZInt64Field;
    RegTabVAL_TYP: TZSmallIntField;
    ShopOrderStatusTabLANGBEZ: TZRawStringField;
    ShopOrderStatusTabMAINKEY: TZRawStringField;
    ShopOrderStatusTabORDERSTATUS_ID: TZIntegerField;
    ShopOrderStatusTabTEXT: TZRawCLobField;
    UniQuery: TZQuery;
    Transact1: TZTransaction;
    WgrTabBESCHREIBUNG: TZRawCLobField;
    WgrTabDEF_AKTO: TZIntegerField;
    WgrTabDEF_EKTO: TZIntegerField;
    WgrTabID: TZIntegerField;
    WgrTabNAME: TZRawStringField;
    WgrTabSTEUER_CODE: TZByteField;
    WgrTabTOP_ID: TZIntegerField;
    WgrTabVK1_FAKTOR: TZDoubleField;
    WgrTabVK2_FAKTOR: TZDoubleField;
    WgrTabVK3_FAKTOR: TZDoubleField;
    WgrTabVK4_FAKTOR: TZDoubleField;
    WgrTabVK5_FAKTOR: TZDoubleField;
    WgrTabVORGABEN: TZRawCLobField;
    WhrungTabFAKTOR: TZDoubleField;
    WhrungTabLANGBEZ: TZRawStringField;
    WhrungTabWAEHRUNG: TZRawStringField;
    ZahlartTabLANGBEZ: TZRawStringField;
    ZahlartTabNETTO_TAGE: TZInt64Field;
    ZahlartTabSKONTO_PROZ: TZDoubleField;
    ZahlartTabSKONTO_TAGE: TZIntegerField;
    ZahlartTabTEXT: TZRawCLobField;
    ZahlartTabZAHL_ID: TZDoubleField;
    ZBatchSQL1: TZQuery;
    WhrungTab: TZQuery;
    LandTab: TZQuery;
    LiefArtTab: TZQuery;
    ZahlartTab: TZQuery;
    ShopOrderStatusTab: TZQuery;
    VertreterTab: TZQuery;
    SprachTab: TZQuery;
    FirmaTab: TZQuery;
    NummerTab: TZQuery;
    FirBankTab: TZQuery;
    KunTab: TZQuery;
    KGRTab: TZQuery;
    WgrTab: TZQuery;
    UniQuery2: TZQuery;
    KunRabGrp: TZQuery;
    KasBuch: TZQuery;
    LiefRabGrp: TZQuery;
    HerstellerTab: TZQuery;
    JourTab: TZQuery;
    JPosTab: TZQuery;
    ReKFZTab: TZQuery;
    STListTab: TZQuery;
    ArtInfoTab: TZQuery;
    CpySrcKopfTab: TZQuery;
    CpyDstKopfTab: TZQuery;
    CpySrcPosTab: TZQuery;
    CpyDstPosTab: TZQuery;
    UpdateArtTab: TZQuery;
    ArtMengeTab: TZQuery;
    ReKunTab: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure FirBankTabBeforePost(DataSet: TDataSet);
    procedure FirmaTabCalcFields(DataSet: TDataSet);
    procedure JourTabCalcFields(DataSet: TDataSet);
    procedure KGRTabBeforePost(DataSet: TDataSet);
    procedure LandTabCalcFields(DataSet: TDataSet);
    procedure NummerTabNewRecord(DataSet: TDataSet);
    procedure ShopOrderStatusTabBeforePost(DataSet: TDataSet);
    procedure Transact1AfterBatchExec(Sender: TObject);
    procedure WgrTabBeforePost(DataSet: TDataSet);
    procedure ZBatchSql1AfterExecute(DataSet: TDataSet);
    procedure ZBatchSql1BeforeExecute(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    InNewNummer : Boolean;

  public
    { Public-Deklarationen }

    user : String;
    view_user,      // Username, der in Formularen und zur Anzeige verwendet
                    // wird, dieser wird aus der Tabelle MITARBEITER ermittelt
    ntuser,
    comp,email      : String[100];
    UserID          : Integer; // Eindeutige Mitarbeiternummer (ID)
    LeitWaehrung    : String;
    LandK2          : String[2];

    MainDir         : String;
    BackupDir       : String;
    DTADir          : String;
    TmpDir          : String;
    LogDir          : String;
    ExportDir       : String;
    ImportDir       : String;

    C2Color         : TColor; // Farbe f. 2. Textzeile in Gittern
    EditColor       : TColor;

    // zum Cachen der Funktion Calcleitwaehrung
    // sonst muß bei jeder Berechnung in der Registery
    // der Umrechnungskurs geholt werden
    CacheLastWaehrung : String;
    CacheLastKurs     : Double;

    LastVertrID       : Integer;
    LastVertrProz     : Double;

    SQLLog            : Boolean;

    TermID            : Integer; // Eindeutige ID der Arbeitsstation

    MwStTab           : Array[0..3] of Double; // Globale MwSt-Tabelle
    DefMwSt           : Double;  // Default MehrWertSteuer in %
    DefMwStCD         : Integer; // Verweis auf einen der Einträge in MwStTab

    AnzPreis          : Integer; // max. Preis (VK1-VK5)

    GCalcFaktorTab    : array[1..6] of Double; // Globale Kalkulationsfaktoren

    MandantTab        : Array of MandantRec;
    AktMandant        : String;
    MandantOK         : Boolean;

    USE_KFZ           : Boolean;
    AtrisEnable       : Boolean; // True, wenn Atris-Pfad gesetzt ist
    AtrisPfad         : String;

    DefSpracheID      : Integer;
    DefSprachCode     : String;

    BR_RUND_WERT      : Integer; // ganze Cent !!!   z.B. 5 = immer auf ganz 5 Cent runden
    BR_SUM_RUND_WERT  : Integer; // dito, jedoch für die Belegerstellung

    WgrFaktorCache    : tWgrFaktorCache;

    MahnFrist         : array[1..5] of Integer; // Anz. Tage als frist pro Mahnstufe

    PLZ_VERSION,
    BLZ_VERSION       : Integer;


    DisplayDLL        : String;

    IsLinux           : Boolean;

    procedure ReadMandanten (App : String);
    procedure SaveMandanten (App : String);
    function GetMandant (Name : String; var Daten : MandantRec):Boolean;
    function OpenMandant(NewMandant, App : String; save : boolean) : boolean;
    procedure NewMandant (Daten : MandantRec);
    procedure DeleteMandant (Name : String);
    procedure InitMandantAfterOpen;

    function UpdateDatabase (Data : tJvStrHolder; var Warnings, Errors : Integer): boolean;

    function GetDBUserRechte (AktUser : Boolean; User,Secret : String): tSDBUserRechte;

    function BucheKasse (Datum      : tDateTime;
                         Quelle     : Integer;
                         Journal_ID : Integer;
                         BelNum     : String;
                         GKonto     : Integer;
                         Skonto     : Double;
                         Betrag     : Double;
                         Text       : String):Boolean;

    // Liefert True zurück, wenn die Bankverbindung ok ist
    Function  CheckBankverbindung (addr_id:integer) : boolean;

    // Liefert die Bankverbindung zurück, wenn ok
    Function  GetBankverbindung (addr_id:integer; Var BLZ : Integer; var KTO : String) : boolean; // True wenn ok

    function  GetLieferant (addr_id:integer; var Info : String) : boolean; // True wenn ok

    function IncNummer (Quelle : Integer) : Int64;
    function IncNummerStr (Quelle : Integer) :String;

    // Funktionen für SQL-Registery
    procedure WriteString     (Key, Name, Value : String);
    function  ReadString      (Key, Name, Default : String):String;
    procedure WriteBoolean    (Key, Name : String; Value : Boolean);
    function  ReadBoolean     (Key, Name : String; Default : Boolean):Boolean;
    procedure WriteInteger    (Key, Name : String; Value : Integer);
    function  ReadInteger     (Key, Name : String; Default : Integer):Integer;
    procedure WriteDouble     (Key, Name : String; Value : Double);
    function  ReadDouble      (Key, Name : String; Default : Double):Double;
    function  ReadLongString  (Key, Name, Default : String):String;
    procedure WriteLongString (Key, Name, Value : String);

    // USER-SETTINGS
    procedure WriteStringU     (Key, Name, Value : String);
    function  ReadStringU      (Key, Name, Default : String):String;
    procedure WriteBooleanU    (Key, Name : String; Value : Boolean);
    function  ReadBooleanU     (Key, Name : String; Default : Boolean):Boolean;
    procedure WriteIntegerU    (Key, Name : String; Value : Integer);
    function  ReadIntegerU     (Key, Name : String; Default : Integer):Integer;
    procedure WriteDoubleU     (Key, Name : String; Value : Double);
    function  ReadDoubleU      (Key, Name : String; Default : Double):Double;
    function  ReadLongStringU  (Key, Name, Default : String):String;
    procedure WriteLongStringU (Key, Name, Value : String);

    // Funktionen zum lesen und wiederherstellen von Tabellenlayouts (tDBGrid)
    function  ReadLayout (Key, Name : String; var Data : tStream; Version : Integer = 0) : Boolean;
    procedure WriteLayout (Key, Name : String; Data : tStream; Version : Integer = 0);

    procedure GridLoadLayout(var Grid : tDBGrid; Sec : String; Version : Integer = 0);
    procedure GridSaveLayout(Grid : tDBGrid; Sec : String; Version : Integer = 0);

    // Diverse funktionen zum verbuchen von Rechnungen etc.
    function Buche_Rechnung (Journal_ID : Integer):Integer; // liefert Rechnungnummer zurück
    function Buche_Einkauf (Journal_ID : Integer):Integer; // liefert Belegnummer zurück
    function Buche_Lieferschein (Journal_ID : Integer;
                                 Teillief : Boolean;
                                 var LieferscheinID : Integer):Integer; // liefert Belegnummer zurück
    function Buche_Angebot (Journal_ID : Integer):Integer; // liefert AGB-Nummer zurück

    function Buche_EKBest (Journal_ID : Integer):Integer; // liefert EK-BST-Nummer zurück

    // Diverse Funktionen zum Stornieren von Vorgängen
    function Storno_Einkauf (Journal_ID : Integer):Boolean; // True, Wenn OK
    function Storno_Lieferschein (Journal_ID : Integer):Boolean; // True, Wenn OK

    // Export-Funktionen
    procedure ExportDatasetToStream(Stream: TStream; Dataset : TDataset; Delimiter : String; Spaltennamen : Boolean = True; TextInHochKomma : Boolean = True; DosZeichenSatz : Boolean = False);
    procedure ExportDatasetToFile (FileName: String; Dataset : TDataset; Delimiter : String; Append : Boolean; Spaltennamen : Boolean = True; TextInHochKomma : Boolean = True; DosZeichenSatz : Boolean = False);

    function GetSearchSQL (Felder : array of String; Suchbegriff : String) : String;

    function GetVertreterProv (ID : Integer) : Double;

    //--------------------
    function GetArtikelPreis (ArtikelID, KunID, PE : Integer;
                              Brutto : Boolean;
                              Menge : Double;
                              var Preis : Double) : Boolean;

    // Rechnet beliebige Währung in Leitwährung um
    function CalcLeitWaehrung (Betrag : Double; Waehrung : String) : Double;

    // Kopiert Belege
    function CopyRechnung (Journal_ID, Dest :Integer) : Integer;  // Liefert Rec-ID zurück

    function GetWGRDefaultKonten (WGR : Integer; var EKTO, AKTO : Integer) : Boolean;
    function CalcRabGrpPreis (RGID:String; PR_Ebene : Integer; var Preis : Double):Boolean;

    function UpdateArtikelEdiMenge (JournalTyp, ArtikelID : Integer; MengeDiff:Double) : Boolean;
    procedure UpdateArtikelPreis (RechTyp, Artikel_ID, Addr_ID : Integer; Preis : Double);

    function GetWGRCalcFaktor (Wgr, PreisID : Integer; var Faktor : Double) : Boolean;

end;

  function GetProjectVersion:string;

var
  DM1: TDM1;

implementation

{$R *.frm}

uses
  inifiles, FileCtrl, cao_progress, CAO_SearchClass,
  CAO_Link, Variants;

// aktuell verwendete Datenbank-Version (Struktur/Intern) = 1.09
// wird mit der Version in der SQL-Registry verglichen
// und das öffnen einer DB mit zu großer DB-Version (Programm älter als DB)
// abgebrochen
const DBVersion_Soll = 109;
      MyKey = 'n6G5dr9HSxW04F53';
//      MyKey = 'ĢĕŕšēŧŁşĜŒďũƀųŇæĦ';

  { TDM1 }

//------------------------------------------------------------------------------
function GetProjectVersion:string;
var Null,InfoSize,FixInfo:DWord; PFixInfo:PVSFixedFileInfo; Zeiger:Pointer;
begin
     result:='??';
     Null:=0;
     InfoSize:=GetFileVersionInfoSize(PChar(application.exename),Null);
     if InfoSize > 0 then
     begin
        Zeiger:=GetMemory(InfoSize);
        try
          if assigned(Zeiger) then
          begin
             GetFileVersionInfo(PChar(application.exename),Null,InfoSize,Zeiger);
             if VerQueryValue(Zeiger,'\',Pointer(PFixInfo),FixInfo) then
             begin
                result:=Format('%d.%d.%d.%d',
                               [HiWord(PFixInfo^.dwFileVersionMS),
                                LoWord(PFixInfo^.dwFileVersionMS),
                                HiWord(PFixInfo^.dwFileVersionLS),
                                LoWord(PFixInfo^.dwFileVersionLS)]);
             end;
          end;
        finally
           FreeMemory(Zeiger);
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TDM1.DataModuleCreate(Sender: TObject);
var P         : PChar;
    Size      : DWord;
    S         : String;
    I         : Integer;
begin
  InNewNummer     :=False;
  SQLLog          :=True;

  IsLinux         :=False;

  if ParamCount>0 then
  begin
    for i :=0 to ParamCount do
    begin
      S :=Uppercase(ParamStr(I));
      if (length(S)>0) and (S[1]='/') then delete (S,1,1);
      if (length(S)>0) and (S[1]='-') then delete (S,1,1);

      if S='LINUX' then IsLinux :=True;
    end;
  end;

  DB1.Connected   :=False;
  DB1.Database    :='';
  DB1.HostName    :='';
  DB1.User        :='';
  DB1.Password    :='';
  DB1.LoginPrompt :=False;

  {$IFDEF CPU64}
  DB1.LibraryLocation:='C:\Windows\SysWOW64\libmariadb.dll';
  {$ELSE}
//  DB1.LibraryLocation:='C:\Windows\System32\libmariadb.dll';  // funktioniert komischerweise nur unter einer anderen Pfadangabe
  {$ENDIF}

  TermID      :=-1;
  AtrisEnable :=False;

  // Usernamen ermitteln
  size :=1024;
  P:=StrAlloc(size);
  windows.getusername (p,Size);
  ntuser :=p;
  strdispose (p);

  // Rechnernamen ermitteln
  size :=1024;
  p :=StrAlloc (Size);
  windows.getcomputername (P,Size);
  comp :=p;
  strdispose (p);

  MainDir       :=ExtractFilePath (Paramstr(0));
  LogDir        :=MainDir+'LOG\';   ForceDirectories (LogDir);
  AnzPreis      :=5; //default = VK5
  USE_KFZ       :=False;
  DefMwSt       :=16; // in %
  DefMwStCD     :=2;
  DefSpracheID  :=2; // Deutsch
  DefSprachCode :='de';
  LastVertrID   :=-1;
  LastVertrProz :=0;
  AktMandant    :='';
  MandantOK     :=False;

  WgrFaktorCache.Wgr :=-1; // Cache ungültig

  SetLength(MandantTab,0);
  ReadMandanten (application.name);
end;
//------------------------------------------------------------------------------
procedure TDM1.DataModuleDestroy(Sender: TObject);
begin
  SetLength(MandantTab,0);
end;
//------------------------------------------------------------------------------
procedure TDM1.FirBankTabBeforePost(DataSet: TDataSet);
begin
  FirBankTabmainkey.Value :='MAIN\FIRMENKONTEN';
end;
//------------------------------------------------------------------------------
procedure TDM1.FirmaTabCalcFields(DataSet: TDataSet);
begin
     FirmaTabUSER_AKT.AsString     :=View_User;
     FirmaTabLEITWAEHRUNG.AsString :=Leitwaehrung;
     FirmaTabMANDANT_NAME.AsString :=AktMandant;
end;
//------------------------------------------------------------------------------
procedure TDM1.JourTabCalcFields(DataSet: TDataSet);
begin
     JourTabIST_SKONTO_BETR.Value :=JourTabBSumme.Value - JourTabIST_Betrag.Value;
end;
//------------------------------------------------------------------------------
procedure TDM1.KGRTabBeforePost(DataSet: TDataSet);
begin
  if KGRTabMainKey.Value='' then KGRTabMainKey.Value :='MAIN\ADDR_HIR';
end;
//------------------------------------------------------------------------------
procedure TDM1.LandTabCalcFields(DataSet: TDataSet);
begin
  if Uppercase(LandTabID.AsString)='DE' then LandTabPOST_CODE.AsString :='D'
  else if Uppercase(LandTabID.AsString)='IT' then LandTabPOST_CODE.AsString :='I'
  else if Uppercase(LandTabID.AsString)='AT' then LandTabPOST_CODE.AsString :='A'
  else if Uppercase(LandTabID.AsString)='BE' then LandTabPOST_CODE.AsString :='B'
  else if Uppercase(LandTabID.AsString)='FR' then LandTabPOST_CODE.AsString :='F'
  else if Uppercase(LandTabID.AsString)='FI' then LandTabPOST_CODE.AsString :='SF'
  else if Uppercase(LandTabID.AsString)='HU' then LandTabPOST_CODE.AsString :='H'
  else if Uppercase(LandTabID.AsString)='LU' then LandTabPOST_CODE.AsString :='L'
  else if Uppercase(LandTabID.AsString)='MT' then LandTabPOST_CODE.AsString :='M'
  else if Uppercase(LandTabID.AsString)='NO' then LandTabPOST_CODE.AsString :='N'
  else if Uppercase(LandTabID.AsString)='PT' then LandTabPOST_CODE.AsString :='P'
  else if Uppercase(LandTabID.AsString)='ES' then LandTabPOST_CODE.AsString :='E'
  else if Uppercase(LandTabID.AsString)='SE' then LandTabPOST_CODE.AsString :='S'
  else if Uppercase(LandTabID.AsString)='IT' then LandTabPOST_CODE.AsString :='I'
  else if Uppercase(LandTabID.AsString)='GB' then LandTabPOST_CODE.AsString :='UK'
  else if Uppercase(LandTabID.AsString)='US' then LandTabPOST_CODE.AsString :='USA'
  else LandTabPOST_CODE.AsString :=LandTabID.AsString;
end;
//------------------------------------------------------------------------------
procedure TDM1.NummerTabNewRecord(DataSet: TDataSet);
begin
  // Neuanlage abbrechen, es sei denn die Neuanlage wird von
  // GetNummer aufgerufen, GetNummer setzt dann die Variable
  // InNewNummer auf True
  if not InNewNummer then Abort;
end;
//------------------------------------------------------------------------------
procedure TDM1.ShopOrderStatusTabBeforePost(DataSet: TDataSet);
begin
  if ShopOrderStatusTabMainKey.Value=''
   then ShopOrderStatusTabMainKey.Value :='SHOP\ORDERSTATUS';
end;
//------------------------------------------------------------------------------
procedure TDM1.Transact1AfterBatchExec(Sender: TObject);
begin
  ProgressForm.UpdateScreen;
end;
//------------------------------------------------------------------------------
procedure TDM1.WgrTabBeforePost(DataSet: TDataSet);
begin
  //if WGRTabMainKey.Value='' then WGRTabMainKey.Value :='MAIN\ART_HIR';
end;
//------------------------------------------------------------------------------
procedure TDM1.ZBatchSql1AfterExecute(DataSet: TDataSet);
begin
  ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure TDM1.ZBatchSql1BeforeExecute(DataSet: TDataSet);
begin
  ProgressForm.Start;
end;
//------------------------------------------------------------------------------
// Öffnet einen bestehenden Mandanten, wenn dieser nicht existiert wird versucht
// die DB und die Tabellen anzulegen, dabei werden die akt. Benutzerrechte
// geprüft und bei zu wenigen Rechten abgebrochen.
// Weiterhin wird die Version der Tabellenstruktur geprüft und ggf. aktualisiert.
// auch hierbei werden die Benutzerrrechte gecheckt.
// bei einer zu neuen Tabellenversion wird das öffnen des Mandanten abgebrochen.
//------------------------------------------------------------------------------
function TDM1.OpenMandant(NewMandant, App : String; save : boolean) : boolean;
var Mandant : MandantRec;
    IniName : String;
    MyIni   : tIniFile;
    NewDB   : Boolean;
    I       : Integer;
    DSTab   : Array of Boolean;
    V       : Double;
    S       : String;
    Warn    : Integer;
    Error   : Integer;
    ConOK,
    DBOK    : Boolean;
    Res     : tSDBUserRechte;
    ST      : tDateTime;


    procedure MsgNoSQLRights;
    begin
       MessageDlg
         ('Sie verfügen über zu wenige Benutzerrechte auf dem MySQL-Server'+#13#10+
          'um die Tabellenstruktur für den akt. Mandanten zu aktualisieren.'+#13#10+
          'Sie benötigen mind. folgende Rechte :'+#13#10+
          'SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER und INDEX'+#13#13+
          'Bitte loggen Sie sich mit genügend Rechten erneut ein.',mterror,[mbok],0);
    end;

    function ReadString (Key, Name, Default : String):String;
    begin
       if not DB1.Connected then exit;

       UniQuery.Close;
       UniQuery.Sql.Text :='select * from REGISTERY '+
                           'where MAINKEY=:KEY and NAME=:NAME';
       UniQuery.ParamByName('KEY').AsString :=Key;
       UniQuery.ParamByName('NAME').AsString :=Name;
       UniQuery.Open;
       if UniQuery.RecordCount>0
         then Result :=UniQuery.FieldByName('VAL_CHAR').AsString
         else Result :=Default;
       UniQuery.Close;
    end;

begin
     Result :=False;
     NewDB  :=False;
     if GetMandant (NewMandant,Mandant) then
     begin
          // offene Datasets merken
          SetLength(DSTab,Transact1.DataSetCount);
          for i:=0 to Transact1.DatasetCount-1
           do DSTab[i] :=tDataset(Transact1.Datasets[i]).Active;

          DB1.Disconnect;

          {$IFDEF AVE}
          if (Assigned(SSHForm))and(SSHForm.EndeBtn.Enabled) then
          begin
             SSHForm.Show;
             SSHForm.Logout;
             ST :=Now();
             repeat
                Application.ProcessMessages;
             until (SSHForm.EndeBtn.Enabled=False)or
                   (Now>ST+ (1/24/60/60) * 30); // max. 30 Sek.
          end;
          {$ENDIF}


          GetMandant (NewMandant,Mandant);

          DB1.HostName :=Mandant.Server;
          DB1.User     :=Mandant.User;
          DB1.Password :=Mandant.Pass;
          DB1.Database :=Mandant.DB;

          {$IFDEF AVE}
          if Mandant.UseSSH then
          begin
             if not Assigned(SSHForm) then SSHForm :=tSSHForm.Create(Self);
             SSHForm.Show;
             SSHForm.StartBtnClick (Self);
             ST :=Now();
             repeat
                Application.ProcessMessages;
             until ((SSHForm.StartBtn.Enabled=False)and
                   (Now>ST+ (1/24/60/60) * 15))or
                   (Now>ST+ (1/24/60/60) * 60); // max. 30 Sek.
          end;
          {$ENDIF}


          //NEU
          DB1.Port     :=Mandant.Port;
          if Mandant.UseNTUserName then DB1.User :=User;
          DB1.LoginPrompt :=Mandant.ShowLoginDlg;

          ConOK :=False; DBOK :=False;
          try
             DB1.Connect;

             if DB1.LoginPrompt then User :=DB1.User else User :=NTUser;

             ConOK :=True;
             DBOK  :=True;

             {$IFDEF AVE}
             if (Assigned(SSHForm)) then SSHForm.Hide;
             {$ENDIF}

          except
             on E: Exception do
             begin
               if (Pos('UNBEKANNTE DATENBANK',Uppercase(E.Message))>0)or
                  (Pos('UNKNOWN DATABASE',Uppercase(E.Message))>0) then
               begin
                 if MessageDlg ('Die Datenbank scheint noch nicht zu '+
                                'existieren.'+#13#10+
                                'Wollen Sie die Datenbank erstellen ?',
                                mtconfirmation,[mbyes,mbno],0)=mryes then
                 begin
                   try
                     DB1.Database:='mysql';                            // An der 'mysql' Datenbank temporär anmelden
                                                                       // ansonsten ist ein Anlegen einer neuen DB nicht möglich ;)
                     UniQuery.SQL.Text:='CREATE DATABASE '+Mandant.DB; // DB anlegen
                     UniQuery.ExecSQL;
                     DB1.Disconnect;

                     DB1.Database:=Mandant.DB;
                     DBOK :=True;
                     DB1.Connect;
                     NewDB :=True; ConOK :=True;
                   except
                     //MessageDlg ('Fehler beim erzeugen der Datenbank !',
                     //            mterror,[mbok],0);
                   end;
                 end
                 else exit;
               end
                  else
               begin
                  MessageDlg ('Fehler beim verbinden zum MySQL-Server.'+
                              #13#10#13#10+
                              'Meldung :'+#13#10+E.Message,mterror,[mbok],0);
                  exit;
               end;
             end;
          end;

          if not DBOK then
          begin
             MessageDlg ('Die Datenbank für diesen Mandant konnte nicht '+
                         'erstellt werden !'+#13#10+
                         'Bitte prüfen Sie die Einstellungen und ob Sie über '+
                         'ausreichende Rechte'+#13#10+
                         'zum erstellen einer DB auf diesem Server verfügen.',
                         mterror,[mbok],0);
             exit;
          end;

          if not ConOK then
          begin
             MessageDlg ('Der gewünschte Mandant konnte nicht geöffnet werden !'+#13#10+
                         'Überprüfen Sie die Verbindung zum Server, Benutzernamen'+#13#10+
                         'und Paßwort.',mterror,[mbok],0);
             exit;
          end;

          if not NewDB then
          begin
               // prüfen, ob Tabellen vorhanden sind, wenn nicht, dann neu erzeugen
               try
                  uniquery.close;
                  uniquery.sql.text :='SHOW TABLES';
                  uniquery.open;
                  NewDB :=(UniQuery.RecordCount=0)or
                          (
                           (UniQuery.RecordCount=1)and
                           (UniQuery.FieldByName('Tables_in_'+DB1.Database).AsString='UCHECK')
                          );
               except

               end;
               Uniquery.Close;
          end;


          try
             if NewDB then // neue DB wurde erstellt
             begin
                Res :=GetDBUserRechte (True, '', '');
                if (urSelect in Res) and (urInsert in Res) and
                   (urUpdate in Res) and (urDelete in Res) and
                   (urCreate in Res) and (urAlter  in Res) and
                   (urDrop   in Res) and (urIndex  in Res) then
                begin
                  // User hat die benötigten Rechte ! Jetzt Tabellen anlegen ...

                  if not UpdateDatabase (CreateMandantStr, Warn, Error)//CreateMandantSql
                   then MessageDlg ('Fehler beim erstellen der Tabellen !',
                                    mterror,[mbok],0);
                end
                   else
                begin
                   MessageDlg
                     ('Sie verfügen über zu wenige Benutzerrechte auf '+
                      'dem MySQL-Server'+#13#10+
                      'um die Tabellenstruktur für einen neuen Mandant (DB) '+
                      'zu erzeugen.'+#13#10+
                      'Sie benötigen mind. folgende Rechte :'+#13#10+
                      'SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, '+
                      'ALTER und INDEX'+#13#13+
                      'Bitte loggen Sie sich mit genügend Rechten erneut ein.',
                      mterror,[mbok],0);

                   DB1.Disconnect;
                   exit;
                end;
             end;
          except
             MessageDlg ('Fehler beim erstellen der Tabellen !',mterror,[mbok],0);
             exit;
          end;

          try
             if NewDB then   // wenn neue Tabellen angelegt, dann evt. Formulare importieren ...
              if (fileexists (extractfilepath(paramstr(0))+'formulare.cao'))and
                 (MessageDlg ('Sollen die Standardformulare installiert werden ?',
                              mtconfirmation,mbyesnocancel,0)=mryes) then
              begin
                 ZBatchSQL1.SQL.LoadFromFile (extractfilepath(paramstr(0))+'formulare.cao');
                 ProgressForm.Init ('Formulare installieren ...');
                 ZBatchSQL1.ExecSql;
                 ProgressForm.Stop;
              end;
          except
             MessageDlg ('Fehler beim anlegen der Formulare !',mterror,[mbok],0);
          end;
          ProgressForm.Stop;


          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');

             if DefaultFormatSettings.DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DefaultFormatSettings.DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S))));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 0.00 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 0.00 auf Version 1.00)',
                         mtinformation,[mbok],0);


             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DbUpdTo1_0, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.00 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;
          end;

          // DB Update-Check für Tabellenstruktur Version 1.01
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S))));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 1.00 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.00 auf Version 1.01)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_01, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.01 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;
          end;

          // DB Update-Check für Tabellenstruktur Version 1.02
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 101 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.01 auf Version 1.02)',
                         mtinformation,[mbok],0);


             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_02, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.02 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;
          end;


          // DB Update-Check für Tabellenstruktur Version 1.03
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 102 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.02 auf Version 1.03)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_03, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.03 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Update-Check für Tabellenstruktur Version 1.04
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 103 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.03 auf Version 1.04)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_04, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.04 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;


          // DB Update-Check für Tabellenstruktur Version 1.05
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 104 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.04 auf Version 1.05)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_05, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.05 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Update-Check für Tabellenstruktur Version 1.06
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 105 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.05 auf Version 1.06)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_06, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.06 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Update-Check für Tabellenstruktur Version 1.07
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 106 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.06 auf Version 1.07)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_07, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.07 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Update-Check für Tabellenstruktur Version 1.08
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 107 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.07 auf Version 1.08)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_08, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.08 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Update-Check für Tabellenstruktur Version 1.09
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V = 108 then
          begin
             MessageDlg ('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                         'und wird deshalb nun aktualisiert (Version 1.08 auf Version 1.09)',
                         mtinformation,[mbok],0);

             Res :=GetDBUserRechte (True, '', '');
             if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
                (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
                (urDrop   in Res) and (urIndex  in Res) then
             begin
               // User hat die benötigten Rechte !
               if not UpdateDataBase (DBUpdTo1_09, Warn, Error)
                then MessageDlg ('Fehler beim Update der Tabellenstruktur auf Version 1.09 !',
                                 mterror,[mbok],0);
             end
                else
             begin
                MsgNoSQLRights;
                DB1.Disconnect;
                exit;
             end;

          end;

          // DB Tabellenstruktur zu neu für das Programm ???
          try
             S :=ReadString ('MAIN','DB_VERSION','0.00');
             if DecimalSeparator<>'.' then
               while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
             {$IFDEF WIN64}
             V :=Double(StrToFloat(FormatFloat('0.00',StrToFloat(S)*100)));
             {$ELSE}
             V :=StrToFloat(FormatFloat('0.00',StrToFloat(S)*100));
             {$ENDIF}
          except
             V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

             MessageDlg ('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                         'Der ausgewählte Mandant wurde nicht geöffnet.',mterror,[mbok],0);
             DB1.Disconnect;
             exit;
          end;
          if V=Double(DBVersion_Soll) then
          begin

            for i:=0 to Transact1.DatasetCount-1 do
             if DSTab[i] then tDataset(Transact1.Datasets[i]).Active :=True;

            setlength(DSTab,0);

            AktMandant :=NewMandant;

            Result :=True;

            if Save then
            begin
               ininame :=extractfilepath(paramstr(0))+'FakturaOS_DB.CFG';
               MyIni :=tIniFile.Create (IniName);
               try
                  MyIni.WriteString ('MANDANTEN',APP,AktMandant);
               finally
                  MyIni.Free;
               end;
            end;

            MandantOK  :=True;
          end
             else
          begin
            if V>Double(DBVersion_Soll) then
            begin
              MessageDlg ('Der aktuelle Mandant hat eine neuere DB-Version'+#13#10+
                          'und kann mit dieser Programmversion nicht geöffnet werden.'+#13#10+
                          'Bitte aktualisieren Sie das Programm ...',mterror,[mbok],0);

              DB1.Disconnect;
              Result :=False;
            end;
          end;

     end else
     begin
       // Mandantendaten konnten aus der INI nicht gelesen werden.

       Result :=False;

       MessageDlg ('Die Einstellungen für den aktuellen Mandanten'+#13#10+
                   'konnten aus der Datei "FakturaOS_DB.CFG" nicht gelesen werden.'+#13#10+
                   'Bitte prüfen Sie die Einstellungen.',mterror,[mbok],0);
     end;
end;
//------------------------------------------------------------------------------
function tDM1.GetMandant (Name : String; var Daten : MandantRec):Boolean;
var po : integer;
begin
     Result :=False;
     name :=uppercase(name);
     if length(MandantTab)>0 then
     for po:=0 to length(mandanttab)-1 do
     begin
          if uppercase(mandanttab[po].name) = name then
          begin
               Daten :=mandanttab[po];
               Result :=True;
               Break;
          end;
     end;
end;
//------------------------------------------------------------------------------
procedure tDM1.NewMandant (Daten : MandantRec);
var I : Integer;
begin
     I :=length (MandantTab);
     SetLength(MandantTab,I+1);
     MandantTab[i] :=Daten;
     SaveMandanten (extractfilepath(paramstr(0))+'FakturaOS_DB.CFG');
end;
//------------------------------------------------------------------------------
procedure tDM1.ReadMandanten (App : String);
var ininame     : string;
    ini         : tinifile;
    po,idx,i    : integer;
    S,S1,PW,PWC : String;

begin
     ininame :=extractfilepath(paramstr(0))+'FakturaOS_DB.CFG';
     if not FileExists(ininame) then exit;

     ini :=tinifile.create (ininame);
     try
        po :=1;
        while (po<101)and
              (ini.readstring('MANDANTEN',
                              'M'+formatfloat ('000',po),
                              '@ERROR@')<>'@ERROR@') do
        begin
           idx :=length(MandantTab);
           setlength (MandantTab,idx+1);

           MandantTab[Idx].Name          :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po),'');
           MandantTab[Idx].Server        :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po)+'_SERVER','');
           MandantTab[Idx].User          :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po)+'_USER','');
           PW                            :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po)+'_PASS','');
           PWC                           :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po)+'_PASS_C','');
           DCP_md5_1.Init;
           DCP_3des1.InitStr(MyKey,TDCP_md5);
           if (length(PW)>0) then
           begin
              PWC :=DCP_3des1.EncryptString(PW);
              DCP_3des1.Reset;
              if length(PWC)>0 then
              begin
                 S1 :='';
                 For I:=1 to length(PWC) do S1 :=S1+IntToHex(Ord(PWC[i]),2);
                 ini.writestring ('MANDANTEN','M'+formatfloat ('000',po)+'_PASS_C',S1);
                 ini.writestring ('MANDANTEN','M'+formatfloat ('000',po)+'_PASS','');
              end;
           end
              else
           begin
             if length(PWC)>=2 then
             begin
               try
                  S1 :='';
                  for i:=1 to length(PWC) div 2
                   do S1 :=S1+CHR(StrToInt('$'+Copy(PWC,(I-1)*2+1,2)));
                  PW :=DCP_3des1.DecryptString(S1);
                  DCP_3des1.Reset;
               except
                  PW :='';
               end;
             end;
           end;


           MandantTab[Idx].Pass          :=PW;


           MandantTab[Idx].DB            :=ini.readstring ('MANDANTEN','M'+formatfloat ('000',po)+'_DB','');
           //NEU
           MandantTab[Idx].Port          :=ini.readinteger('MANDANTEN','M'+formatfloat ('000',po)+'_PORT',3306);
           MandantTab[Idx].ShowLoginDlg  :=ini.ReadBool   ('MANDANTEN','M'+formatfloat ('000',po)+'_SHOW_LOGINDIALOG',False);
           MandantTab[Idx].UseNTUserName :=ini.ReadBool   ('MANDANTEN','M'+formatfloat ('000',po)+'_USE_NTUSERNAME',False);

           {$IFDEF AVE}
           MandantTab[Idx].UseSsh        :=ini.ReadBool   ('MANDANTEN','M'+formatfloat ('000',po)+'_USE_SSH',False);
           {$ENDIF}

           inc(po);
        end;

        AktMandant :=Ini.ReadString ('MANDANTEN',APP,'');
        if (AktMandant='')and(idx>0) then AktMandant :=MandantTab[0].Name;


        //PLZ- und BLZ-Verion lesen
        S :=Ini.ReadString ('VERSION','PLZ','1.06');
        if DecimalSeparator<>'.'
         then while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
        PLZ_VERSION :=CAO_Round(StrToFloat(S)*100);

        S :=Ini.ReadString ('VERSION','BLZ','1.06');
        if DecimalSeparator<>'.'
         then while (Pos('.',S)>0) do S[Pos('.',S)] :=DecimalSeparator;
        BLZ_VERSION :=CAO_round(StrToFloat(S)*100);

        //Kassen-Display DLL-Name ermitteln

        DisplayDLL :=Ini.ReadString ('DISPLAY','DLL_NAME','');
     finally
        ini.free;
     end;
end;
//------------------------------------------------------------------------------
// Sollte nach dem Öffnen eines neuen Mandanten aufgerufen werden
//------------------------------------------------------------------------------
procedure TDM1.InitMandantAfterOpen;
var S : String; ini : tinifile; i,v : Integer;
begin
     try
        // Bug im Create-Script der DB-Version 1.09
        // Das Feld NO_RABATT_FLAG wurde nicht angelegt
        //Von Volker ins Create-Script eingetragen und hier ausgeklammert und kann gelöscht werden

//        Uniquery.Close;
//        Uniquery.Sql.Text :='show fields from JOURNALPOS';
//        UniQuery.Open;
//        if not UniQuery.Locate ('Field','NO_RABATT_FLAG',[]) then
//        begin
//           UniQuery.Close;
//           Uniquery.Sql.Text :='ALTER TABLE JOURNALPOS '+
//                               'ADD NO_RABATT_FLAG ENUM("N","Y") DEFAULT "N" '+
//                               'NOT NULL AFTER BRUTTO_FLAG';
//           Uniquery.ExecSql;

//        end else UniQuery.Close;

        // Ende Bugfix



        WhrungTab.Open;
        LandTab.Open;
        LiefArtTab.Open;
        ZahlArtTab.Open;
        ShopOrderStatusTab.Open;
        VertreterTab.Open;

        SprachTab.Open;

        if SprachTab.RecordCount>0 then
        begin
           DefSpracheID  :=SprachTab.FieldByName('SPRACH_ID').AsInteger;
           DefSprachCode :=SprachTab.FieldByName('CODE').AsString;
        end;

        // PLZ installieren
        try
          // Alte Version einlesen
          V :=DM1.ReadInteger ('MAIN','PLZ_VERSION',106);

          uniquery.Close;
          uniquery.sql.text :='select count(*) as ANZ from PLZ';
          uniquery.Open;
          if (uniquery.recordcount=1)and
             (
              (uniquery.fieldbyname('ANZ').asInteger<10) or
              (PLZ_VERSION > V)
             )and
             (fileexists (extractfilepath(paramstr(0))+'plz.cao')) then
          begin
             ProgressForm.Init ('PLZ importieren...');
             uniquery.close;
             uniquery.sql.text :='delete from PLZ';
             uniquery.execsql;
             ZBatchSql1.Sql.LoadFromFile (extractfilepath(paramstr(0))+'plz.cao');
             try
                SQLLog :=False;
                Screen.Cursor :=crSqlWait;
                ZBatchSql1.ExecSql;
             finally
                SQLLog :=True;
                Screen.Cursor :=crDefault;
             end;
             DM1.WriteInteger ('MAIN','PLZ_VERSION',PLZ_VERSION);
          end;
          uniquery.close;
        except
        end;
        ProgressForm.Stop;

        // BLZ installieren
        try
          // Alte Version einlesen
          V :=DM1.ReadInteger ('MAIN','BLZ_VERSION',106);

          uniquery.Close;
          uniquery.sql.text :='select count(*) as ANZ from BLZ';
          uniquery.Open;
          if (uniquery.recordcount=1)and
             (
              (uniquery.fieldbyname('ANZ').asInteger<10) or
              (BLZ_VERSION > V)
             ) and
             (fileexists (extractfilepath(paramstr(0))+'blz.cao')) then
          begin
             ProgressForm.Init ('BLZ importieren...');
             uniquery.close;
             uniquery.sql.text :='delete from BLZ';
             uniquery.execsql;
             ZBatchSql1.Sql.LoadFromFile (extractfilepath(paramstr(0))+'blz.cao');
             try
                SQLLog :=False;
                Screen.Cursor :=crSqlWait;
                ZBatchSql1.ExecSql;
             finally
                SQLLog :=True;
                Screen.Cursor :=crDefault;
             end;
             DM1.WriteInteger ('MAIN','BLZ_VERSION',BLZ_VERSION);
          end;
          uniquery.close;
        except
        end;
        ProgressForm.Stop;

        // Länder installieren
        try
          uniquery.Close;
          uniquery.sql.text :='select count(*) as ANZ from LAND';
          uniquery.Open;
          if (uniquery.recordcount=1)and
             (uniquery.fieldbyname('ANZ').asInteger<20)and
             (fileexists (extractfilepath(paramstr(0))+'land.cao')) then
          begin
             ProgressForm.Init ('Länder importieren...');
             ZBatchSql1.Sql.LoadFromFile (extractfilepath(paramstr(0))+'land.cao');
             if uniquery.fieldbyname('ANZ').asInteger>0
              then ZBatchSql1.Sql.Insert (0,'delete from LAND;');
             ZBatchSql1.ExecSql;
          end;
          uniquery.close;
        except
        end;
        ProgressForm.Stop;

        LeitWaehrung :=ReadString ('MAIN','LEITWAEHRUNG','@@');
        if LeitWaehrung='@@' then
        begin
           LeitWaehrung :='€';
           WriteString ('MAIN','LEITWAEHRUNG','€');
        end;

        LandK2 :=ReadString ('MAIN','LAND','DE');

        AnzPreis :=ReadInteger ('MAIN\ARTIKEL','ANZPREIS',-1);
        if AnzPreis=-1 then
        begin
           WriteInteger ('MAIN\ARTIKEL','ANZPREIS',5);
           AnzPreis :=5;
        end;

        // Globale MWST-Tabelle
        MWSTTab[0] :=ReadDouble  ('MAIN\MWST','0',0);
        MWSTTab[1] :=ReadDouble  ('MAIN\MWST','1',7);
        MWSTTab[2] :=ReadDouble  ('MAIN\MWST','2',16);
        MWSTTab[3] :=ReadDouble  ('MAIN\MWST','3',0);

        // Default-Steuer und Code laden
        I :=ReadInteger ('MAIN\MWST','DEFAULT',2);
        if (i<0)or(i>3) then I :=2;
        DefMwStCD  :=I;
        DefMwSt    :=MWSTTab[I];

        // Globale Kalkulationsfaktoren
        for i:=1 to 5 do
        begin
           GCalcFaktorTab[i] :=
            ReadDouble ('MAIN\ARTIKEL','VK'+IntToStr(i)+'_CALC_FAKTOR',0)
        end;

        // Shop-Calc-Faktor
        GCalcFaktorTab[6] :=ReadDouble ('MAIN\ARTIKEL','SHOP_CALC_FAKTOR',0);


        // Brutto-Rundungswert für Artikel
        BR_RUND_WERT     :=ReadInteger ('MAIN\ARTIKEL', 'BRUTTO_RUNDUNG_WERT',0);
        if BR_RUND_WERT<1 then BR_RUND_WERT :=1; //mind 1 cent

        // Brutto-Summen-Rundungswert für Belege
        BR_SUM_RUND_WERT :=ReadInteger ('MAIN\BELEGE', 'BRUTTO_RUNDUNG_WERT',0);
        if BR_SUM_RUND_WERT<1 then
        begin
           BR_SUM_RUND_WERT :=1; //mind 1 cent
           DM1.WriteInteger ('MAIN\BELEGE','BRUTTO_RUNDUNG_WERT',BR_SUM_RUND_WERT);
        end;


        i :=ReadInteger ('MAIN','USE_KFZ',-1);
        if i=-1 then
        begin
           i:=0;
           WriteInteger ('MAIN','USE_KFZ',0);
        end;

        Use_KFZ := i=1;

        if USE_KFZ then
        begin
           S :=ReadString ('MAIN\KFZ','ATRIS_PFAD','@@@');
           if S='@@@' then WriteString ('MAIN\KFZ','ATRIS_PFAD','');

           if (length(S)>0)and(S<>'@@@')and(DirectoryExists(S)) then
           begin
             if (length(s)>0)and(s[length(s)]<>'\') then s:=s+'\';
             AtrisPfad :=S;
             AtrisEnable :=True;
           end
              else
           begin
             ini :=tinifile.create ('atris_st.ini');
             try
                s :=ini.ReadString ('INTERFACE','BESTINFO32','');
             finally
                ini.free;
             end;
             if length(s)>0 then
             begin
                s :=extractfilepath (s);
                if (length(s)>0)and(s[length(s)]<>'\') then s:=s+'\';
                if DirectoryExists(S) then
                begin
                   AtrisPfad :=s;
                   AtrisEnable :=True;
                end;
             end;
           end;
        end;

        // Default-Sprache laden
        DM1.SprachTab.Open;
        if DM1.SprachTab.RecordCount>0 then
        begin
           DefSpracheID  :=SprachTab.FieldByName('SPRACH_ID').AsInteger;
           DefSprachCode :=SprachTab.FieldByName('CODE').AsString;
        end;


        // User initialisieren

        UniQuery.Close;
        UniQuery.Sql.Text :='select * from MITARBEITER '+
                            'where UPPER(LOGIN_NAME)=UPPER("'+User+'")';
//        UniQuery.ReadOnly :=false;
        UniQuery.Open;

        if (UniQuery.RecordCount=1) then
        begin
           // Benutzer existiert
           View_User :=UniQuery.FieldByName('ANZEIGE_NAME').AsString;
           UserID    :=UniQuery.FieldByName('MA_ID').AsInteger;
        end
           else
        begin
           // Neuen Benutzer anlegen
           UniQuery.Append;
           try
             UniQuery.FieldByName('LOGIN_NAME').AsString   :=User;
             UniQuery.FieldByName('ANZEIGE_NAME').AsString :=User;
             UniQuery.Post;

             UserID :=UniQuery.FieldByName('MA_ID').AsInteger;
           except
             UniQuery.Cancel;
             UserID :=-1;
             View_User :=User;
           end;
        end;
        UniQuery.Close;
//        UniQuery.ReadOnly :=true;

        // Pfade laden
        BackupDir :=ReadString ('MAIN\PFADE','BACKUP_DIR',MainDir+'BACKUP\');
        TmpDir    :=ReadString ('MAIN\PFADE','TMP_DIR',MainDir+'TMP\');
        DTADir    :=ReadString ('MAIN\PFADE','DTA_DIR',MainDir+'DTA\');
        ExportDir :=ReadString ('MAIN\PFADE','EXPORT_DIR',MainDir+'EXPORT\');
        ImportDir :=ReadString ('MAIN\PFADE','IMPORT_DIR',MainDir+'IMPORT\');

        if (length (BackupDir)>0) and (Backupdir[length(BackupDir)]<>'\')
         then BackupDir :=BackupDir + '\';
        if (length (TmpDir)>0) and (TmpDir[length(TmpDir)]<>'\')
         then TmpDir :=TmpDir + '\';
        if (length (DTADir)>0) and (DTADir[length(DTADir)]<>'\')
         then DTADir :=DTADir + '\';
        if (length (ExportDir)>0) and (ExportDir[length(ExportDir)]<>'\')
         then ExportDir :=ExportDir + '\';
        if (length (ImportDir)>0) and (ImportDir[length(ImportDir)]<>'\')
         then ImportDir :=ImportDir + '\';

        // wenn Pfad nicht existiert dann anlegen
        try ForceDirectories (BackupDir); except end;
        try ForceDirectories (TmpDir);    except end;
        try ForceDirectories (DTADir);    except end;
        try ForceDirectories (ExportDir); except end;
        try ForceDirectories (ImportDir); except end;
     except
        MessageDlg ('Beim öffnen der Tabellen ist ein Fehler aufgetreten !',mterror,[mbok],0);
     end;
end;
//------------------------------------------------------------------------------
// prüft mittels TryAndError die DB-Rechte des Benutzers ...
// zurückgeliefert wird ein Set der Rechte
// wenn es dumm läuft und der User zwar CREATE-Rechte hat, aber keine DROP-Rechte,
// dann bleibt die Tabelle UTEST als Leiche zurück
//------------------------------------------------------------------------------
function TDM1.GetDBUserRechte (AktUser : Boolean; User,Secret : String): tSDBUserRechte;
var LastUser, LastUserSecret : String; Error : Boolean; S : String;
begin
     Result :=[];
     Error  :=False;
     if AktUser=False then
     begin
        // akt. User sichern
        LastUser       :=DB1.User;
        LastUserSecret :=DB1.Password;

        DB1.Disconnect;
        DB1.User     :=User;
        DB1.Password :=Secret;

        try
           DB1.Connect;
        except
           Error :=True;
        end;
     end;

     if not Error then
     begin
          // jetzt Rechte prüfen

          UniQuery.Close;
          UniQuery.Sql.Text :='DROP TABLE IF EXISTS UCHECK ';
          try
             UniQuery.ExecSql;
          except

          end;
          UniQuery.Close;


          UniQuery.Sql.Text :='CREATE TABLE UCHECK (SPALTE1 VARCHAR(10) '+
                              'NOT NULL, PRIMARY KEY(SPALTE1))';
          try
             UniQuery.ExecSql;
             include (Result,urCreate);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='ALTER TABLE UCHECK CHANGE SPALTE1 SPALTE1 '+
                              'INT(10) DEFAULT "1" NOT NULL';
          try
             UniQuery.ExecSql;
             include (Result,urAlter);
          except

          end;
          UniQuery.Close;


          UniQuery.Sql.Text :='CREATE INDEX TEST ON UCHECK (SPALTE1)';
          try
             UniQuery.ExecSql;
             include (Result,urIndex);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='INSERT INTO UCHECK (SPALTE1) VALUES (5)';
          try
             UniQuery.ExecSql;
             include (Result,urInsert);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='UPDATE UCHECK SET SPALTE1=6 WHERE SPALTE1=5';
          try
             UniQuery.ExecSql;
             include (Result,urUpdate);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='SELECT SPALTE1 FROM UCHECK WHERE SPALTE1=6';
          try
             UniQuery.Open;
             if (UniQuery.Active)and
                (UniQuery.RecordCount=1)
              then include (Result,urSelect);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='DELETE FROM UCHECK WHERE SPALTE1=6';
          try
             UniQuery.ExecSql;
             include (Result,urDelete);
          except

          end;
          UniQuery.Close;

          UniQuery.Sql.Text :='DROP TABLE UCHECK';
          try
             UniQuery.ExecSql;
             include (Result,urDrop);
          except

          end;
          UniQuery.Close;
     end;

     if AktUser=False then
     begin
        DB1.Disconnect;
        DB1.User     :=LastUser;
        DB1.Password :=LastUserSecret;

        try
           DB1.Connect;
        except
           Error :=True;
        end;
     end;

     { // nur zu Testzwecken
     S :='';
     if urSelect in Result then S :=S+'SELECT : JA'+#13 else S :=S+'SELECT : NEIN'+#13;
     if urInsert in Result then S :=S+'INSERT : JA'+#13 else S :=S+'INSERT : NEIN'+#13;
     if urUpdate in Result then S :=S+'UPDATE : JA'+#13 else S :=S+'UPDATE : NEIN'+#13;
     if urDelete in Result then S :=S+'DELETE : JA'+#13 else S :=S+'DELETE : NEIN'+#13;
     if urCreate in Result then S :=S+'CREATE : JA'+#13 else S :=S+'CREATE : NEIN'+#13;
     if urAlter  in Result then S :=S+'ALTER : JA'+#13 else S :=S+'ALTER : NEIN'+#13;
     if urDrop   in Result then S :=S+'DROP : JA'+#13 else S :=S+'DROP : NEIN'+#13;
     //if urIndex  in Result then S :=S+'INDEX : JA'+#13 else S :=S+'INDEX : NEIN'+#13;


     //MessageDlg ('Userrechte :'+#13#10+S,mtinformation, [mbok],0);

     if (urSelect in Result)and
        (urInsert in Result)and
        (urUpdate in Result)and
        (urDelete in Result)and
        (urCreate in Result)and
        (urAlter in Result)and
        (urDrop in Result) then
     begin
       MessageDlg ('Benutzer darf Update ausführen !',mtinformation,[mbok],0);
     end; }
end;
//------------------------------------------------------------------------------
procedure tDM1.DeleteMandant (Name : String);
var I,J : Integer;
begin
     if length (MandantTab)=0 then exit;
     for I :=0 to length (MandantTab)-1 do
     begin
        if MandantTab[i].Name=Name then
        begin
          if I< length(MandantTab)-1 then
          begin
             For J :=I+1 to length(MandantTab)-1 do
             begin
               MandantTab[J-1] :=MandantTab[j];
             end;
          end;
          SetLength(MandantTab,length(MandantTab)-1);
        end;
     end;
     SaveMandanten (extractfilepath(paramstr(0))+'FakturaOS_DB.CFG');
end;
//------------------------------------------------------------------------------
procedure tDM1.SaveMandanten (App : String);
var ininame   : string;
    ini       : tinifile;
    idx,i     : integer;
    S1,PW,PWC : String;

begin
     if length(MandantTab)=0 then exit;

     ininame :=extractfilepath(paramstr(0))+'FakturaOS_DB.CFG';
     ini :=tinifile.create (ininame);
     try
        ini.EraseSection ('MANDANTEN');

        for Idx :=0 to length(MandantTab)-1 do
        begin
           ini.Writestring ('MANDANTEN','M'+formatfloat ('000',Idx+1),MandantTab[Idx].Name);
           ini.Writestring ('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_SERVER',MandantTab[Idx].Server);
           ini.Writestring ('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_USER',MandantTab[Idx].User);
           PW :=MandantTab[Idx].Pass;
           DCP_md5_1.Init;
           DCP_3des1.InitStr(MyKey,TDCP_md5);
           if (length(PW)>0) then
           begin
              PWC:=DCP_3des1.EncryptString(PW);
              DCP_3des1.Reset;
              if length(PWC)>0 then
              begin
                 S1 :='';
                 For I:=1 to length(PWC) do S1 :=S1+IntToHex(Ord(PWC[i]),2);
                 ini.writestring ('MANDANTEN','M'+formatfloat ('000',IDX+1)+'_PASS_C',S1);
                 ini.writestring ('MANDANTEN','M'+formatfloat ('000',IDX+1)+'_PASS','');
              end;
           end;

           ini.Writestring ('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_DB',MandantTab[Idx].DB);
           //NEU
           ini.Writeinteger('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_PORT',MandantTab[Idx].Port);
           ini.WriteBool   ('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_SHOW_LOGINDIALOG',False);
           ini.WriteBool   ('MANDANTEN','M'+formatfloat ('000',Idx+1)+'_USE_NTUSERNAME',False);
        end;
     finally
        ini.free;
     end;
end;
//------------------------------------------------------------------------------
function TDM1.UpdateDatabase (Data : tJvStrHolder; var Warnings, Errors : Integer): boolean;
var Idx : Integer;
    S,S1,S2 : String;
begin
     Warnings :=0;
     Errors :=0;
     try
       UniQuery.Close;
       UniQuery.Sql.Clear;
       S2 :='';

       For idx :=0 to Data.Strings.Count-1 do
       begin
            s :=Data.Strings[idx];
            S1 :=s;
            while (length(S1)>0)and(S1[length(S1)]=' ') do delete (S1,length(S1),1);
            if (pos(';',s1)>0)and(pos(';',s1)=length(s1)) then
            begin
                 delete (s,length(s1),1);
                 if length(S)>0 then S2 :=S2+S;
                 try
                    if (length(S)>0)and(S[1]=';') then  delete (s,1,1);
                    UniQuery.Sql.Text :=S2;
                    UniQuery.ExecSql;
                 except
                    inc(Warnings);
                 end;

                 UniQuery.Close;
                 UniQuery.Sql.Clear;
                 S2 :='';
            end
            else if length(S)>0 then S2 :=S2+S;
       end;
       Result :=True;
     except
       inc(Errors);
       Result :=False;
       UniQuery.Close;
       UniQuery.Sql.Clear;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadInteger (Key, Name : String; Default : Integer):Integer;
begin
     if not DB1.Connected then exit;

//     RegTab.ReadOnly :=True;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if RegTab.RecordCount>0 then Result :=RegTabVal_Int.AsInteger
                               else Result :=Default;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadIntegerU (Key, Name : String; Default : Integer):Integer;
begin
     Result :=0;
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     Result :=ReadInteger (Key,Name,Default);
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteInteger (Key, Name : String; Value : Integer);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value :=Key;
           RegTabName.Value :=Name;
           RegTabVal_Int.AsInteger :=Value;
           RegTabVal_Typ.AsInteger :=3;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           RegTabVal_Int.AsInteger :=Value;
           RegTabVal_Typ.AsInteger :=3;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteIntegerU (Key, Name : String; Value : Integer);
begin
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     WriteInteger (Key, Name, Value);
end;
//------------------------------------------------------------------------------
function tDM1.ReadBoolean (Key, Name : String; Default : Boolean):Boolean;
begin
     if not DB1.Connected then exit;

//     RegTab.ReadOnly :=true;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if RegTab.RecordCount>0 then Result :=RegTabVal_Int.AsInteger=1
                               else Result :=Default;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadBooleanU (Key, Name : String; Default : Boolean):Boolean;
begin
     Result :=False;
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     Result :=ReadBoolean (Key, Name, Default);
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteBoolean (Key, Name : String; Value : Boolean);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value :=Key;
           RegTabName.Value :=Name;
           RegTabVal_Int.AsInteger :=ord(Value);
           RegTabVal_Typ.AsInteger :=3;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           RegTabVal_Int.AsInteger :=ord(Value);
           RegTabVal_Typ.AsInteger :=3;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteBooleanU (Key, Name : String; Value : Boolean);
begin
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     WriteBoolean (Key, Name, Value);
end;
//------------------------------------------------------------------------------
function tDM1.ReadString (Key, Name, Default : String):String;
begin
     if not DB1.Connected then exit;

//     RegTab.ReadOnly :=true;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if RegTab.RecordCount>0 then Result :=RegTabVal_Char.AsString
                               else Result :=Default;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadStringU (Key, Name, Default : String):String;
begin
     Result :='';
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     Result :=ReadString (Key,Name, Default);
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteString (Key, Name, Value : String);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value :=Key;
           RegTabName.Value :=Name;
           RegTabVal_Char.AsString :=Value;
           RegTabVal_Typ.AsInteger :=1;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           RegTabVal_Char.AsString :=Value;
           RegTabVal_Typ.AsInteger :=1;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteStringU (Key, Name, Value : String);
begin
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     WriteString (Key, Name, Value);
end;
//------------------------------------------------------------------------------
function tDM1.ReadLongString (Key, Name, Default : String):String;
begin
     if not DB1.Connected then exit;

//     RegTab.ReadOnly :=true;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if RegTab.RecordCount>0 then Result :=RegTabVal_Blob.AsString
                               else Result :=Default;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadLongStringU (Key, Name, Default : String):String;
begin
     Result :='';
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     Result :=ReadLongString (Key,Name, Default);
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteLongString (Key, Name, Value : String);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value :=Key;
           RegTabName.Value :=Name;
           RegTabVal_Blob.AsString :=Value;
           RegTabVal_Typ.AsInteger :=5;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           RegTabVal_Blob.AsString :=Value;
           RegTabVal_Typ.AsInteger :=5;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteLongStringU (Key, Name, Value : String);
begin
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     WriteLongString (Key,Name, Value);
end;
//------------------------------------------------------------------------------
function tDM1.ReadDouble (Key, Name : String; Default : Double):Double;
begin
     if not DB1.Connected then exit;


//     RegTab.ReadOnly :=true;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if RegTab.RecordCount>0 then Result :=RegTabVal_Double.AsFloat
                               else Result :=Default;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.ReadDoubleU (Key, Name : String; Default : Double):Double;
begin
     Result :=0;
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     Result :=ReadDouble (Key, Name, Default);
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteDouble (Key, Name : String; Value : Double);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value :=Key;
           RegTabName.Value :=Name;
           RegTabVal_Double.AsFloat :=Value;
           RegTabVal_Typ.AsInteger :=4;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           RegTabVal_Double.AsFloat :=Value;
           RegTabVal_Typ.AsInteger :=4;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteDoubleU (Key, Name : String; Value : Double);
begin
     if length (Key)>0 then Key :='USERSETTINGS\'+USER+'\'+KEY
                       else Key :='USERSETTINGS\'+USER;
     WriteDouble (Key, Name, Value);
end;
//------------------------------------------------------------------------------
function tDM1.ReadLayout (Key, Name : String; var Data : tStream; Version : Integer = 0) : Boolean;
begin
     if not DB1.Connected then exit;

     Result :=False;

//     RegTab.ReadOnly :=true;
     try
       RegTab.Close;
       RegTab.ParamByName('KEY').AsString :=Key;
       RegTab.ParamByName('NAME').AsString :=Name;
       RegTab.Open;
       if (RegTab.RecordCount>0) and
          (not RegTabVal_Bin.IsNull) then
       begin
            Data.Size :=0;
            Data.Position :=0;
            RegTabVal_Bin.SaveToStream (Data);
            Data.Position :=0;
            Result  :=RegTabVal_Int.AsInteger=Version;
       end;
       RegTab.Close;
     finally
//       RegTab.ReadOnly :=false;
     end;
end;
//------------------------------------------------------------------------------
procedure tDM1.WriteLayout (Key, Name : String; Data : tStream; Version : Integer = 0);
begin
     if not DB1.Connected then exit;

     RegTab.Close;
     RegTab.ParamByName('KEY').AsString :=Key;
     RegTab.ParamByName('NAME').AsString :=Name;
     RegTab.Open;
     if RegTab.RecordCount=0 then
     begin
        RegTab.Append;
        try
           RegTabMainKey.Value    :=Key;
           RegTabName.Value       :=Name;
           RegTabVAL_TYP.Value    :=7;
           RegTabVal_Int.AsInteger :=Version;
           Data.Position :=0;
           RegTabVAL_BIN.LoadFromStream (Data);

           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end
        else
     begin
        RegTab.Edit;
        try
           Data.Position :=0;
           RegTabVAL_BIN.LoadFromStream (Data);
           RegTabVAL_TYP.Value :=7;
           RegTabVal_INT.AsInteger :=Version;
           RegTab.Post;
        except
           RegTab.Cancel;
        end;
     end;

     RegTab.Close;
end;
//------------------------------------------------------------------------------
procedure tDM1.GridSaveLayout(Grid : tDBGrid; Sec : String; Version : Integer=0);
var M : tMemoryStream;
begin
     m :=tmemorystream.create;
     try
        Grid.SaveToStream(M);
        WriteLayout ('USERSETTINGS\'+User+'\LAYOUT',SEC,M, Version);
     finally
      M.Free;
     end;
end;
//------------------------------------------------------------------------------
procedure TDM1.GridLoadLayout(var Grid : tDBGrid; Sec : String; Version : Integer=0);
var M : tMemoryStream; I : Integer; Found : Boolean;
begin
     M :=tMemoryStream.Create;
     try
       try
        if ReadLayout ('USERSETTINGS\'+User+'\LAYOUT',SEC,tStream(M),Version) then
          Grid.LoadFromStream (M);
        {
        if Grid.Columns.Count>0 then
        begin
          repeat
            Found :=False;
            for i:=0 to Grid.Columns.Count-1 do
            begin
              if not assigned(Grid.Columns[i].Field) then
              begin
                Grid.Columns[i].Free;
                Found :=True;
                Break;
              end;
            end;
          until not Found;
        end;
        }
       except end;
     finally
       M.Free;
     end;
end;
//------------------------------------------------------------------------------
procedure TDM1.ExportDatasetToFile (FileName: String;
                                    Dataset : TDataset;
                                    Delimiter : String;
                                    Append : Boolean;
                                    Spaltennamen : Boolean = True;
                                    TextInHochKomma : Boolean = True;
                                    DosZeichenSatz : Boolean = False);
var St : tFileStream; M : Word;
begin
     //Append :=True;
     // 1. Datei erzeugen wenn sie nicht existiert
     if ((fileexists (FileName))and(not Append))or
        (not fileexists (FileName))
      then FileClose(FileCreate(FileName));

     if Append then M :=fmOpenReadWrite else M :=fmOpenWrite;
     M :=M or fmShareDenyWrite;

     St :=tFileStream.Create (FileName, M);
     if Append then ST.Position :=ST.Size;
     try
        ExportDatasetToStream (St,
                               Dataset,
                               Delimiter,
                               Spaltennamen,
                               TextInHochKomma,
                               DosZeichenSatz);
     finally
        St.Free;
     end;
end;
//------------------------------------------------------------------------------
procedure TDM1.ExportDatasetToStream(Stream: TStream;
                                     Dataset : TDataset;
                                     Delimiter : String;
                                     Spaltennamen : Boolean = True;
                                     TextInHochKomma : Boolean = True;
                                     DosZeichenSatz : Boolean = False);
var
  I, J      : Integer;
  Buffer,S  : string;
  FieldDesc : tField;
  OldC      : tCursor;
begin
   OldC :=Screen.Cursor;
   Screen.Cursor :=crSqlWait;
   try
     with Dataset do
     begin
       // Feldnamen als Überschrift ausgeben !!
       if (Fields.Count > 0)and(Stream.Position=0)and(Spaltennamen) then
       begin
        Buffer := '';
        for J := 0 to FieldCount-1 do
        begin
          if J > 0 then Buffer := Buffer + Delimiter;
          Buffer := Buffer + Fields[J].FieldName;
        end;

        if DosZeichenSatz then CharToOEM(PChar(Buffer), @Buffer[1]);

        Stream.Write(PChar(Buffer)^, Length(Buffer));
      end;
      First;
      while not EOF do
      begin
        Buffer := #13#10;
        for J := 0 to Fields.Count-1 do
        begin
          FieldDesc := Fields[J];
          if J > 0 then Buffer := Buffer + Delimiter;
          if not (FieldDesc.DataType in [ftInteger, ftSmallInt, ftFloat,
                                         ftAutoInc, ftCurrency, ftLargeInt,
                                         ftBCD])
            and not FieldDesc.IsNull then
          begin
            S :=FieldDesc.AsString;

 //           if TextInHochKomma
 //             then Buffer :=Buffer +
 //                           AnsiQuotedStr(Uniquery.StringToSql(S),'"')
 //             else Buffer :=Buffer +
 //                           Uniquery.StringToSql(S);
          end
          else Buffer := Buffer + FieldDesc.AsString;
        end;
        if DosZeichenSatz then CharToOEM(PChar(Buffer), @Buffer[1]);
        Stream.Write(PChar(Buffer)^, Length(Buffer));
        inc(i);
        Next;
      end;
     end;
   finally
     Screen.Cursor :=oldC;
   end;
end;
//------------------------------------------------------------------------------
function TDM1.IncNummerStr (Quelle : Integer) :String;
var Max : Integer; Num : Int64; Format : String;
begin
     if (Quelle>10)and(Quelle<20) then Quelle :=10;
     NummerTab.Close;
     NummerTab.Sql.Clear;
     NummerTab.Sql.Add('select VAL_INT as QUELLE, VAL_CHAR as FORMAT,');
     NummerTab.Sql.Add('VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, MAINKEY, NAME');
     NummerTab.Sql.Add('from REGISTERY');
     NummerTab.Sql.Add('where MAINKEY="MAIN\\NUMBERS"');
     NummerTab.Sql.Add('and VAL_INT=:ID');

     NummerTab.ParamByName ('ID').Value :=Quelle;
     NummerTab.Open;
     if NummerTab.RecordCount>0 then
     begin
       Num :=NummerTabNext_Num.AsLargeInt;
       NummerTab.Edit;
       try
          Max    :=NummerTabMaxLen.AsInteger;
          Format :=NummerTabFormat.AsString;

          NummerTabNext_Num.AsLargeInt :=Num+1;

          if Length(IntToStr(Num))>Max then NummerTabNext_Num.AsLargeInt :=1;

          NummerTab.Post;
       except
          NummerTab.Cancel;
       end;
     end
        else
     begin
       // Nummer existiert nicht
       Format :='000000';
       Num    :=1;
       Max    :=6;

       InNewNummer :=True;
       try
         NummerTab.Append;
         try
            NummerTabQUELLE.Value     :=Quelle;
            NummerTabNEXT_NUM.Value   :=1;
            NummerTabFORMAT.Value     :=Format;
            NummerTabMainKey.Value    :='MAIN\NUMBERS';
            NummerTabMAXLEN.AsInteger :=Max;
            NummerTabNAME.AsString    :=IntToStr(QUELLE);
            NummerTab.Post;
         except
            NummerTab.Cancel;
         end;
       finally
          InNewNummer :=False;
       end;
     end;
     NummerTab.Close;

     Result :=FormatFloat (Format,Num);
end;
//------------------------------------------------------------------------------
function TDM1.IncNummer (Quelle : Integer) :Int64;
var F : Integer;
begin
     if (Quelle>10)and(Quelle<20) then Quelle :=10;
     NummerTab.Close;
     NummerTab.Sql.Clear;
     NummerTab.Sql.Add('select VAL_INT as QUELLE, VAL_CHAR as FORMAT,');
     NummerTab.Sql.Add('VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, MAINKEY, NAME');
     NummerTab.Sql.Add('from REGISTERY');
     NummerTab.Sql.Add('where MAINKEY="MAIN\\NUMBERS"');
     NummerTab.Sql.Add('and VAL_INT=:ID');

     NummerTab.ParamByName ('ID').Value :=Quelle;
     NummerTab.Open;
     if NummerTab.RecordCount>0 then
     begin
       Result :=NummerTabNext_Num.AsLargeInt;
       NummerTab.Edit;
       try
          F :=Length(NummerTabFormat.AsString);
          NummerTabNext_Num.AsLargeInt :=NummerTabNext_Num.AsLargeInt+1;

          if length(NummerTabNext_Num.AsString)>F
           then NummerTabNext_Num.AsLargeInt :=1;

          NummerTab.Post;
       except
          NummerTab.Cancel;
       end;
     end
        else
     begin
       // Nummer existiert nicht
       InNewNummer :=True;
       try
         NummerTab.Append;
         try
             NummerTabQUELLE.Value     :=Quelle;
             NummerTabNEXT_NUM.Value   :=1;
             NummerTabFORMAT.Value     :='000000';
             NummerTabMainKey.Value    :='MAIN\NUMBERS';
             NummerTabMAXLEN.AsInteger :=6;
             NummerTabNAME.AsString    :=IntToStr(QUELLE);
             NummerTab.Post;
             Result :=1;
         except
            NummerTab.Cancel;
         end;
       finally
          InNewNummer :=False;
       end;
     end;
     NummerTab.Close;
end;
//------------------------------------------------------------------------------
function TDM1.GetSearchSQL (Felder : array of String; Suchbegriff : String) : String;
var
  Stk          : TaaStringStack;
  Parser       : TaaSearchParser;
  RPNNode      : TaaRPNNode;
  Word1        : string;
  Word2        : string;
  SQL, SQL2, S : String;
  I, P         : Integer;

begin
  Stk := nil;
  Parser := nil;
  try
    Stk := TaaStringStack.Create;
    Parser := TaaSearchParser.Create(Suchbegriff);
    RPNNode := Parser.RPN;
    while (RPNNode <> nil) do
    begin
      if (RPNNode is TaaRPNWord) then
        Stk.Push('(@@@FN@@@ like ''%' + TaaRPNWord(RPNNode).PhraseWord + '%'')')
      else if (RPNNode is TaaRPN_AND) then
      begin
        Word2 := Stk.Pop;
        Word1 := Stk.Pop;
        Stk.Push('(' + Word1 + ' and ' + Word2 + ')');
      end
      else if (RPNNode is TaaRPN_OR) then
      begin
        Word2 := Stk.Pop;
        Word1 := Stk.Pop;
        Stk.Push('(' + Word1 + ' or ' + Word2 + ')');
      end
        else
      begin
        Word1 := Stk.Pop;
        Stk.Push('(not ' + Word1 + ')');
      end;
      RPNNode := RPNNode.Next;
    end;

    SQL :='';
    SQL2 :=Stk.Pop; // in SQL2 steht jetzt der SQL-Befehl mit dem Feldplatzhalter

    // Feldnamen einfügen
    if Length(Felder)> 0 then // Alle Felder durchlaufen
    begin
      For i:=0 to length(Felder)-1 do
      begin
         S :=SQL2;
         while Pos('@@@FN@@@',S)>0 do // Platzhalter gefunden
         begin
            P :=Pos('@@@FN@@@',S);
            Delete (S,P,8);           // Platzhalter löschen
            insert (Felder[i],S,P);   // und durch Feldnamen ersetzen
         end;

         // wenn in mehreren Feldern gesucht wird dan die einzelnen Suchen
         // mit oder verknüpfen
         if length(SQL)>0 then SQL :=SQL + ' or ';
         SQL :=SQL+'('+S+')';
      end;
    end;
    Result :=SQL; // SQL-String zurückgeben
  finally
    Stk.Free;
    Parser.Free;
  end;
end;
//------------------------------------------------------------------------------
function tDM1.CalcLeitWaehrung (Betrag : Double; Waehrung : String) : Double;
var Kurs : Double;
begin
     if Waehrung=Leitwaehrung then
     begin
        Result :=Betrag;
        exit;
     end;
     if CacheLastWaehrung<>Waehrung then
     begin
       Kurs :=ReadDouble ('MAIN\WAEHRUNG',Waehrung,1);
       CacheLastKurs     :=Kurs;
       CacheLastWaehrung :=Waehrung;
     end else Kurs :=CacheLastKurs;

     if Kurs=0
      then Result :=0
      else Result :=(CAO_Round(Betrag / Kurs * 100))/100;
end;
//------------------------------------------------------------------------------
function TDM1.GetWGRDefaultKonten (WGR : Integer; var EKTO, AKTO : Integer) : Boolean;
begin
     Result :=False;
     if not WGRTab.Active then WGRTab.Open;

     if WGRTab.Locate ('ID',WGR,[]) then
     begin
        if WgrTabDEF_AKTO.AsInteger > 0 then AKTO :=WgrTabDEF_AKTO.AsInteger;
        if WGRTabDEF_EKTO.AsInteger > 0 then EKTO :=WGRTabDEF_EKTO.AsInteger;
        Result :=True;
     end;
end;
//------------------------------------------------------------------------------
function TDM1.CalcRabGrpPreis (RGID:String; PR_Ebene : Integer; var Preis : Double):Boolean;
begin
     Result :=False;
     if (RGID='-')or(length(RGID)=0)or
        (PR_Ebene<0)or(PR_EBENE>4)or
        (PR_EBENE>=ANZPREIS) then exit;

     if Preis=0 then begin Result :=True; exit; end;

     if PR_Ebene=0 then  //EK-Preis
     begin
       if not LiefRabGrp.Active then LiefRabGrp.Open;

       if (LiefRabGrp.RecordCount=0) then exit;
       if (LiefRabGrpRABGRP_ID.AsString=RGID)or
          (LiefRabGrp.Locate ('RABGRP_ID',RGID,[loCaseInsensitive])) then
       begin
         if (LiefRabGrpRABGRP_ID.Value=RGID) then
         begin
           Preis :=Preis - (Preis / 100 * LiefRabGrpRABATT1.AsFloat);
           Preis :=Preis - (Preis / 100 * LiefRabGrpRABATT2.AsFloat);
           Preis :=Preis - (Preis / 100 * LiefRabGrpRABATT3.AsFloat);

           // auf 3 Nachkommastellen runden
           Preis :=CAO_round(Preis*1000)/1000;

           Result :=True;
         end;
       end;
     end
        else
     begin
       if not KunRabGrp.Active then KunRabGrp.Open;

       if (KunRabGrp.RecordCount=0) then exit;
       if //KunRabGrpRABGRP_ID.AsString=RGID)or
          (KunRabGrp.Locate ('RABGRP_ID,LIEF_RABGRP',
                              VarArrayOf([RGID,PR_Ebene]),
                              [loCaseInsensitive])) then
       begin
         if (KunRabGrpRABGRP_ID.Value=RGID) and
            (KunRabGrpLIEF_RABGRP.AsInteger=PR_Ebene) then
         begin
           Preis :=Preis - (Preis / 100 * KunRabGrpRABATT1.AsFloat);
           Preis :=Preis - (Preis / 100 * KunRabGrpRABATT2.AsFloat);
           Preis :=Preis - (Preis / 100 * KunRabGrpRABATT3.AsFloat);

           // auf 2 Nachkommastellen runden
           Preis :=CAO_round(Preis*100)/100;

           Result :=True;
         end;
       end;
     end;
end;
//------------------------------------------------------------------------------
Function tDM1.GetLieferant (addr_id:integer; Var Info : String) : boolean; // True wenn ok
var S : String;
begin
     if Addr_id<1 then begin Info :='???'; exit; end;

     KunTab.Close;
     KunTab.ParamByName ('ID').AsInteger :=addr_id;
     KunTab.Open;
     if not KunTab.Eof then
     begin
        S:=KunTabNAME1.AsString;
        if length (KunTabNAME2.AsString)>0 then
        begin
          if length(S)>0 then S :=S+', ';
          S :=S+KunTabNAME2.AsString;
        end;
        if length (KunTabNAME3.AsString)>0 then
        begin
          if length(S)>0 then S :=S+', ';
          S :=S+KunTabNAME3.AsString;
        end;

        if length (KunTabStrasse.AsString)>0 then
        begin
          if length(S)>0 then S :=S+', ';
          S :=S+KunTabStrasse.AsString;
        end;

        S :=S+', '+KunTabPlz.AsString+' '+KunTabOrt.AsString;

        Info :=S;
        Result :=True;
     end else
     begin
        Result :=False;
        S :='';
     end;
     KunTab.Close;
end;
//------------------------------------------------------------------------------
// Liefert True zurück wenn in der Warengruppe ein Kalkulationsfaktor festgelegt
// wurde
//------------------------------------------------------------------------------
function tDM1.GetWGRCalcFaktor (Wgr, PreisID : Integer; var Faktor : Double) : Boolean;
var I : Integer;
begin
     Result :=False;
     if (PreisID<1)or(PreisID>5) then exit; // VK geht nur von 1-5 !!!

     if WgrFaktorCache.Wgr=Wgr then
     begin
        Faktor :=WgrFaktorCache.FTab[PreisID];
     end
        else
     begin
       if not WgrTab.Active then WgrTab.Open;

       if (WgrTab.RecordCount>0)and
          (WgrTab.Locate ('ID',Wgr,[])) then
       begin
          for i:=1 to AnzPreis do
          begin
            WgrFaktorCache.FTab[i] :=WgrTab.FieldByName ('VK'+IntToStr(I)+'_FAKTOR').AsFloat;
          end;
          WgrFaktorCache.Wgr :=Wgr;
          Faktor :=WgrFaktorCache.FTab[PreisID];
       end
       else WgrFaktorCache.Wgr :=-1; // Cache ungültig da Wgr nicht gefunden

     end;
     Result :=Faktor <> 0;
end;
//------------------------------------------------------------------------------
function TDM1.UpdateArtikelEdiMenge (JournalTyp, ArtikelID : Integer;
                                     MengeDiff:Double) : Boolean;
var ANZ : Integer; ME : Double; EdiFeld : String;
begin
     Result :=False;

     if (not (JournalTyp in [VK_RECH_EDI, EK_RECH_EDI, EK_BEST_EDI])) or
        (ArtikelID<0) then exit;

     MengeDiff :=CAO_round(MengeDiff*100)/100;

     case JournalTyp of
          VK_RECH_EDI : EdiFeld :='MENGE_VKRE_EDI';
          EK_RECH_EDI : EdiFeld :='MENGE_EKRE_EDI';
          EK_BEST_EDI : EdiFeld :='MENGE_EKBEST_EDI';
     end;

     ANZ :=0;
     uniquery.close;

     ProgressForm.Init ('EDI-Mengen aktualisieren ...');
     ZBatchSQL1.Sql.Clear;
     uniquery.sql.clear;
     uniquery.sql.add ('SELECT ARTIKEL_ID, SUM(MENGE) as ME from JOURNALPOS');
     uniquery.sql.add ('WHERE QUELLE='+IntToStr(JournalTyp));
     uniquery.sql.add ('and ARTIKEL_ID='+IntToStr(ArtikelID));
     uniquery.sql.add ('GROUP BY ARTIKEL_ID');
     uniquery.Open;
     while not UniQuery.EOF do
     begin
        if (UniQuery.FieldByName('ARTIKEL_ID').AsInteger>0) then
        begin
           ME :=UniQuery.FieldByName('ME').AsFloat-MengeDiff;
           ZBatchSQL1.Sql.Add ('UPDATE ARTIKEL SET ');
           ZBatchSQL1.Sql.Add (EdiFeld+'='+FloatToStrEx(ME));
           ZBatchSQL1.Sql.Add ('WHERE REC_ID='+IntToStr(UniQuery.FieldByName('ARTIKEL_ID').AsInteger)+';');
           inc (ANZ);
        end;
        uniquery.next;
     end;
     if ANZ>0 then ZBatchSql1.ExecSql;
     uniQuery.Close;
     Result :=True;
end;
//------------------------------------------------------------------------------
function tDM1.BucheKasse (Datum      : tDateTime;
                          Quelle     : Integer;
                          Journal_ID : Integer;
                          BelNum     : String;
                          GKonto     : Integer;
                          Skonto     : Double;
                          Betrag     : Double;
                          Text       : String):Boolean;

var Ja, Mo, Ta : Word;
begin
     DecodeDate (Datum, Ja, Mo, Ta);

     KasBuch.Close;
     KasBuch.ParamByName ('JAHR').Value :=Ja;
     KasBuch.Open;
     KasBuch.Append;

     try
        KasBuchJAHR.Value       :=Ja;
        KasBuchBDATUM.AsDateTime:=Datum;
        KasBuchQUELLE.Value     :=Quelle;
        KasBuchJOURNAL_ID.Value :=Journal_ID;
        KasBuchZU_ABGANG.Value  :=Betrag;
        KasBuchBTXT.AsString    :=Text;
        KasBuchBELEGNUM.Value   :=BelNum;
        KasBuchGKONTO.Value     :=GKonto;
        KasBuchSKONTO.Value     :=Skonto;

        KasBuch.Post;
        Result :=True;
     except
        KasBuch.Cancel;
        Result :=False;
     end;
     KasBuch.Close;
end;
//------------------------------------------------------------------------------
function tDM1.CopyRechnung (Journal_ID, Dest :Integer) : Integer;  // Liefert Rec-ID zurück
var id,i : integer;
    num  : integer;
    w    : string;
    N,M,m0,m1,m2,m3,B : Double;
    Summe, NSumme,MSumme,BSumme, Steuer, EK, Lohn, Ware, TKst : Double;
    T : Char;

begin
     Result :=-1;

     N :=0;
     M :=0; M0 :=0; M1 :=0; M2 :=0; M3 :=0;
     B :=0;
     Lohn :=0; Ware :=0; TKst :=0;

     CpySrcKopfTab.Close;
     CpySrcKopfTab.ParamByName ('ID').Value :=Journal_ID;
     CpySrcKopfTab.Open;

     if CpySrcKopfTab.RecordCount=0 then
     begin
        CpySrcKopfTab.Close;
        Exit;
     end;

     NUM :=IncNummer (Dest);

     CpyDstKopfTab.Open;
     CpyDstKopfTab.Append;

     w :=CpySrcKopfTabWAEHRUNG.Value;

     CpyDstKopfTabQUELLE.Value            :=Dest; //CpySrcKopfTabQUELLE.Value;
     CpyDstKopfTabQUELLE_SUB.Value        :=0;//CpySrcKopfTabQUELLE_SUB.Value;

     CpyDstKopfTabATRNUM.Value :=-1;
     CpyDstKopfTabLief_Addr_ID.Value :=CpySrcKopfTabLief_Addr_ID.Value;

     CpyDstKopfTabVRENUM.Value            :=num;
     CpyDstKopfTabVLSNUM.Value            :=-1;
     CpyDstKopfTabFOLGENR.Value           :=-1;
     CpyDstKopfTabKM_STAND.Value          :=-1;
     CpyDstKopfTabADATUM.AsInteger        :=0;
     CpyDstKopfTabRDATUM.AsDateTime       :=Now;

     if Dest<>EK_BEST_EDI then CpyDstKopfTabLDATUM.AsInteger :=0
                          else CpyDstKopfTabLDATUM.Value :=CpySrcKopfTabLDATUM.Value;

     CpyDstKopfTabTermin.AsInteger        :=0;

     CpyDstKopfTabKOST_NETTO.Value        :=Calcleitwaehrung(CpySrcKopfTabKOST_NETTO.AsFloat,w);
     CpyDstKopfTabWERT_NETTO.Value        :=CalcLeitWaehrung(CpySrcKopfTabWERT_NETTO.AsFloat,W);
     CpyDstKopfTabLOHN.Value              :=CalcLeitWaehrung(CpySrcKopfTabLOHN.AsFloat,W);
     CpyDstKopfTabWARE.Value              :=CalcLeitWaehrung(CpySrcKopfTabWARE.AsFloat,W);
     CpyDstKopfTabTKOST.Value             :=CalcLeitWaehrung(CpySrcKopfTabTKOST.AsFloat,W);

     CpyDstKopfTabADDR_ID.Value           :=CpySrcKopfTabADDR_ID.Value;
     CpyDstKopfTabKFZ_ID.Value            :=CpySrcKopfTabKFZ_ID.Value;
     CpyDstKopfTabVERTRETER_ID.Value      :=CpySrcKopfTabVERTRETER_ID.Value;
     CpyDstKopfTabGLOBRABATT.Value        :=CpySrcKopfTabGLOBRABATT.Value;

     CpyDstKopfTabPR_EBENE.Value          :=CpySrcKopfTabPR_EBENE.Value;
     CpyDstKopfTabLIEFART.Value           :=CpySrcKopfTabLIEFART.Value;
     CpyDstKopfTabZAHLART.Value           :=CpySrcKopfTabZAHLART.Value;




     CpyDstKopfTabMWST_0.Value            :=CpySrcKopfTabMWST_0.Value;
     CpyDstKopfTabMWST_1.Value            :=CpySrcKopfTabMWST_1.Value;
     CpyDstKopfTabMWST_2.Value            :=CpySrcKopfTabMWST_2.Value;
     CpyDstKopfTabMWST_3.Value            :=CpySrcKopfTabMWST_3.Value;
     CpyDstKopfTabMWST_FREI_FLAG.Value    :=CpySrcKopfTabMWST_FREI_FLAG.Value;

     CpyDstKopfTabNSUMME.Value            :=CalcLeitWaehrung(CpySrcKopfTabNSUMME.AsFloat,W);
     CpyDstKopfTabMSUMME_0.Value          :=CalcLeitWaehrung(CpySrcKopfTabMSUMME_0.AsFloat,W);
     CpyDstKopfTabMSUMME_1.Value          :=CalcLeitWaehrung(CpySrcKopfTabMSUMME_1.AsFloat,W);
     CpyDstKopfTabMSUMME_2.Value          :=CalcLeitWaehrung(CpySrcKopfTabMSUMME_2.AsFloat,W);
     CpyDstKopfTabMSUMME_3.Value          :=CalcLeitWaehrung(CpySrcKopfTabMSUMME_3.AsFloat,W);
     CpyDstKopfTabMSUMME.Value            :=CalcLeitWaehrung(CpySrcKopfTabMSUMME.AsFloat,W);
     CpyDstKopfTabBSUMME.Value            :=CalcLeitWaehrung(CpySrcKopfTabBSUMME.AsFloat,W);
     CpyDstKopfTabATSUMME.Value           :=CalcLeitWaehrung(CpySrcKopfTabATSUMME.AsFloat,W);
     CpyDstKopfTabATMSUMME.Value          :=CalcLeitWaehrung(CpySrcKopfTabATMSUMME.AsFloat,W);

     CpyDstKopfTabWAEHRUNG.Value          :=LeitWaehrung;//CpySrcKopfTabWAEHRUNG.Value;
     CpyDstKopfTabGEGENKONTO.Value        :=CpySrcKopfTabGEGENKONTO.Value;
     CpyDstKopfTabSOLL_STAGE.Value        :=CpySrcKopfTabSOLL_STAGE.Value;
     CpyDstKopfTabSOLL_SKONTO.Value       :=CpySrcKopfTabSOLL_SKONTO.Value;
     CpyDstKopfTabSOLL_NTAGE.Value        :=CpySrcKopfTabSOLL_NTAGE.Value;
     CpyDstKopfTabSOLL_RATEN.Value        :=CpySrcKopfTabSOLL_RATEN.Value;

     CpyDstKopfTabSOLL_RATBETR.Value      :=CalcLeitWaehrung(CpySrcKopfTabSOLL_RATBETR.AsFloat,W);

     CpyDstKopfTabSOLL_RATINTERVALL.Value :=CpySrcKopfTabSOLL_RATINTERVALL.Value;

     CpyDstKopfTabIST_ANZAHLUNG.Value     :=0;
     CpyDstKopfTabIST_ZAHLDAT.AsInteger   :=0;
     CpyDstKopfTabMAHNKOSTEN.Value        :=0;
     CpyDstKopfTabKONTOAUSZUG.Value       :=-1;
     CpyDstKopfTabBANK_ID.Value           :=-1;
     CpyDstKopfTabSTADIUM.Value           :=6;
     CpyDstKopfTabFREIGABE1_Flag.AsBoolean:=False;
     CpyDstKopfTabERSTELLT.AsDateTime     :=Now;
     CpyDstKopfTabERST_NAME.Value         :=View_User;
     CpyDstKopfTabKUN_NUM.Value           :=CpySrcKopfTabKUN_NUM.Value;
     CpyDstKopfTabKUN_ANREDE.Value        :=CpySrcKopfTabKUN_ANREDE.Value;
     CpyDstKopfTabKUN_NAME1.Value         :=CpySrcKopfTabKUN_NAME1.Value;
     CpyDstKopfTabKUN_NAME2.Value         :=CpySrcKopfTabKUN_NAME2.Value;
     CpyDstKopfTabKUN_NAME3.Value         :=CpySrcKopfTabKUN_NAME3.Value;
     CpyDstKopfTabKUN_ABTEILUNG.Value     :=CpySrcKopfTabKUN_ABTEILUNG.Value;
     CpyDstKopfTabKUN_STRASSE.Value       :=CpySrcKopfTabKUN_STRASSE.Value;
     CpyDstKopfTabKUN_LAND.Value          :=CpySrcKopfTabKUN_LAND.Value;
     CpyDstKopfTabKUN_PLZ.Value           :=CpySrcKopfTabKUN_PLZ.Value;
     CpyDstKopfTabKUN_ORT.Value           :=CpySrcKopfTabKUN_ORT.Value;
     CpyDstKopfTabUSR1.Value              :=CpySrcKopfTabUSR1.Value;
     CpyDstKopfTabUSR2.Value              :=CpySrcKopfTabUSR2.Value;
     CpyDstKopfTabPROJEKT.Value           :=CpySrcKopfTabPROJEKT.Value;
     CpyDstKopfTabORGNUM.Value            :=CpySrcKopfTabORGNUM.Value;
     CpyDstKopfTabBEST_NAME.Value         :=CpySrcKopfTabBEST_NAME.Value;
     CpyDstKopfTabBEST_CODE.Value         :=CpySrcKopfTabBEST_CODE.Value;
     CpyDstKopfTabINFO.AsString           :=CpySrcKopfTabINFO.AsString;
     CpyDstKopfTabBEST_DATUM.Value        :=CpySrcKopfTabBEST_DATUM.Value;
     CpyDstKopfTabPROVIS_WERT.Value       :=CpySrcKopfTabPROVIS_WERT.Value;

     CpyDstKopfTabPROVIS_WERT.Value       :=CpySrcKopfTabPROVIS_WERT.Value;
     CpyDstKopfTabBRUTTO_FLAG.AsBoolean   :=CpySrcKopfTabBRUTTO_FLAG.AsBoolean;

     CpyDstKopfTabGewicht.AsFloat         :=CpySrcKopfTabGewicht.AsFloat;
     CpyDstKopfTabRohgewinn.AsFloat       :=CpySrcKopfTabRohgewinn.AsFloat;

     CpyDstKopfTabUW_NUM.Value            :=-1;

     if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI])and(Dest=VK_RECH_EDI))or
        ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI])and(Dest=EK_BEST_EDI)) then
     begin
        CpyDstKopfTabKOST_NETTO.Value        :=0;
        CpyDstKopfTabWERT_NETTO.Value        :=0;
        CpyDstKopfTabLOHN.Value              :=0;
        CpyDstKopfTabWARE.Value              :=0;
        CpyDstKopfTabTKOST.Value             :=0;
        CpyDstKopfTabGLOBRABATT.Value        :=0;

        if Dest<>EK_BEST_EDI then
        begin
             CpyDstKopfTabPR_EBENE.Value     :=2;
        end
         else
        begin
             CpyDstKopfTabPR_EBENE.Value      :=0;
             CpyDstKopfTabKUN_NUM.Value       :='';
             CpyDstKopfTabKUN_ANREDE.Value    :='';
             CpyDstKopfTabKUN_NAME1.Value     :='';
             CpyDstKopfTabKUN_NAME2.Value     :='';
             CpyDstKopfTabKUN_NAME3.Value     :='';
             CpyDstKopfTabKUN_ABTEILUNG.Value :='';
             CpyDstKopfTabKUN_STRASSE.Value   :='';
             CpyDstKopfTabKUN_LAND.Value      :='';
             CpyDstKopfTabKUN_PLZ.Value       :='';
             CpyDstKopfTabKUN_ORT.Value       :='';

             CpyDstKopfTabLief_Addr_ID.Value  :=CpySrcKopfTabAddr_ID.Value;
             CpyDstKopfTabAddr_ID.Value       :=-1;
             CpyDstKopfTabLDatum.AsDateTime   :=int(Now)+3;
        end;

        CpyDstKopfTabLIEFART.Value :=-1;
        CpyDstKopfTabZAHLART.Value :=-1;
     end;

     CpyDstKopfTab.Post;

     ID :=CpyDstKopfTabREC_ID.Value;

     CpySrcPosTab.Close;
     CpySrcPosTab.ParamByName ('ID').AsInteger :=Journal_ID;
     CpySrcPosTab.Open;

     CpyDstPosTab.Open;

     while not CpySrcPosTab.Eof do
     begin
        // Bei Lieferscheinen die Transportkosten überspringen
        if (Dest=VK_LIEF_EDI)and
           (CpySrcPosTab.FieldByName('ARTIKELTYP').AsString='K') then
        begin
           CpySrcPosTab.Next;
           Continue;
        end;


        CpyDstPosTab.Append;

        for i:=0 to CpySrcPosTab.Fields.Count-1 do
        begin
         if uppercase(CpySrcPosTab.Fields[i].FieldName)<>'REC_ID'
          then  CpyDstPosTab.FieldByName (CpySrcPosTab.Fields[i].FieldName).Value :=
                   CpySrcPosTab.Fields[i].Value;
        end;
        CpyDstPosTab.FieldByName('VRENUM').Value          :=num;
        CpyDstPosTab.FieldByName('QUELLE').Value          :=Dest;
        CpyDstPosTab.FieldByName('QUELLE_SUB').Value      :=0;
        //CpyDstPosTab.FieldByName('JAHR').Value            :=0;
        CpyDstPosTab.FieldByName('JOURNAL_ID').Value      :=ID;
        CpyDstPosTab.FieldByName('GEBUCHT').Value         :=False;
        CpyDstPosTab.FieldByName('EPREIS').Value          :=CalcLeitwaehrung(CpySrcPosTab.FieldByName('EPREIS').AsFloat,W);
        CpyDstPosTab.FieldByName('E_RGEWINN').Value       :=CalcLeitwaehrung(CpySrcPosTab.FieldByName('E_RGEWINN').AsFloat,W);

        //NEU
        //if (CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI])and(Dest=VK_RECH_EDI) then
        if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI])and(Dest=VK_RECH_EDI))or
           ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI])and(Dest=EK_BEST_EDI))or
           (Dest=VK_LIEF_EDI) then
        begin
           if (DEST <> EK_BEST_EDI)
            then CpyDstPosTab.FieldByName('GEGENKTO').Value :=DM1.ReadInteger ('MAIN\KONTEN','DEF_ERLOESKTO',8400)
            else CpyDstPosTab.FieldByName('GEGENKTO').Value :=DM1.ReadInteger ('MAIN\KONTEN','DEF_AUFWANDSKTO',3400);

           if (CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger >=0)and
              (Dest <> VK_LIEF_EDI) then
           begin
             UpdateArtTab.Close;
             UpdateArtTab.ParamByName ('ID').AsInteger :=CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger;
             UpdateArtTab.Open;

             if UpdateArtTab.RecordCount=1 then
             begin
               if (DEST=EK_BEST_EDI)and // nur bei EK-Bestellungen
                  (UpdateArtTab.FieldByName ('RABGRP_ID').AsString<>'-')and
                  (length(UpdateArtTab.FieldByName ('RABGRP_ID').AsString)>0) then
               begin
                  // Ist ein Artikel mit Rabattgruppe !!!
                  case AnzPreis of
                       1: EK :=UpdateArtTab.FieldByName ('VK1').Value;
                       2: EK :=UpdateArtTab.FieldByName ('VK2').Value;
                       3: EK :=UpdateArtTab.FieldByName ('VK3').Value;
                       4: EK :=UpdateArtTab.FieldByName ('VK4').Value;
                     else EK :=UpdateArtTab.FieldByName ('VK5').Value;
                  end;

                  DM1.CalcRabGrpPreis (UpdateArtTab.FieldByName ('RABGRP_ID').AsString,0{EK},EK);
                  CpyDstPosTab.FieldByName('EPREIS').Value :=CAO_round(EK * 1000)/1000; //auf 3 Nachkommastellen runden
               end
                  else
               begin
                  // neuen VK-Preis zuweisen
                  case CpyDstKopfTabPR_EBENE.Value of
                     0:   CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('EK_PREIS').Value;
                     1:   CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('VK1').Value;
                     2:   CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('VK2').Value;
                     3:   CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('VK3').Value;
                     4:   CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('VK4').Value;
                     else CpyDstPosTab.FieldByName('EPREIS').Value :=UpdateArtTab.FieldByName ('VK5').Value;
                  end;
               end;
             end;

             if DEST <> EK_BEST_EDI
              then CpyDstPosTab.FieldByName('GEGENKTO').Value :=UpdateArtTab.FieldByName ('ERLOES_KTO').AsInteger
              else CpyDstPosTab.FieldByName('GEGENKTO').Value :=UpdateArtTab.FieldByName ('AUFW_KTO').AsInteger;

             if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT').Value  :=0;
             if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT2').Value :=0;
             if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT3').Value :=0;

             UpdateArtTab.Close;
           end;



           Summe :=CpyDstPosTab.FieldByName('EPREIS').Value * CpyDstPosTab.FieldByName('MENGE').Value;
           if CpyDstPosTab.FieldByName('RABATT').Value <> 0
            then Summe :=Summe - Summe * CpyDstPosTab.FieldByName('RABATT').Value / 100;

           Case CpyDstPosTab.FieldByName('STEUER_CODE').Value of
              0: Steuer :=CpyDstKopfTabMWST_0.Value;
              1: Steuer :=CpyDstKopfTabMWST_1.Value;
              2: Steuer :=CpyDstKopfTabMWST_2.Value;
              3: Steuer :=CpyDstKopfTabMWST_3.Value;
              else Steuer :=0;
           end;

           NSumme :=CAO_round(Summe*100)/100;  // Auf ganze Pfennige Runden
           MSumme :=CAO_round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
           BSumme :=NSumme+MSumme;

           N :=N+NSumme;
           M :=M+MSumme;
           B :=B+BSumme;

           case CpyDstPosTab.FieldByName('STEUER_CODE').Value of
                  0:M0 :=M0 + MSumme;
                  1:M1 :=M1 + MSumme;
                  2:M2 :=M2 + MSumme;
                  3:M3 :=M3 + MSumme;
           end;

           // Lohn, Ware, Transportkosten
           if length (CpyDstPosTab.FieldByName('ARTIKELTYP').AsString)=1
             then T :=CpyDstPosTab.FieldByName('ARTIKELTYP').AsString[1]
             else T :='?';

           case t of
               'N','S','V','F' : Ware :=Ware + NSumme;
               'L'             : Lohn :=Lohn + NSumme;
               'K'             : TKst :=TKst + NSumme;
           end;
        end;

        // Bei VK-Rechnungen (Edi) die Lieferscheinnummer der
        // zugrundeliegenden Rechnung löschen
        if Dest=VK_RECH_EDI
          then CpyDstPosTab.FieldByName('VLSNUM').AsInteger :=-1;


        if ((Dest=EK_RECH_EDI) and (CpySrcKopfTabQuelle.AsInteger=EK_BEST)) or
           ((Dest=VK_LIEF_EDI) and (CpySrcKopfTabQuelle.AsInteger=VK_RECH_EDI)) then
        begin
             // Im Einkauf Verweis auf die zugrundeliegenden Bestell-Positionen machen
             // im Verkauf/Lieferschein Verweis auf zugrundeliegende EDI-Rechnunsposition machen
             CpyDstPosTab.FieldByName ('QUELLE_SRC').AsInteger :=
              CpySrcPosTab.FieldByName ('REC_ID').AsInteger;
        end;

        CpyDstPosTab.Post;

        // Seriennummern bei Lieferscheinen zuweisen
        if (Dest=VK_LIEF_EDI) and
           (CpySrcKopfTabQuelle.AsInteger=VK_RECH_EDI) then
        begin
            UniQuery.Sql.Text :=
              'UPDATE ARTIKEL_SERNUM SET '+
              'LS_JOURNALPOS_ID='+
              Inttostr(CpyDstPosTab.FieldByName ('REC_ID').AsInteger)+','+
              'LS_JOURNAL_ID='+Inttostr(ID)+
              ' where VK_JOURNALPOS_ID='+
              IntToStr(CpySrcPosTab.FieldByName ('REC_ID').AsInteger)+' and '+
              'LS_JOURNALPOS_ID=-1 and ARTIKEL_ID='+
              IntToStr(CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger);

            UniQuery.ExecSql;
        end;


        // EDI-Mengen aktualisieren
        UpdateArtikelEdiMenge (Dest,
                               CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger,
                               0);

        CpySrcPosTab.Next;
     end;

     if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI])and(Dest=VK_RECH_EDI))or
        ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI])and(Dest=EK_BEST_EDI))or
        (Dest=VK_LIEF_EDI) then
     begin
        CpyDstKopfTab.Edit;

        CpyDstKopfTabNSumme.Value :=N;
        CpyDstKopfTabMSumme.Value :=M;
        CpyDstKopfTabBSumme.Value :=B;

        CpyDstKopfTabMSumme_0.Value :=M0;
        CpyDstKopfTabMSumme_1.Value :=M1;
        CpyDstKopfTabMSumme_2.Value :=M2;
        CpyDstKopfTabMSumme_3.Value :=M3;

        CpyDstKopfTabWare.Value     :=Ware;
        CpyDstKopfTabLohn.Value     :=Lohn;
        CpyDstKopfTabTKost.Value    :=TKst;

        CpyDstKopfTab.Post;
     end;
     CpySrcPosTab.Close;
     CpyDstPosTab.Close;
     CpyDstKopfTab.Close;
     CpySrcKopfTab.Close;

     Result :=ID;
end;
//------------------------------------------------------------------------------
function tDM1.Storno_Einkauf (Journal_ID : Integer):Boolean; // True, Wenn OK
begin
     Result :=False;
     try
        JourTab.Close;
        JourTab.ParamByName ('ID').Value :=Journal_ID;
        JourTab.Open;

        if JourTabZahlArt.Value = 1 then  // Kassenbuchung stornieren
        begin
           with UniQuery do
           begin
              Close;
              SQL.Clear;
              SQL.Add ('delete from FIBU_KASSE');
              SQL.Add ('where JOURNAL_ID='+Inttostr(Journal_ID));
              ExecSql;
              SQL.Clear;
           end;
        end;

        // ggf. Seriennummer freigeben
        with UniQuery do
        begin
           Close;
           SQL.Clear;
           SQL.Add ('update ARTIKEL_SERNUM set EK_JOURNAL_ID=-1, ');
           SQL.Add ('EK_JOURNALPOS_ID=-1 where EK_JOURNAL_ID='+Inttostr(Journal_ID));
           ExecSql;
           SQL.Clear;
        end;


        JPosTab.Close;
        JPosTab.ParamByName ('ID').Value :=Journal_ID;
        JPosTab.Open;

        while not JPosTab.Eof do
        begin
           // Artikel Buchen
           if (JPosTabArtikelTyp.Value='N')and
              (JPosTabARTIKEL_ID.Value>-1) then
           begin
              // Menge erniedrugen (EK STORNO)
              ArtMengeTab.Close;
              ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.Value;
              ArtMengeTab.ParamByName ('SUBMENGE').Value :=JPosTabMenge.Value;
              ArtMengeTab.ParamByName ('BMENGE').Value :=0;
              ArtMengeTab.ExecSql;
              JPosTabGebucht.AsBoolean :=True;
           end;

           // Daten aktualisieren
           JPosTab.Delete;
        end;
        JPosTab.Close;

        JourTab.Delete;
        JourTab.Close;

        //Datei-Links löschen
        LinkForm.DelLinks (EK_RECH, JOURNAL_ID);

        Result :=True;
     except
        MessageDlg ('Fehler beim Storno der EK-Rechnung !',mterror,[mbok],0);
        Result :=False;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.GetArtikelPreis (ArtikelID, KunID, PE : Integer;
                               Brutto : Boolean;
                               Menge : Double;
                               var Preis : Double) : Boolean;

var PR, M, B : Double;
    PreisTyp : Integer;
begin
     Result :=False;

     if PE=0 then PreisTyp :=EK_RECH else PreisTyp :=VK_RECH;


     if (ArtInfoTab.Active)and
        (ArtInfoTab.RecordCount>0) and

        (
         (DM1.ArtInfoTab.Locate ('REC_ID;PREIS_TYP;ADRESS_ID',
                                 VarArrayOF([ArtikelID,PreisTyp,KunID]),
                                 []))or
         (DM1.ArtInfoTab.Locate ('REC_ID',
                                 ArtikelID,
                                 []))
        ) then
        //(ArtInfoTab.Locate ('REC_ID',ArtikelID,[])) then
     begin
          if Brutto then
          begin
            //Kundenpreis prüfen
            if (ArtInfoTabAdress_ID.AsInteger=KunID) and
               (ArtInfoTabPreis.AsFloat<>0) then
            begin
               PR :=ArtInfoTabPreis.AsFloat;
               // Brutto berechnen
               case ArtInfoTabSTEUER_CODE.AsInteger of
                    1: M :=MWSTTab[1];
                    2: M :=MWSTTab[2];
                    3: M :=MWSTTab[3];
                  else M :=MWSTTab[0];
               end;
               M :=M+100; // jetzt z.B. 116

               B :=CAO_round(PR*M); // jetzt ganze Cent
               B :=CAO_Round (B / BR_RUND_WERT) * BR_RUND_WERT / 100;
               Preis :=B;
            end
               else
            begin
               case PE of
                   0:PR :=ArtInfoTabEK_PREIS.Value;
                   1:PR :=ArtInfoTabVK1B.Value;
                   2:PR :=ArtInfoTabVK2B.Value;
                   3:PR :=ArtInfoTabVK3B.Value;
                   4:PR :=ArtInfoTabVK4B.Value;
                else PR :=ArtInfoTabVK5B.Value;
               end;
               Preis :=PR;
            end;


            if (ArtInfoTabRABGRP_ID.AsString<>'-')and
               (length(ArtInfoTabRABGRP_ID.AsString)>0)and
               //(ArtInfoTabPreis.AsFloat=0) then
               (ArtInfoTabAdress_ID.AsInteger<>KunID) then
            begin
                 // Ist ein Artikel mit Rabattgruppe !!!
                 // Brutto muß berechnet werden

                 // Listenpreis festlegen
                 case AnzPreis of
                     1: PR :=ArtInfoTabVK1.Value;
                     2: PR :=ArtInfoTabVK2.Value;
                     3: PR :=ArtInfoTabVK3.Value;
                     4: PR :=ArtInfoTabVK4.Value;
                   else PR :=ArtInfoTabVK5.Value;
                 end;

                 // nur wenn Rab.Gruppe gefunden
                 if CalcRabGrpPreis (ArtInfoTabRABGRP_ID.AsString,
                                     PE,PR) then
                 begin
                    case ArtInfoTabSTEUER_CODE.AsInteger of
                         1: M :=MWSTTab[1];
                         2: M :=MWSTTab[2];
                         3: M :=MWSTTab[3];
                       else M :=MWSTTab[0];
                    end;
                    M :=M+100; // jetzt z.B. 116

                    B :=CAO_round(PR*M); // jetzt ganze Cent
                    B :=CAO_Round (B / BR_RUND_WERT) * BR_RUND_WERT / 100;
                    Preis :=B;
                 end;
            end;
          end
             else
          begin
            // Netto
            //Kundenpreis prüfen
            if (ArtInfoTabAdress_ID.AsInteger=KunID) and
               (ArtInfoTabPreis.AsFloat<>0) then
            begin
               // Kundenpreis verwenden
               Preis :=ArtInfoTabPreis.AsFloat;
            end
               else
            begin
               // normalen Preis verwenden
               case PE of
                    0:PR :=ArtInfoTabEK_Preis.Value;
                    1:PR :=ArtInfoTabVK1.Value;
                    2:PR :=ArtInfoTabVK2.Value;
                    3:PR :=ArtInfoTabVK3.Value;
                    4:PR :=ArtInfoTabVK4.Value;
                 else PR :=ArtInfoTabVK5.Value;
               end;
               Preis :=PR;
            end;


            if (ArtInfoTabRABGRP_ID.AsString<>'-')and
               (length(ArtInfoTabRABGRP_ID.AsString)>0)and
               (ArtInfoTabAdress_ID.AsInteger<>KunID) then
            begin
                 // Ist ein Artikel mit Rabattgruppe !!!

                 // Listenpreis festlegen
                 case AnzPreis of
                     1: PR :=ArtInfoTabVK1.Value;
                     2: PR :=ArtInfoTabVK2.Value;
                     3: PR :=ArtInfoTabVK3.Value;
                     4: PR :=ArtInfoTabVK4.Value;
                   else PR :=ArtInfoTabVK5.Value;
                 end;

                 // nur wenn Rab.Gruppe gefunden
                 if CalcRabGrpPreis (ArtInfoTabRABGRP_ID.AsString,
                                     PE,PR)
                  then Preis :=PR;
            end;
          end;
          Result :=True;
     end;
end;
//------------------------------------------------------------------------------
function TDM1.GetVertreterProv (ID : Integer) : Double;
begin
   Result :=0;
   if ID<1 then exit;

   if ID = LastVertrID then
   begin
      Result :=LastVertrProz;
      exit;
   end;

   if not VertreterTab.Active then VertreterTab.Open;

   if (VertreterTab.Locate ('VERTRETER_ID',ID,[])) and
      (VertreterTab.FieldByName ('VERTRETER_ID').AsInteger=ID) then
   begin
      LastVertrID   :=VertreterTab.FieldByName ('VERTRETER_ID').AsInteger;
      LastVertrProz :=VertreterTab.FieldByName ('PROVISIONSATZ').AsFloat;

      Result :=LastVertrProz;
   end;
end;
//------------------------------------------------------------------------------
// Nur zur Probe aus der EDI-Rechnung einen Lieferschein erstellen !
function tDM1.Buche_Lieferschein (Journal_ID : Integer;
                                  Teillief : Boolean;
                                  var LieferscheinID : Integer):Integer; // liefert Belegnummer zurück
var NewId    : Integer;
    Pos      : Integer;
begin
     if not TeilLief then NewID :=CopyRechnung (Journal_ID, VK_LIEF_EDI)
                     else NewID :=Journal_ID;

     LieferscheinID :=NewID;

     Result :=-1;
     Transact1.AutoCommit :=False;
     //Transact1.TransactSafe :=True;
     try
       try
          JourTab.Close;
          JourTab.ParamByName ('ID').Value :=NewID;
          JourTab.Open;
          JourTab.Edit;

          // Nachschauen, ob Kunde eine Lieferanschrift hat
          KunTab.Close;
          KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
          KunTab.Open;

          // neu 22.08.2003
          // Liefersnschrift zuweisen
          with DM1.UniQuery do
          begin
             SQL.Text :='select * from ADRESSEN_LIEF where REC_ID='+
                        IntToStr(JourTabLIEF_ADDR_ID.AsInteger);
             Open;
             if RecordCount>0 then
             begin
                JourTabKUN_Anrede.Text  :=FieldByName ('ANREDE').AsString;
                JourTabKUN_NAME1.Text   :=FieldByName ('NAME1').AsString;
                JourTabKUN_NAME2.Text   :=FieldByName ('NAME2').AsString;
                JourTabKUN_NAME3.Text   :=FieldByName ('NAME3').AsString;
                JourTabKUN_Strasse.Text :=FieldByName ('STRASSE').AsString;
                JourTabKUN_LAND.Text    :=FieldByName ('LAND').AsString;
                JourTabKUN_PLZ.Text     :=FieldByName ('PLZ').AsString;
                JourTabKUN_Ort.Text     :=FieldByName ('ORT').AsString;
             end
          end;

          // neue Belegnummer holen
          JourTabVLSNUM.Value  :=IncNummer (VK_LIEF);
          JourTabVRENUM.Value  :=-1;
          JourTabRDatum.AsDateTime:=0;
          JourTabFreigabe1_Flag.Value :=False;

          Result :=JourTabVLSNUM.Value;

          JourTabLDatum.AsDateTime :=Now;
          JourTabStadium.Value :=20+JourTabLiefart.Value;

          JourTabQuelle.Value      :=VK_LIEF;
          JourTabKONTOAUSZUG.Value :=-1;
          JourTabUW_NUM.Value      :=-1;
          JourTabBANK_ID.Value     :=-1;

          // Warenwert erst mal auf Nettosumme !!!
          // Muß noch geändert werden !!!
          JourTabWERT_NETTO.Value :=JourTabNSumme.Value;

          JourTab.Post;


          // Lieferscheinnummer in die Seriennummern eintragen
          UniQuery.Sql.Text :=
             'UPDATE ARTIKEL_SERNUM SET LIEF_NUM='+
             Inttostr(JourTabVLSNUM.AsInteger)+
             ' WHERE LS_JOURNAL_ID='+
             IntToStr(NewID);
          UniQuery.ExecSql;


          JPosTab.Close;
          JPosTab.ParamByName ('ID').Value :=NewID;
          JPosTab.Open;

          Pos :=0;

          while not JPosTab.Eof do
          begin
             JPosTab.Edit;

             // Position schreiben, aber nur bei Artikeln, nicht bei Text
             if JPosTabArtikelTyp.Value<>'T' then
             begin
                  Inc(Pos);
                  JposTabView_Pos.Value :=Inttostr(Pos);
             end;

             // Daten aktualisieren
             JPosTabVLSNUM.Value  :=JourTabVLSNUM.Value;
             JPosTabVRENUM.Value  :=JourTabVRENUM.Value;
             JPosTabQuelle.Value  :=VK_LIEF;

             JPosTab.Post;
             JPosTab.Next;
          end;

          JPosTab.Close;
          JourTab.Close;
          Transact1.Commit;

       except
          MessageDlg ('Fehler beim Buchen des VK-Lieferscheines !',mterror,[mbok],0);
          Transact1.RollBack;
          Result :=-1;
       end;
     finally
       Transact1.AutoCommit :=True;
       //Transact1.TransactSafe :=False;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.Storno_Lieferschein (Journal_ID : Integer):Boolean; // True, Wenn OK
begin
     Result :=False;
     try
        JourTab.Close;
        JourTab.ParamByName ('ID').Value :=Journal_ID;
        JourTab.Open;

        // ggf. Seriennummer freigeben
        with UniQuery do
        begin
           Close;
           SQL.Clear;
           SQL.Add ('update ARTIKEL_SERNUM set ');
           SQL.Add ('LS_JOURNAL_ID=-1, ');
           SQL.Add ('LS_JOURNALPOS_ID=-1, ');
           SQL.Add ('LIEF_NUM=-1 ');
           SQL.Add ('where LS_JOURNAL_ID='+Inttostr(Journal_ID));
           ExecSql;
           SQL.Clear;
        end;

        JPosTab.Close;
        JPosTab.ParamByName ('ID').Value :=Journal_ID;
        JPosTab.Open;

        while not JPosTab.Eof do JPosTab.Delete;
        JPosTab.Close;

        JourTab.Delete;
        JourTab.Close;

        //Datei-Links löschen
        LinkForm.DelLinks (VK_LIEF, JOURNAL_ID);

        Result :=True;
     except
        MessageDlg ('Fehler beim Storno des Lieferscheins !',mterror,[mbok],0);
        Result :=False;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.Buche_Rechnung (Journal_ID : Integer):Integer; // liefert Rechnungnummer zurück
var Pos      : Integer;
    IStr     : String;
begin
     Result :=-1;

     Transact1.AutoCommit :=False;
     //Transact1.TransactSafe :=True;
     try
       try
          JourTab.Close;
          JourTab.ParamByName ('ID').Value :=Journal_ID;
          JourTab.Open;
          JourTab.Edit;

          // neue Rechnungsnummer holen, aber nur wenn USE_SHOP_ORDERID=False

          if (not ReadBoolean ('SHOP','USE_SHOP_ORDERID',False)) or
             (JourTabSHOP_ID.AsInteger<1)
           then JourTabVRENUM.Value  :=IncNummer (VK_RECH);

          Result :=JourTabVRENUM.Value;

          JourTabSTADIUM.Value :=22;
          JourTabRDatum.AsDateTime  :=now;
          JourTabQuelle.Value  :=VK_RECH;
          JourTabQuelle_Sub.Value :=1; // Rechnung

          JourTabKONTOAUSZUG.Value :=-1;
          JourTabUW_NUM.Value :=-1;
          JourTabBANK_ID.Value :=-1;

          JourTabIST_Betrag.Value :=0;
          JourTabIST_Anzahlung.Value :=0;
          JourTabFreigabe1_Flag.Value :=False;
          JourTabMAHNKOSTEN.Value :=0;


          // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
          // falls diese noch nicht zugewiesen sind
          KunTab.Close;
          KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
          KunTab.Open;

          if KunTab.RecordCount=1 then
          begin
             KunTab.Edit;
             if KunTabKun_Zahlart.AsInteger<0
              then KunTabKun_Zahlart.Value :=JourTabZahlart.Value;
             if KunTabKun_Liefart.AsInteger<0
              then KunTabKun_Liefart.Value :=JourTabLiefart.Value;
             KunTab.Post;
          end;

          KunTab.Close;

          case JourTabZahlart.Value of
               //bar bzw. scheck
               1,5:begin
                   if JourTabSOLL_SKONTO.Value>0 then
                   begin
                      JourTabStadium.Value :=80+JourTabZahlart.Value;
                      JourTabIST_SKONTO.Value :=JourTabSOLL_SKONTO.Value;
                      JourTabIST_ANZAHLUNG.Value :=0;
                      JourTabIST_ZAHLDAT.Value :=JourTabRDatum.Value;
                      JourTabIST_BETRAG.Value :=
                        JourTabBSumme.Value-(JourTabBSumme.Value / 100) *
                        JourTabSOLL_SKONTO.Value;
                   end
                      else
                   begin
                      JourTabStadium.Value :=90+JourTabZahlart.Value;
                      JourTabIST_SKONTO.Value :=0;
                      JourTabIST_ANZAHLUNG.Value :=0;
                      JourTabIST_ZAHLDAT.Value :=JourTabRDatum.Value;
                      JourTabIST_BETRAG.Value :=JourTabBSumme.Value;
                   end;
                 end;
               //Überweisung
               2,3,4:JourTabStadium.Value :=20+JourTabZahlart.Value;
               //Lastschrift, EC-Karte
               6,9  :JourTabStadium.Value :=20+JourTabZahlart.Value;
          end;

          // Wenn MWST-Freie Rechnung dann alle MWST-Felder löschen
          if JourTabMWST_FREI_FLAG.AsBoolean then
          begin
             JourTabMWST_0.AsInteger :=0;
             JourTabMWST_1.AsInteger :=0;
             JourTabMWST_2.AsInteger :=0;
             JourTabMWST_3.AsInteger :=0;
             JourTabMSUMME_0.AsFloat :=0;
             JourTabMSUMME_1.AsFloat :=0;
             JourTabMSUMME_2.AsFloat :=0;
             JourTabMSUMME_3.AsFloat :=0;
             JourTabMSUMME.AsFloat   :=0;
             JourTabBSUMME.AsFloat   :=JourTabNSUMME.AsFloat;
          end;

          JourTab.Post;

          if JourTabZahlArt.Value = 1 then  // Kassenbuchung
          begin
               BucheKasse (JourTabIST_Zahldat.AsDateTime,
                           VK_RECH,JourTabRec_ID.Value,
                           Inttostr(JourTabVReNum.Value),
                           JourTabGegenKonto.Value,
                           JourTabIST_Skonto.Value,
                           JourTabIST_Betrag.Value,
                           'ZE VK-RE '+JourTabKun_Name1.Value);

          end;

          JPosTab.Close;
          JPosTab.ParamByName ('ID').Value :=Journal_ID;
          JPosTab.Open;

          Pos :=0;

          IStr :=''; // Insert-String für Stücklistenartikel leeren

          while not JPosTab.Eof do
          begin
               JPosTab.Edit;

               //MWST_Code löschen, wenn MwSt-freier Beleg
               if JourTabMWST_FREI_FLAG.AsBoolean
                 then JPosTabSteuer_Code.Value :=0;

               // Position schreiben, aber nur bei Artikeln, nicht bei Text
               if JPosTabArtikelTyp.Value<>'T' then
               begin
                    Inc(Pos);
                    JposTabView_Pos.Value :=Inttostr(Pos);
               end;

               // Artikel Buchen
               if (JPosTabGebucht.AsBoolean=False)and
                  (JPosTabArtikelTyp.Value='N')and
                  (JPosTabARTIKEL_ID.Value>-1) then
               begin
                    // Menge erniedrigen
                    ArtMengeTab.Close;
                    ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.Value;
                    ArtMengeTab.ParamByName ('SUBMENGE').Value :=JPosTabMenge.Value;

                    //Bestellmenge nicht verändern
                    ArtMengeTab.ParamByName ('BMENGE').Value :=0;
                    ArtMengeTab.ExecSql;

                    JPosTabGebucht.AsBoolean :=True;
               end
                  else
               if (JPosTabGebucht.AsBoolean=False)and
                  (JPosTabArtikelTyp.Value='S')and
                  (JPosTabARTIKEL_ID.Value>-1) then
               begin
                    // Stückliste abarbeiten

                    // gut währe es, die Stücklistenartikel versteckt mit in die Rechnung einzufügen,
                    // dann würde man den verkauf auch in der Historie der Artikel sehen,
                    // allerdings müßte es dann ein Flag Visible in der Postentabelle geben,
                    // damit die Berechnungen der Preise und der Rechnungsausdruck korrekt funktionieren !!!

                    STListTab.Close;
                    STListTab.ParamByName ('ID').ASInteger :=JPosTabARTIKEL_ID.Value;
                    STListTab.Open;


                    while not STListTab.Eof do
                    begin
                        // Menge erniedrigen
                        ArtMengeTab.Close;
                        ArtMengeTab.ParamByName ('ID').Value :=STListTabART_ID.Value;
                        ArtMengeTab.ParamByName ('SUBMENGE').Value :=JPosTabMenge.Value * STListTabMENGE.Value;
                        //Bestellmenge nicht verändern
                        ArtMengeTab.ParamByName ('BMENGE').Value :=0;
                        ArtMengeTab.ExecSql;

                        if length(IStr)>0 then IStr :=IStr+';'+#13#10;

                        // Batch-SQL erzeugen und die Stücklistenartikel mit in die Rechnung zu speichern
                        // mit Artikeltyp="X"

                        dm1.uniquery.close;
                        dm1.uniquery.sql.text :='select MATCHCODE,ARTNUM,BARCODE,LAENGE,'+
                                                'GROESSE,DIMENSION,GEWICHT,ME_EINHEIT,'+
                                                'LANGNAME from ARTIKEL where REC_ID='+
                                                IntToStr(STListTabART_ID.Value);
                        dm1.uniquery.open;

                        IStr :=Istr+
                          'INSERT INTO JOURNALPOS SET '+
                          'QUELLE='+IntToStr(VK_RECH)+
                          ',QUELLE_SUB='+IntToStr(1)+
                          ',JOURNAL_ID='+IntToStr(JPosTabJOURNAL_ID.Value)+
                          ',ARTIKELTYP="X"'+
                          ',ARTIKEL_ID='+IntToStr(STListTabART_ID.Value)+
                          ',TOP_POS_ID='+IntToStr(JPosTabRec_ID.Value)+
                          ',ADDR_ID='+IntToStr(JPosTabADDR_ID.Value)+
                          ',VRENUM='+IntToStr(JourTabVRENUM.Value)+
                          ',MENGE="'+FloatToStrEx(JPosTabMenge.Value * STListTabMENGE.Value)+'"'+
                          ',POSITION='+IntToStr(JPosTabPOSITION.Value)+
                          ',MATCHCODE="'+dm1.uniquery.fieldbyname ('MATCHCODE').AsString+'"'+
                          ',ARTNUM="'+dm1.uniquery.fieldbyname ('ARTNUM').AsString+'"'+
                          ',BARCODE="'+dm1.uniquery.fieldbyname ('BARCODE').AsString+'"'+
                          ',LAENGE="'+dm1.uniquery.fieldbyname ('LAENGE').AsString+'"'+
                          ',GROESSE="'+dm1.uniquery.fieldbyname ('GROESSE').AsString+'"'+
                          ',DIMENSION="'+dm1.uniquery.fieldbyname ('DIMENSION').AsString+'"'+
                          ',GEWICHT='+FloatToStrEx(dm1.uniquery.fieldbyname ('GEWICHT').AsFloat)+
                          ',ME_EINHEIT="'+dm1.uniquery.fieldbyname ('ME_EINHEIT').AsString+'"'+
                          ',BEZEICHNUNG="'+dm1.uniquery.fieldbyname ('LANGNAME').AsString+'"';

                        dm1.uniquery.close;
                        STListTab.Next;
                    end;
                    STListTab.Close;

                    JPosTabGebucht.AsBoolean :=True;
               end;


               // Daten aktualisieren
               JPosTabVRENUM.Value :=JourTabVRENUM.Value;
               JPosTabQuelle.Value  :=VK_RECH;
               JPosTabQuelle_Sub.Value :=1; // Rechnung

               JPosTab.Post;

               // Lieferschein(e) aktualisieren
               if JPosTabVLSNum.Value>=0 then
               begin
                  uniquery.close;
                  uniquery.sql.clear;
                  uniquery.sql.add ('update JOURNAL');
                  uniquery.sql.add ('set STADIUM=90, VRENUM='+Inttostr(JPosTabVRENum.Value)+', RDATUM=:RDATUM');
                  uniquery.sql.add ('where QUELLE=2 and VLSNUM='+Inttostr(JPosTabVLSNum.Value));
                  uniquery.parambyname ('RDATUM').AsDateTime :=JourTabRDatum.AsDateTime;
                  uniquery.ExecSql;
                  uniquery.close;
                  uniquery.sql.clear;
               end;

               // im Artkikel die MENGE_VKRE_EDI aktualisieren
               UpdateArtikelEdiMenge (VK_RECH_EDI, JPosTabArtikel_ID.AsInteger,0);

               JPosTab.Next;
          end;


          // Stücklistenunterartikel hinzufügen
          if length(IStr)>0 then
          begin
             DM1.ZBatchSql1.Sql.Text :=ISTr;
             try
                DM1.ZBatchSql1.ExecSql;
             except
                MessageDlg ('Fehler beim hinzufügen der Stücklisten-Unterartikel.',
                            mterror,[mbok],0);
             end;
          end;

          if JourTabKFZ_ID.Value>=0 then
          begin
             ReKFZTab.Close;
             ReKFZTab.ParamByName ('KID').AsInteger :=JourTabKFZ_ID.Value;
             ReKFZTab.Open;
             if ReKFZTab.RecordCount = 1 then
             begin
                ReKFZTab.Edit;
                ReKFZTabLE_BESUCH.Value :=JourTabRDAtum.Value;
                ReKFZTabKM_STAND.Value :=JourTabKM_Stand.Value;

                try ReKFZTab.Post; except ReKFZTab.Cancel; end;
             end;
             ReKFZTab.Close;
          end;

          //Seriennumern aktualisieren
          try
             dm1.UniQuery.close;
             dm1.UniQuery.sql.text :='UPDATE ARTIKEL_SERNUM SET VERK_NUM='+
                                     IntToStr(JourTabVRENUM.AsInteger)+
                                     ' where VK_JOURNAL_ID='+
                                     IntToStr(JourTabRec_ID.AsInteger);
             dm1.UniQuery.ExecSql;
             dm1.UniQuery.close;
          except
             MessageDlg ('Fehler beim aktualisieren der Seriennummern.',mterror,[mbok],0);
          end;

          JPosTab.Close;
          JourTab.Close;
          Transact1.Commit;

       except
          MessageDlg ('Fehler beim Buchen der Rechnung !',mterror,[mbok],0);
          Transact1.RollBack;
          Result :=-1;
       end;
     finally
       Transact1.AutoCommit :=True;
       //Transact1.TransactSafe :=False;
     end;
end;
//------------------------------------------------------------------------------
function tDM1.Buche_Angebot (Journal_ID : Integer):Integer; // liefert AGB-Nummer zurück
var //Ja,Mo,Ta : Word;
    Pos : Integer;
begin
     Result :=-1;
     //DecodeDate (Now, Ja, Mo, Ta);
     Transact1.AutoCommit :=False;
     //Transact1.TransactSafe :=True;
     try
       try
          JourTab.Close;
          JourTab.ParamByName ('ID').Value :=Journal_ID;
          JourTab.Open;
          JourTab.Edit;
          // neue Nummer holen
          JourTabVRENUM.Value  :=IncNummer (VK_AGB);

          Result :=JourTabVRENUM.Value;

          JourTabSTADIUM.Value :=0;
          //JourTabJahr.Value    :=ja;
          JourTabRDatum.AsDateTime  :=now;
          JourTabQuelle.Value  :=VK_AGB;

          JourTabKONTOAUSZUG.Value :=-1;
          JourTabUW_NUM.Value :=-1;
          JourTabBANK_ID.Value :=-1;

          JourTabIST_Betrag.Value :=0;
          JourTabIST_Anzahlung.Value :=0;
          JourTabFreigabe1_Flag.Value :=False;

          // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
          // falls diese noch nicht zugewiesen sind
          KunTab.Close;
          KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
          KunTab.Open;
          if KunTab.RecordCount=1 then
          begin
             KunTab.Edit;
             if KunTabKun_Zahlart.AsInteger<0
               then KunTabKun_Zahlart.Value :=JourTabZahlart.Value;
             if KunTabKun_Liefart.AsInteger<0
               then KunTabKun_Liefart.Value :=JourTabLiefart.Value;
             KunTab.Post;
          end;

          KunTab.Close;


          // Wenn MWST-Freies Angebot dann alle MWST-Felder löschen
          if JourTabMWST_FREI_FLAG.AsBoolean then
          begin
             JourTabMWST_0.AsInteger :=0;
             JourTabMWST_1.AsInteger :=0;
             JourTabMWST_2.AsInteger :=0;
             JourTabMWST_3.AsInteger :=0;
             JourTabMSUMME_0.AsFloat :=0;
             JourTabMSUMME_1.AsFloat :=0;
             JourTabMSUMME_2.AsFloat :=0;
             JourTabMSUMME_3.AsFloat :=0;
             JourTabMSUMME.AsFloat   :=0;
             JourTabBSUMME.AsFloat   :=JourTabNSUMME.AsFloat;
          end;


          JourTab.Post;

          JPosTab.Close;
          JPosTab.ParamByName ('ID').Value :=Journal_ID;
          JPosTab.Open;

          Pos :=0;

          while not JPosTab.Eof do
          begin
             JPosTab.Edit;

             //MWST_Code löschen, wenn MwSt-freier Beleg
             if JourTabMWST_FREI_FLAG.AsBoolean
               then JPosTabSteuer_Code.Value :=0;

             // Position schreiben, aber nur bei Artikeln, nicht bei Text
             if JPosTabArtikelTyp.Value<>'T' then
             begin
                Inc(Pos);
                JposTabView_Pos.Value :=Inttostr(Pos);
             end;

             // Daten aktualisieren
             //JPosTabJahr.Value :=Ja;
             JPosTabVRENUM.Value :=JourTabVRENUM.Value;
             JPosTabQuelle.Value  :=VK_AGB;

             JPosTab.Post;
             JPosTab.Next;
          end;

          JPosTab.Close;
          JourTab.Close;
          Transact1.Commit;

       except
          MessageDlg ('Fehler beim Buchen des Angebotes !',mterror,[mbok],0);
          Transact1.RollBack;
          Result :=-1;
       end;
     finally
       Transact1.AutoCommit :=True;
       //Transact1.TransactSafe :=False;
     end;
end;
//------------------------------------------------------------------------------
Function tDM1.CheckBankverbindung (addr_id:integer) : boolean;
begin
     Result :=False;
     KunTab.Close;
     KunTab.ParamByName ('ID').AsInteger :=addr_id;
     KunTab.Open;
     if not KunTab.Eof then
     begin
       try
         Result :=(length(KunTabBLZ.AsString)=8)and
                  (length(KunTabKTO.AsString)>1)and
                  (length(KunTabBank.AsString)>3)and
                  (StrToInt(KunTabBLZ.AsString)>0);

       except
         Result :=False;
       end;
     end else Result :=False;
     KunTab.Close;
end;
//------------------------------------------------------------------------------
Function tDM1.GetBankverbindung (addr_id:integer; Var BLZ : Integer; var KTO : String) : boolean;
var OK : Boolean;
begin
     OK :=False;
     KunTab.Close;
     KunTab.ParamByName ('ID').AsInteger :=addr_id;
     KunTab.Open;
     if not KunTab.Eof then
     begin
       try
         OK :=(length(KunTabBLZ.AsString)=8)and
              (length(KunTabKTO.AsString)>1)and
              (length(KunTabBank.AsString)>3)and
              (StrToInt(KunTabBLZ.AsString)>0);
       except
         OK :=False;
       end;
     end else Result :=OK;

     if OK then
     begin
       BLZ :=StrToInt (KunTabBLZ.AsString);
       KTO :=KunTabKTO.AsString;
     end;

     KunTab.Close;
     Result :=OK;
end;
//------------------------------------------------------------------------------
function tDM1.Buche_Einkauf (Journal_ID : Integer):Integer; // liefert Belegnummer zurück
var NewEK,
    NewMenge,
    OldEK,
    OldMenge,
    BM,ABM,
    Faktor,
    FaktorWGR,
    N,B       : Double;

    UseRabGrp : Boolean;
    STA,OFF,
    SUM, I    : Integer;
    LastID    : Integer;
begin
     Result :=-1;
     UseRabGrp :=False;
     Transact1.AutoCommit :=False;
     //Transact1.TransactSafe :=True;
     try
       try
          JourTab.Close;
          JourTab.ParamByName ('ID').Value :=Journal_ID;
          JourTab.Open;
          JourTab.Edit;
          // neue Rechnungsnummer holen
          JourTabVRENUM.Value  :=IncNummer (EK_RECH);

          Result :=JourTabVRENUM.Value;

          JourTabIST_Betrag.Value :=0;
          JourTabIST_Anzahlung.Value :=0;
          JourTabMAHNKOSTEN.Value :=0;
          JourTabFreigabe1_Flag.Value :=False;


          // Lieferantendaten (Zahlungsart) aktualisieren,
          // falls diese noch nicht zugewiesen ist
          KunTab.Close;
          KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
          KunTab.Open;
          if KunTab.RecordCount=1 then
          begin
             KunTab.Edit;
             if KunTabKrd_Num.Value<1 then
             begin
               // Wenn noch keine KRD-NUM, dann neue Nummer zuweisen
               KunTabKrd_Num.Value :=IncNummer (KRD_NUM_KEY);
               JourTabGEGENKONTO.Value :=KunTabKrd_Num.Value;
               // Bitcodiertes Flag für "ist Lieferant" setzen
               KunTabSTATUS.AsInteger :=KunTabSTATUS.AsInteger or 16;
             end;
             if KunTabLief_Zahlart.AsInteger<0
              then KunTabLief_Zahlart.Value :=JourTabZahlart.Value;
             KunTab.Post;
          end;


          case JourTabZahlart.Value of
             //bar bzw. scheck
             1,5:begin
                 if JourTabSOLL_SKONTO.Value>0 then
                 begin
                    JourTabStadium.Value :=80+JourTabZahlart.Value;
                    JourTabIST_SKONTO.Value :=JourTabSOLL_SKONTO.Value;
                    JourTabIST_ANZAHLUNG.Value :=0;
                    JourTabIST_ZAHLDAT.Value :=JourTabRDatum.Value;
                    JourTabIST_BETRAG.Value :=
                      JourTabBSumme.Value-(JourTabBSumme.Value / 100)*JourTabSOLL_SKONTO.Value;
                 end
                    else
                 begin
                    JourTabStadium.Value :=90+JourTabZahlart.Value;
                    JourTabIST_SKONTO.Value :=0;
                    JourTabIST_ANZAHLUNG.Value :=0;
                    JourTabIST_ZAHLDAT.Value :=JourTabRDatum.Value;
                    JourTabIST_BETRAG.Value :=JourTabBSumme.Value;
                 end;
               end;
             //Überweisung, NN, Lastschrift, EC-Karte
             2,3,4,6,9:JourTabStadium.Value :=20+JourTabZahlart.Value;
          end;

          JourTabQuelle.Value         :=EK_RECH;
          JourTabKONTOAUSZUG.Value    :=-1;
          JourTabUW_NUM.Value         :=-1;
          JourTabBANK_ID.Value        :=-1;
          JourTabFREIGABE1_Flag.Value :=False;

          // Wenn MWST-Freier Einkauf dann alle MWST-Felder löschen
          if JourTabMWST_FREI_FLAG.AsBoolean then
          begin
             JourTabMWST_0.AsInteger :=0;
             JourTabMWST_1.AsInteger :=0;
             JourTabMWST_2.AsInteger :=0;
             JourTabMWST_3.AsInteger :=0;
             JourTabMSUMME_0.AsFloat :=0;
             JourTabMSUMME_1.AsFloat :=0;
             JourTabMSUMME_2.AsFloat :=0;
             JourTabMSUMME_3.AsFloat :=0;
             JourTabMSUMME.AsFloat   :=0;
             JourTabBSUMME.AsFloat   :=JourTabNSUMME.AsFloat;
          end;

          JourTab.Post;


          if JourTabZahlArt.Value = 1 then  // Kassenbuchung
          begin
             BucheKasse (JourTabIST_Zahldat.AsDateTime,
                         EK_RECH,
                         JourTabRec_ID.Value,
                         Inttostr(JourTabVReNum.Value),
                         JourTabGegenKonto.Value,
                         JourTabIST_Skonto.Value,
                         JourTabIST_Betrag.Value*-1, // negativ, da Ausgabe !!!
                         'ZA EK-RE '+JourTabKun_Name1.Value);
          end;

          JPosTab.Close;
          JPosTab.ParamByName ('ID').Value :=Journal_ID;
          JPosTab.Open;

          while not JPosTab.Eof do
          begin
             try
               JPosTab.Edit;

               //MWST_Code löschen, wenn MwSt-freier Beleg
               if JourTabMWST_FREI_FLAG.AsBoolean
                 then JPosTabSteuer_Code.Value :=0;

               // EK-Preis, letzter EK, letzt. Lief, Lief-Datum
               // im Artikelstam aktualisieren !!!
               UpdateArtTab.Close;
               UpdateArtTab.ParamByName ('ID').AsInteger :=JPosTabARTIKEL_ID.Value;
               UpdateArtTab.Open;
               if UpdateArtTab.RecordCount=1 then
               begin
                 //UseRabGrp :=length(UpdateArtTab.FieldByName ('RABGRP_ID').AsString)>0;
                 UseRabGrp :=(length(UpdateArtTab.FieldByName('RABGRP_ID').AsString)>0)and
                             (UpdateArtTab.FieldByName ('RABGRP_ID').AsString<>'-');


                 try
                   UpdateArtTab.Edit;

                   OldEK    :=UpdateArtTab.FieldByName ('EK_PREIS').AsFloat;
                   OldMenge :=UpdateArtTab.FieldByName ('MENGE_AKT').AsFloat;

                   NewEK    :=JPosTabEPREIS.AsFloat;
                   NewMenge :=JPosTabMenge.AsFloat;

                   if JPosTabRabatt.Value<>0 then
                   begin
                      if JPosTabRabatt.Value = 100 then NewEK :=0 else
                      NewEK :=NewEK - (NewEK * JPosTabRabatt.Value / 100);
                   end;

                   NewMenge :=CAO_round(JPosTabMenge.AsFloat * 100)/100; // auf 2 Nachkommastellen


                   UpdateArtTab.FieldByName ('LAST_EK').AsFloat  :=CAO_round(NewEK*1000)/1000; // auf 3 Nachkommastellen
                   UpdateArtTab.FieldByName ('LAST_LIEF').AsInteger :=JourTabAddr_ID.Value;
                   UpdateArtTab.FieldByName ('LAST_LIEFDAT').AsDateTime :=JourTabRDatum.AsDateTime;


                   // Lieferantenpreis anlegen bzw. aktualisieren
                   UpdateArtikelPreis (EK_RECH,
                                       JPosTabARTIKEL_ID.Value,
                                       JourTabAddr_ID.Value,
                                       NewEK);

                   // EK Berechnen (Mittelwert)
                   if (OldMenge+NewMenge<>0)and(OldMenge>=0)
                     then NewEK :=(NewEK * NewMenge + OldEK * OldMenge) / (OldMenge+NewMenge);

                   // nur Speichern, wenn keine Rabattgruppe gesetzt
                   if not UseRabGrp then
                   begin
                       UpdateArtTab.FieldByName ('EK_PREIS').AsFloat :=CAO_round(NewEK*1000)/1000; // auf 3 Nachkommastellen


                       // Berechnung von VK-Preisen wenn Kalkulationsfaktoren verwendet werden
                       for i:=1 to AnzPreis do
                       begin
                          Faktor :=GCalcFaktorTab[i];
                          FaktorWgr :=0;
                          GetWGRCalcFaktor(UpdateArtTab.FieldByName ('WARENGRUPPE').AsInteger,i,FaktorWgr);
                          if FaktorWgr <> 0 then Faktor :=FaktorWgr;

                          if (Faktor>0) then
                          begin
                             N :=CAO_round(NewEK * Faktor * 100) / 100;

                             UpdateArtTab.FieldByName ('VK'+IntToStr(i)).AsFloat :=N;

                             B :=N * (100+MwStTab[UpdateArtTab.FieldByName ('STEUER_CODE').AsInteger]);

                             B :=CAO_Round (B / BR_RUND_WERT) * BR_RUND_WERT / 100;

                             UpdateArtTab.FieldByName ('VK'+IntToStr(i)+'B').AsFloat :=B
                          end;
                       end;
                   end;


                   //Bestelmenge aus Artikel holen
                   ABM :=UpdateArtTab.FieldByName ('MENGE_BESTELLT').AsFloat;

                   UpdateArtTab.Post;
                 except
                   UpdateArtTab.Cancel;
                   MessageDlg ('Fehler beim aktualisieren der Artikel-Mengen.',mterror,[mbok],0);
                 end;
               end
               else ABM :=999999;

               UpdateArtTab.Close;

               // Artikel Buchen
               if (JPosTabGebucht.Value=False)and
                  (JPosTabArtikelTyp.Value='N')and
                  (JPosTabARTIKEL_ID.Value>-1) then
               begin
                  if JPosTabQUELLE_SRC.AsInteger>0 then
                  begin

                    // Bestellmenge aktualisieren
                    BM :=JPosTabMenge.AsFloat;

                    //Nachschauen, ob die Menge größer als die Best.-Menge ist und ggf. die Menge vermindern
                    uniquery.close;
                    uniquery.sql.text :='select MENGE from JOURNALPOS where QUELLE=6 and REC_ID='+IntToStr(JPosTabQUELLE_SRC.AsInteger);
                    uniquery.open;

                    if (UniQuery.RecordCount=1) then
                    begin
                       if BM > UniQuery.FieldByName('MENGE').AsFloat
                        then BM :=UniQuery.FieldByName('MENGE').AsFloat;
                    end else BM :=0;

                    uniquery.close;

                    // Artikel-Bestellmenge darf nicht < 0 sein !!!
                    if ABM-BM<0 then BM :=ABM;

                  end else BM :=0; // war kein Artikel aus einer Bestellung


                  // Lager-Menge erhöhen
                  ArtMengeTab.Close;
                  ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.Value;
                  ArtMengeTab.ParamByName ('SUBMENGE').Value :=(CAO_round(JPosTabMenge.Value*100)/100)*-1;
                  //Bestellmenge erniedrigen
                  ArtMengeTab.ParamByName ('BMENGE').Value :=BM; // Menge wird abgezogen
                  ArtMengeTab.ExecSql;
                  JPosTabGebucht.Value :=True;
               end;


               // Daten aktualisieren
               JPosTabVRENUM.Value :=JourTabVRENUM.Value;
               JPosTabQuelle.Value  :=EK_RECH;

               JPosTab.Post;
             except
               JPosTab.Cancel;
               MessageDlg ('Fehler beim aktualisieren der EK-Positionen',mterror,[mbok],0);
             end;
             //Seriennumern aktualisieren
             try
               dm1.UniQuery.close;
               dm1.UniQuery.sql.text :='UPDATE ARTIKEL_SERNUM SET EINK_NUM='+
                                       IntToStr(JourTabVRENUM.AsInteger)+
                                       ' where EK_JOURNALPOS_ID='+
                                       IntToStr(JPosTabRec_ID.AsInteger);
               dm1.UniQuery.ExecSql;
               dm1.UniQuery.close;
             except
               MessageDlg ('Fehler beim aktualisieren der Seriennummern.',mterror,[mbok],0);
             end;

             // im Artkikel die MENGE_VKRE_EDI aktualisieren
             UpdateArtikelEdiMenge (EK_RECH_EDI, JPosTabArtikel_ID.AsInteger,0);

             JPosTab.Next;
          end;

          // Status der Bestellungen dieses Lieferanten aktualisieren
          uniquery.close;
          uniquery.sql.clear;
          uniquery.sql.add ('select');
          uniquery.sql.add ('JOURNAL.REC_ID,SUM(JP2.MENGE) as ');
          uniquery.sql.add ('MENGE_EK,JOURNALPOS.MENGE as MENGE_BEST');
          uniquery.sql.add ('from JOURNALPOS, JOURNAL');
          uniquery.sql.add ('left outer join JOURNALPOS as JP2 on ');
          uniquery.sql.add ('JP2.QUELLE_SRC = JOURNALPOS.REC_ID and JP2.QUELLE<>15');
          uniquery.sql.add ('where JOURNAL.QUELLE=6 and JOURNALPOS.QUELLE=6 and ');
          uniquery.sql.add ('JOURNALPOS.ADDR_ID='+Inttostr(JourTabAddr_ID.AsInteger));
          uniquery.sql.add ('and (JOURNALPOS.ARTIKELTYP="N" or ');
          uniquery.sql.add ('JOURNALPOS.ARTIKELTYP="S") and ');
          uniquery.sql.add ('JOURNAL.REC_ID=JOURNALPOS.JOURNAL_ID and ');
          uniquery.sql.add ('JOURNAL.STADIUM>=20 and JOURNAL.STADIUM<100');
          uniquery.sql.add ('group by JOURNALPOS.REC_ID');

          LastID :=-1;
          try
             uniquery.open;

             while not uniquery.eof do
             begin
                if LastID <> UniQuery.FieldByName ('REC_ID').AsInteger then
                begin
                  if LastID<>-1 then
                  begin
                    if off=0 then STA :=100 else
                    if off=sum then STA :=20 else STA :=30;

                    uniquery2.close;
                    uniquery2.sql.text :='UPDATE JOURNAL SET STADIUM='+
                                         Inttostr(STA)+
                                         ' WHERE QUELLE=6 and REC_ID='+
                                         Inttostr(LastID);
                    uniquery2.execsql;
                  end;
                  sum :=0;
                  off :=0;
                  LastID :=UniQuery.FieldByName ('REC_ID').AsInteger;
                end;
                sum :=sum + UniQuery.FieldByName ('MENGE_BEST').AsInteger;
                off :=off + (UniQuery.FieldByName ('MENGE_BEST').AsInteger -
                             UniQuery.FieldByName ('MENGE_EK').AsInteger);

                uniquery.next;
             end;
             if LastID<>-1 then
             begin
                if off<1 then STA :=100 else
                 if off=sum then STA :=20 else STA :=30;

                uniquery2.close;
                uniquery2.sql.text :='UPDATE JOURNAL SET STADIUM='+
                                     Inttostr(STA)+
                                     ' WHERE QUELLE=6 and REC_ID='+
                                     Inttostr(LastID);
                uniquery2.execsql;
             end;
          except
             MessageDlg ('Fehler beim aktualisieren der EK-Bestellungen.',mterror,[mbok],0);
          end;
          uniquery.close;

          JPosTab.Close;
          JourTab.Close;
          Transact1.Commit;

       except
          MessageDlg ('Fehler beim Buchen der EK-Rechnung !',mterror,[mbok],0);
          Transact1.RollBack;
          Result :=-1;
       end;
     finally
       Transact1.AutoCommit :=True;
       //Transact1.TransactSafe :=False;
     end;
end;
//------------------------------------------------------------------------------
procedure TDM1.UpdateArtikelPreis (RechTyp, Artikel_ID, Addr_ID : Integer; Preis : Double);
begin
     Uniquery.Close;
//     UniQuery.RequestLive :=True;
     try
        UniQuery.Sql.Text :='select * from ARTIKEL_PREIS where ARTIKEL_ID='+
                            IntToStr(Artikel_ID)+
                            ' and ADRESS_ID='+
                            IntToStr(Addr_ID);
        UniQuery.Open;
        if UniQuery.RecordCount=1 then
        begin
           UniQuery.Edit;
           try
              UniQuery.FieldByName ('PREIS').AsFloat :=Preis;
              UniQuery.FieldByName ('GEAEND').AsDateTime :=Now;
              UniQuery.FieldByName ('GEAEND_NAME').AsString :=View_User;

              UniQuery.Post;
           except
              UniQuery.Cancel;
           end;

        end else
        if UniQuery.RecordCount=0 then
        begin
           // neuen Eintrag anlegen
           UniQuery.Append;
           try
              UniQuery.FieldByName ('ARTIKEL_ID').AsInteger :=Artikel_ID;
              UniQuery.FieldByName ('ADRESS_ID').AsInteger :=Addr_ID;
              UniQuery.FieldByName ('PREIS_TYP').AsInteger :=RechTyp;
              UniQuery.FieldByName ('PREIS').AsFloat :=Preis;
              UniQuery.FieldByName ('GEAEND').AsDateTime :=Now;
              UniQuery.FieldByName ('GEAEND_NAME').AsString :=View_User;

              UniQuery.Post;
           except
              UniQuery.Cancel;
           end;
        end;
     finally
        Uniquery.Close;
//        UniQuery.RequestLive :=False;
     end;


     { Ab 1.3 ...

     delete from ARTIKEL_BDATEN;
     insert into ARTIKEL_BDATEN
     select ARTIKEL_ID, QUELLE, SUM(MENGE) from JOURNALPOS
     where QUELLE IN (13,15,16) and ARTIKELTYP IN ('N','S') and ARTIKEL_ID>0
     group by ARTIKEL_ID, QUELLE;

     }
end;
//------------------------------------------------------------------------------
function tDM1.Buche_EKBest (Journal_ID : Integer):Integer; // liefert EK-BST-Nummer zurück
var Pos      : Integer;
    NewEK    : Double;
begin
     Result :=-1;
     Transact1.AutoCommit :=False;
     //Transact1.TransactSafe :=True;
     try
       try
          JourTab.Close;
          JourTab.ParamByName ('ID').Value :=Journal_ID;
          JourTab.Open;
          JourTab.Edit;
          // neue Nummer holen
          JourTabVRENUM.Value  :=IncNummer (EK_BEST);

          Result :=JourTabVRENUM.Value;

          JourTabSTADIUM.Value :=0;
          //JourTabJahr.Value    :=ja;
          JourTabRDatum.AsDateTime:=now;
          JourTabQuelle.Value  :=EK_BEST;

          JourTabKONTOAUSZUG.Value :=-1;
          JourTabUW_NUM.Value :=-1;
          JourTabBANK_ID.Value :=-1;

          JourTabIST_Betrag.Value :=0;
          JourTabIST_Anzahlung.Value :=0;
          JourTabFreigabe1_Flag.Value :=False;

          JourTabStadium.AsInteger :=20;


          // Wenn MWST-Freie Bestellung dann alle MWST-Felder löschen
          if JourTabMWST_FREI_FLAG.AsBoolean then
          begin
             JourTabMWST_0.AsInteger :=0;
             JourTabMWST_1.AsInteger :=0;
             JourTabMWST_2.AsInteger :=0;
             JourTabMWST_3.AsInteger :=0;
             JourTabMSUMME_0.AsFloat :=0;
             JourTabMSUMME_1.AsFloat :=0;
             JourTabMSUMME_2.AsFloat :=0;
             JourTabMSUMME_3.AsFloat :=0;
             JourTabMSUMME.AsFloat   :=0;
             JourTabBSUMME.AsFloat   :=JourTabNSUMME.AsFloat;
          end;


          // Lieferantendaten (Zahlungsart) aktualisieren,
          // falls diese noch nicht zugewiesen ist
          KunTab.Close;
          KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
          KunTab.Open;
          if KunTab.RecordCount=1 then
          begin
             KunTab.Edit;
             if KunTabKrd_Num.Value<1 then
             begin
               // Wenn noch keine KRD-NUM, dann neue Nummer zuweisen
               KunTabKrd_Num.Value :=IncNummer (KRD_NUM_KEY);
               JourTabGEGENKONTO.Value :=KunTabKrd_Num.Value;
               // Bitcodiertes Flag für "ist Lieferant" setzen
               KunTabSTATUS.AsInteger :=KunTabSTATUS.AsInteger or 16;
             end;
             if KunTabLief_Zahlart.AsInteger<0
              then KunTabLief_Zahlart.Value :=JourTabZahlart.Value;
             KunTab.Post;
          end;


          JourTab.Post;

          JPosTab.Close;
          JPosTab.ParamByName ('ID').Value :=Journal_ID;
          JPosTab.Open;

          Pos :=0;

          while not JPosTab.Eof do
          begin
             JPosTab.Edit;

             //MWST_Code löschen, wenn MwSt-freier Beleg
             if JourTabMWST_FREI_FLAG.AsBoolean
               then JPosTabSteuer_Code.Value :=0;

             // Position schreiben, aber nur bei Artikeln, nicht bei Text
             if JPosTabArtikelTyp.Value<>'T' then
             begin
                  Inc(Pos);
                  JposTabView_Pos.Value :=Inttostr(Pos);
             end;

             // Artikel Buchen  (Bestellmenge  erhöhen)
             if (JPosTabArtikelTyp.Value='N')and
                (JPosTabARTIKEL_ID.Value>-1) then
             begin
                // Menge nicht verändern !!!
                ArtMengeTab.Close;
                ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.Value;
                ArtMengeTab.ParamByName ('SUBMENGE').Value :=0;
                //Bestellmenge erhöhen
                ArtMengeTab.ParamByName ('BMENGE').Value :=JPosTabMenge.Value*-1; // Menge wird abgezogen, daher - ( - * - = +)
                ArtMengeTab.ExecSql;
                JPosTabGebucht.Value :=True;

                // Lieferanten im Artikelstamm aktualisieren

                NewEK    :=JPosTabEPREIS.AsFloat;

                if JPosTabRabatt.Value<>0 then
                begin
                  if JPosTabRabatt.Value = 100
                   then NewEK :=0
                   else NewEK :=NewEK - (NewEK * JPosTabRabatt.Value / 100);
                end;


                //Lieferantenpreis erstellen bzw. aktualisieren
                UpdateArtikelPreis (EK_RECH,
                                    JPosTabARTIKEL_ID.Value,
                                    JourTabAddr_ID.Value,
                                    NewEK);
             end;

             // Daten aktualisieren
             JPosTabVRENUM.Value :=JourTabVRENUM.Value;
             JPosTabQuelle.Value  :=EK_BEST;

             JPosTab.Post;

             // im Artkikel die MENGE_VKRE_EDI aktualisieren
             UpdateArtikelEdiMenge (EK_BEST_EDI, JPosTabArtikel_ID.AsInteger,0);

             JPosTab.Next;
          end;

          JPosTab.Close;
          JourTab.Close;
          Transact1.Commit;

       except
          MessageDlg ('Fehler beim Buchen der EK-Bestellung !',mterror,[mbok],0);
          Transact1.RollBack;
          Result :=-1;
       end;
     finally
       Transact1.AutoCommit :=True;
       //Transact1.TransactSafe :=False;
     end;
end;
//------------------------------------------------------------------------------

end.

