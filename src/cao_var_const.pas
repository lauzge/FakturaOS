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
Modul        : CAO_VAR_CONST
Stand        : 27.07.2003
Version      : 1.1.1.10
Beschreibung : allgemeines Variablen- und Typdeklarationen,
               die global allen anderen Modulten zur Verfügung stehen müssen

}

{ History :

- 13.01.2003 Version 1.0.0.48 released Jan Pokrandt
- 26.04.2003 Version 1.0.0.53 released Jan Pokrandt
- 01.07.2003 Anpassungen an MandantRec
- 27.07.2003 diverse Änderungen im Shop-Bereich
- 30.07.2003 KL Hersteller-ID bei tShopArtikel hinzugefügt

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_var_const;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

type tShopArtikelTyp = (saArtikel, saTKosten, saMMZuschlag);

type MandantRec = Record
          Name          : String;
          Server        : String;
          User          : String;
          Pass          : String;
          DB            : String;
          ShowLoginDlg  : Boolean;
          UseNTUserName : Boolean;
          Port          : Integer;
          {$IFDEF AVE}
          UseSsh        : Boolean;
          {$ENDIF}
     end;

type tShopRePosOpt = Record
       Name     : String;
       Value    : String;
       //Aufpreis : Double;
     end;

type tShopPositionen = Record
       Menge  : Double;
       ME     : String;
       Modell : String;
       Name   : String;
       Preis  : Double;
       MwSt   : Double;
       MwStID : Integer;
       SArtID : Integer;
       ArtTyp : tShopArtikelTyp;

       Opt    : Array of tShopRePosOpt
     end;

type tShopSummen = Record
       Titel,
       Value  : String;
     end;

type tShopRech = Record
       // Kopf
       Rech_ID        : Integer;
       Kun_ID         : Integer;
       Datum          : tDateTime;
       Waehrung       : String;
       Kurs           : Double;
       // diverses
       Tele,
       Mail           : String;
       // Rechnungsanschrift
       R_Firma,
       R_Name,
       R_Strasse,
       R_PLZ,
       R_Ort,
       R_BLand,
       R_Land,
       //Lieferanschrift
       L_Firma,
       L_Name,
       L_Strasse,
       L_PLZ,
       L_Ort,
       L_BLand,
       L_Land         : String;

       Kun_GebDatum   : tDateTime;

       //Positionen
       Pos            : Array of tShopPositionen;

       //Summen
       Summen         : Array of tShopSummen;

       //Versandkosten  : Double;

       UserKomment    : String;
       Status         : Integer;


       PaymentMethod  : String;
       PaymentClass   : String;

       ShippingMethod : String;
       ShippingClass  : String;

       BANK_NAME,
       BANK_BLZ,
       BANK_KTO,
       BANK_INH       : String;
       BANK_STATUS    : Integer;
     end;

type tLangTxt = Record
       SprachID   : Integer;
       SprachCode : String;
       SprachName : String;
       Name       : String; //Prod.-Name
       URL        : String; //Prod.-URL
       Text       : String; //Prod.-Beschreibung
     end;

type tShopArtikel = Record
       ID         : Integer;
       Menge      : Double;
       Modell     : String;
       Bild       : String;
       Bild_M     : String;
       Bild_G     : String;
       PreisN     : Double; // Netto
       //PreisB     : Double; // Brutto
       Gewicht    : Double;
       Status     : Integer;
       //MwSt       : Double;
       MwStID     : Integer;
       Hersteller : Integer;
       DatErst    : tDateTime;
       DatMod     : tDateTime;
       DatAvi     : tDateTime;
       MeVK       : Integer;
       Txt        : Array of tLangTxt;
     end;

type tShopKunde = Record
       ID         : Integer;
       VName      : String;
       Name       : String;
       PR_EBENE   : Integer;
       GebDatum   : tDateTime;
       Geschlecht : Char;
       eMail      : String;
       Tele       : String;
       Fax        : String;
       KundeSeit  : tDateTime;

       // Default-Anschrift
       L_VName    : String;
       L_Name     : String;
       L_Firma    : String;
       L_Strasse  : String;
       L_Ort      : String;
       L_PLZ      : String;
       L_Land     : String;
     end;


type tShopKatDescr = Record
       SprachID   : Integer;
       SprachCode : String;
       SprachName : String;
       Name       : String; //Kat.-Name
     end;

type tShopKatalog = Record
       ID           : Integer;
       ParentID     : Integer;
       ImageUrl     : String;
       SortOrder    : Integer;
       DateAdded    : tDateTime;
       LastModified : tDateTime;
       Descr        : array of tShopKatDescr;
       ProdList     : array of Integer;
     end;


type tShopHerDescr = Record
       SprachID        : Integer;
       SprachCode      : String;
       SprachName      : String;
       HERSTELLER_URL  : String;
       URL_CLICKED     : Integer;
       DATE_LAST_CLICK : tDateTime;
     end;

type tShopHersteller = Record
       ID           : Integer;
       Hersteller_Name  : String;
       HERSTELLER_IMAGE : String;
       DateAdded    : tDateTime;
       LastModified : tDateTime;

       Descr        : array of tShopHerDescr;
       //ProdList     : array of Integer;
     end;


type TOnUpdateStatusBar = procedure (SuchZeit,
                                     Datensatz,
                                     Sortierung,
                                     Erstellt,
                                     Geaendert : String) of Object;

const  BANK1         = 1201;
       KASSE1        = 1301;

       VK_AUF        = 8;
       VK_AUF_EDI    = 18;
       VK_AGB        = 1;
       VK_AGB_EDI    = 11;
       VK_LIEF       = 2;
       VK_LIEF_EDI   = 12;
       VK_RECH       = 3;
       VK_RECH_EDI   = 13;
       VK_WKRE_EDI   = 23; // wiederkehrende Rechnungen
       EK_RECH       = 5;
       EK_RECH_EDI   = 15;
       EK_BEST       = 6;
       EK_BEST_EDI   = 16;

       VK_KASSE      = 23;

       UEBERWEISUNG  = 110;

       KRD_NUM_KEY   = 30;
       DEB_NUM_KEY   = 31;

       KRD_OPOS      = 40;
       DEB_OPOS      = 41;

       KAS_BUCH      = 50;

       MAHNUNG       = 60;
       TEXTVERARB    = 97;
       ARTNUM_KEY    = 98;
       KUNNUM_KEY    = 99;


       // Modul-ID's bzw. Tabellen-ID's

       MOD_ADRESSEN  = 50;  // Tabelle ADRESSEN
       MOD_ADDR_LIEF = 51;  // Tabelle ADRESSEN_LIEF
       MOD_ADDR_ASP  = 52;  // Tabelle APARTNER

       MOD_ARTIKEL   = 55;
       MOD_ART_SLIST = 56;
       MOD_ART_LTEXT = 57;

       MOD_KFZ       = 60;
       MOD_MITARB    = 65;
       MOD_VERTR     = 70;
       MOD_NOTIZ     = 75;











{$IFDEF GNU_SOURCE}
const GNU : Boolean = True;
{$ELSE}
const GNU : Boolean = False;
{$ENDIF}

implementation


end.
