{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2004 Jan Pokrandt / Jan@JP-SOFT.de

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
Modul        : CAO_MAIN
Stand        : 16.05.2004
Version      : 1.2.5.4
Beschreibung : allgemeines Grundmodul,
               welches alle anderen Module in die Oberfläche einbindet

History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
17.01.2003 - Warnmeldung eingebaut, wenn Plattform nicht Windows NT, 2000 oder XP
01.02.2003 - Outlook-Bar durch Komponente aus der Jedi-VCL ersetzt
19.02.2003 - URL im Online-Update korregiert
26.04.2003 - Link zum Anwenderforum im Hilfemenü hinzugefügt
15.05.2003 - Caption der Form geändert, wenn GNU-Version compiliert wird
14.06.2003 - Einbindung des ShopTransfer-Modules
06.07.2003 - Neue Buttons im Outlookbar hinzugefügt
13.07.2003 - Menü für Mandanten geändert
19.07.2003 - Fibu-Buchungen und Fibu-Konten entfernt
22.07.2003 - neues Shopsetup eingebunden
29.07.2003 - DP: HTML-Hilfe + Wartungsdaten eingebunden
02.08.2003 - Online-Update deaktiviert
29.08.2003 - Module werden jetzt über die Tag-Eigenschaft der Buttons ausgewählt
23.10.2003 - PIM wird jetzt automatisch gestartet,
             damit das Terminpopup bei fälligen Terminen kommt
25.10.2003 - JumpTo um neue Vorgänge erweitert
12.03.2004 - neuen Hotkey ALT-F12 für Zurück eingebaut

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MAIN;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  {$IFDEF AVE}cao_shop_d5_main,CAO_Shop_Transfer_AVE,{$ELSE}CAO_ShopTrans,{$ENDIF}
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, Buttons, Menus, JvOutlookBar, JvLED, PrintersDlgs, ZSqlMonitor,
  CAO_Kunde, CAO_Artikel1, CAO_About, CAO_Startup, CAO_ShopSetup, CAO_Backup,
  CAO_KFZ1, CAO_Statistic, CAO_MakeEKRech, CAO_MahnlaufDlg;

type

  { TMainForm }

  TMainForm = class(TForm)
    FindDialog1: TFindDialog;
    ConnectLED: TJvLED;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Mandant2: TMenuItem;
    Datenbankprfenoptimierenreparieren1: TMenuItem;
    Datensicherung1: TMenuItem;
    Einstellungen1: TMenuItem;
    Druckereinrichten1: TMenuItem;
    EKPreiseanzeigen1: TMenuItem;
    Beenden1: TMenuItem;
    Journale1: TMenuItem;
    Fibu1: TMenuItem;
    Log1: TMenuItem;
    CAOHandbuch1: TMenuItem;
    ber1: TMenuItem;
    Intro1: TMenuItem;
    JPSOFTHomepage1: TMenuItem;
    Anwenderforum1: TMenuItem;
    eMailandenEntwickler1: TMenuItem;
    Adressen1: TMenuItem;
    Artikel1: TMenuItem;
    Fahrzeugstamm1: TMenuItem;
    Auftrag1: TMenuItem;
    MenuItem4: TMenuItem;
    Lieferschein1: TMenuItem;
    Einkauf1: TMenuItem;
    EKBestellungbearbeiten1: TMenuItem;
    Mahnungenerstellen1: TMenuItem;
    Auftrag2: TMenuItem;
    Angebot2: TMenuItem;
    Lieferschein2: TMenuItem;
    Kasse1: TMenuItem;
    Einkaufsjournal1: TMenuItem;
    Bestelljournal1: TMenuItem;
    Kassenbuch1: TMenuItem;
    berweisungen1: TMenuItem;
    Lastschriften1: TMenuItem;
    ExportFibu1: TMenuItem;
    Statistik1: TMenuItem;
    Shoptransfer1: TMenuItem;
    Zahlungsausgang1: TMenuItem;
    Zahlungseingang1: TMenuItem;
    Rechnung2: TMenuItem;
    TextverarbeitungBriefe1: TMenuItem;
    Vertrgebearbeiten1: TMenuItem;
    Rechnung1: TMenuItem;
    Vertreter1: TMenuItem;
    PIMTermine1: TMenuItem;
    Mitarbeiter: TMenuItem;
    Notizen1: TMenuItem;
    N13: TMenuItem;
    Zurck1: TMenuItem;
    N12: TMenuItem;
    RegisteryEditor1: TMenuItem;
    N11: TMenuItem;
    Tools1: TMenuItem;
    N10: TMenuItem;
    N9: TMenuItem;
    N8: TMenuItem;
    Vorgnge1: TMenuItem;
    N7: TMenuItem;
    Stammdaten1: TMenuItem;
    N6: TMenuItem;
    OnlineUpdate1: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    ShopEinstellungen1: TMenuItem;
    N2: TMenuItem;
    Rcksicherung1: TMenuItem;
    N1: TMenuItem;
    OlBarImgList: TImageList;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Timer1: TTimer;
    VorgangImgList: TImageList;
    OLBar: TJvOutlookBar;
    Panel1: TPanel;
    MainPanel: TPanel;
    Panel2: TPanel;
    ZMonitor1: TZSQLMonitor;
    ZurueckBtn: TSpeedButton;
    Splitter1: TSplitter;
    SBar: TStatusBar;
    procedure Anwenderforum1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure ber1Click(Sender: TObject);
    procedure CAOHandbuch1Click(Sender: TObject);
    procedure Datenbankprfenoptimierenreparieren1Click(Sender: TObject);
    procedure Datensicherung1Click(Sender: TObject);
    procedure Druckereinrichten1Click(Sender: TObject);
    procedure Einstellungen1Click(Sender: TObject);
    procedure EKPreiseanzeigen1Click(Sender: TObject);
    procedure eMailandenEntwickler1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Intro1Click(Sender: TObject);
    procedure JPSOFTHomepage1Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure ModulAuswahlClick(Sender: TObject);
    procedure OLBarButtonClick(Sender: TObject; Index: Integer);
    procedure Rcksicherung1Click(Sender: TObject);
    procedure RegisteryEditor1Click(Sender: TObject);
    procedure ShopEinstellungen1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Wechseln1Click(Sender: TObject);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure ZurueckBtnClick(Sender: TObject);
  private
    { Private-Deklarationen}
    LastDate    : tDateTime; //Merker für akt. Tag, wird zur erkennung eines
                             //Tageswechsels verwendet
    LastMenu    : tMainMenu;
    LastOEPage,
    LastOEButton,
    LastOEPage2,
    LastOEButton2 : Integer;

    help_enabled  : Boolean;

    procedure OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String);
    procedure SetHelpContext;
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
  public
    { Public-Deklarationen}

    {$IFDEF MULTILANG}CAOMultiLang: TCAOMultiLang;{$ENDIF}

    MainTVText       : String;
    F9               : Boolean;
    SScreenDelay     : Integer;
    AddrForm         : tAdressForm; // für Belegerstellung Adressdialog
    ArtForm          : tArtikelForm;
    KFZForm2         : tKFZForm;

    {$IFDEF WITHHELP}mHHelp : THookHelpSystem;{$ENDIF}

//    InventurForm     : TInventurForm;
//    ExportFibuForm   : TExportFibuForm;
    MahnForm         : TMahnForm;
    {$IFDEF AVE}
    ShopMainForm     : TShopMainForm;
    AVEShopTransForm : TAVEShopTransForm;
    {$ENDIF}

    {$IFDEF WPTOOLS}
    TextEditForm     : TTextEditForm;
    {$ENDIF}
//    WartungsForm     : TWartungsForm;

//    ZahlForm         : TZahlForm;
//    ZahlAusForm      : TZahlAusForm;
//    UeberweisungForm : TUeberweisungForm;
    StatisticForm    : TStatisticForm;
//    LastschriftForm  : TLastschriftForm;
    {$IFDEF ALPHA}
    EBBestVorForm    : TEBBestVorForm;
    {$ENDIF}

    ActiveModul      : Integer; // gerade ausgewähltes Modul, siehe
                                // Tag-Eigenschaft der Menüpunkte unter [MODUL]

    procedure StarteNewProgramm (Name,Cmd,Dir : String);
    procedure ShowHint (Sender : tObject);

    procedure JumpTo (Modul, ID, Jahr : Integer; BelegNeu : Boolean);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.frm}

uses
  cao_mandantaw, CAO_Info, cao_var_const, CAO_DM, CAO_Logging, CAO_PLZ, CAO_BLZ,
  CAO_RegEdit, CAO_Setup, Inifiles, shellapi, filectrl,  CAO_DBOptimize,
  Cao_Tool1, CAO_Pim, CAO_Export, CAO_Restore, CAO_Mitarbeiter, CAO_Vertreter,
  CAO_FibuKassenbuch, CAO_Journal_EKRE, CAO_MakeVKRech, CAO_MakeVertragRech,
  CAO_MakeEKBest, CAO_Journal_VKKASSE, CAO_Journal_VKAGB, CAO_Journal_VKLIEF,
  CAO_Journal_VKRE, CAO_Journal_EKBEST, VolPeriod;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var chmFile : String;
begin
  Timer1.Enabled :=False;
  LastDate :=Int(Now); // akt. Tag merken

  {$IFDEF MULTILANG}
  CAOMultiLang :=TCAOMultiLang.Create(Self);
  CAOMultiLang.LanguageFile :='german.lng';
  CAOMultiLang.WriteMode    :=lwmAppend;
  CAOMultiLang.WriteLog     :=True;
  {$ENDIF}

//  InventurForm     :=nil;
//  ExportFibuForm   :=nil;
  MahnForm         :=nil;

  {$IFDEF WPTOOLS}
  TextEditForm :=nil;
  {$ENDIF}

  {$IFDEF AVE}
  ShopMainForm  :=nil;
  AVEShopTransForm :=nil;
  {$ELSE}

  // Eintrag für Shopartikel löschen
  OLBar.Pages[4].Buttons[3].Free;

  {$ENDIF}
  SScreenDelay :=0;
  //Scaled:=TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  //Outlook1.ItemDoubleLine :=False;
  OLBar.ActivePageIndex   :=0;
  LastMenu           :=nil;
  LastOEButton       :=0;
  LastOEPage         :=0;
  LastOEPage2        :=0;
  LastOEButton2      :=0;

  ActiveModul        :=-1;

  //-----------------------------------------------------
//  DefCompanyName:= 'SBP';
//  RegUseAppTitle:= False;
  //-----------------------------------------------------


  AddrForm         :=nil;
  ArtForm          :=nil;
  KFZForm2         :=nil;
//  WartungsForm     :=nil;
//  ZahlForm         :=nil;
//  ZahlAusForm      :=nil;
//  UeberweisungForm :=nil;
//  StatisticForm    :=nil;
//  LastschriftForm  :=nil;
  {$IFDEF ALPHA}
  EBBestVorForm    :=nil;
  {$ELSE}
  OLBar.Pages[1].Buttons[4].Free;
  //OLBar.Pages[3].Buttons[4].Free;
  {$ENDIF}

  F9 :=True;

  Application.OnHint :=ShowHint;
  Application.HintColor :=$00DDFFFF;
  Application.HintHidePause :=10000; // 10 Sekunden


  // HTML-Hilfesystem einbinden
  {$IFDEF WITHHELP}
  chmFile := ExtractFilePath(ParamStr(0))+{'cao-faktura.chm'}'caofaq.chm';
  if FileExists(chmFile) then help_enabled := true else help_enabled := false;
  mHHelp := nil;
  mHHelp := THookHelpSystem.Create(chmFile, '', htHHApi);
  Application.OnHelp := FormHelp;
  {$ENDIF}
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SBar.Panels[7].Text :=IntToStr(Width)+' x '+IntToStr(Height);
end;

procedure TMainForm.FormShow(Sender: TObject);
var B : TJvOutlookBarButton;
begin
     SetHelpContext;

     {
     MessageDlg (
       'Aktuelle KW: '+IntToStr(Kalenderwoche(now))+#13#10+
       'Erster Tag der Woche :'+FormatDateTime ('dd.mm.yyyy',FirstDayOfWeek(Now))+#13#10+
       'Letzer Tag der Woche :'+FormatDateTime ('dd.mm.yyyy',LastDayOfWeek(Now))
       ,mtinformation,[mbok],0);
     }

     DM1.C2Color   :=$00DDFFFF; // hellgelb
     DM1.EditColor :=$00A0FFFF;//$009FFF9F; // Hellgrün
     // Statuszeile löschen
     OnUpdateStatusBar('', '', '', '', '');

     // auf Dateiupdate des Online-Updaters prüfen
     if fileexists (extractfilepath(paramstr(0))+'cao_update.exe.dat') then
     begin
       if fileexists (extractfilepath(paramstr(0))+'cao_update.exe.old')
        then deletefile (extractfilepath(paramstr(0))+'cao_update.exe.old');

       renamefile (extractfilepath(paramstr(0))+'cao_update.exe',
                   extractfilepath(paramstr(0))+'cao_update.exe.old');

       renamefile (extractfilepath(paramstr(0))+'cao_update.exe.dat',
                   extractfilepath(paramstr(0))+'cao_update.exe');
     end;

     if assigned (SScreen) then
     begin
       SScreen.PBar.Visible :=False;
       SScreen.Height :=SScreen.Height+SScreen.Height-SScreen.ClientHeight;
       SScreen.Invalidate;
       Application.ProcessMessages;
     end;

     if DM1.AktMandant<>'' then
     begin
        DM1.OpenMandant (DM1.AktMandant, Application.Name, False);
     end;

     if (DM1.AktMandant<>'')and(DM1.MandantOK) then
     begin
       DM1.InitMandantAfterOpen;

       LogForm.LogEnabled  :=DM1.ReadBooleanU ('','SQL_LOG_AKTIV',False);
       LogForm.LogMaxEntry :=DM1.ReadIntegerU ('','SQL_LOG_MAX',LogForm.LogMaxEntry);

       if not DM1.USE_KFZ then
       begin
          if OLBar.Pages[0].Buttons[3].Caption='Fahrzeuge' then
          begin
             OLBar.Pages[0].Buttons[3].Free;
             Fahrzeugstamm1.Visible :=False;
          end;
       end
          else
       begin
          if OLBar.Pages[0].Buttons[3].Caption<>'Fahrzeuge' then
          begin
            B :=OLBar.Pages[0].Buttons.Insert(3);
            B.Caption:='Fahrzeuge';
            B.ImageIndex :=3;
            B.Tag :=1030;
            Fahrzeugstamm1.Visible :=True;
          end;
       end;

       SBar.Panels[0].Text :=dm1.view_user;

       CurrencyString :=DM1.LeitWaehrung;
       CurrencyDecimals	:=2;

       // Modulinitalisierung nach Mandantenwechsel erzwingen !!!
       ArtikelForm.First       :=True;
       AdressForm.First        :=True;
       KFZForm.First           :=True;

       MakeVKREForm.First      :=True;
       MakeVKREForm.SetBelegArt (VK_RECH_EDI);

       MakeEKREForm.First      :=True;

       MakeAGBForm.First       :=True;
       MakeAGBForm.SetBelegArt (VK_AGB_EDI);

       MakeEKBestForm.First    :=True;
       MakeVertragReForm.First :=True;

       // neu, dynamisch erzeugte Fenster freigeben !!!
       if assigned(AddrForm)         then FreeAndNil (AddrForm);
       if assigned(ArtForm)          then FreeAndNil (ArtForm);
       if assigned(KFZForm2)         then FreeAndNil (KFZForm2);
//       if assigned(ZahlForm)         then FreeAndNil (ZahlForm);
//       if assigned(ZahlAusForm)      then FreeAndNil (ZahlAusForm);
//       if assigned(InventurForm)     then FreeAndNil (InventurForm);
       if assigned(MahnForm)         then FreeAndNil (MahnForm);
//       if assigned(UeberweisungForm) then FreeAndNil (UeberweisungForm);
//       if assigned(ExportFibuForm)   then FreeAndNil (ExportFibuForm);
//       if assigned(WartungsForm)     then FreeAndNil (WartungsForm);
//       if assigned(LastschriftForm)  then FreeAndNil (LastschriftForm);
       {$IFDEF ALPHA}
       if assigned(EBBestVorForm)    then FreeAndNil (EBBestVorForm);
       {$ENDIF}

       PIMForm.Init;

       try
          // Letztes Modul wieder herstellen
          OLBar.ActivePageIndex :=DM1.ReadIntegerU ('','LastLeftMenuGrp',0);
          OLBarButtonClick (self, DM1.ReadIntegerU ('','LastLeftMenuBtn',-1));
       except end;

       // F9-Status wiederherstellen
       F9 :=DM1.ReadBooleanU ('','LastF9Status',True);
       EKPreiseanzeigen1.Checked :=F9;
       if ArtikelForm.ArtikelPanel.Parent = MainPanel then ArtikelForm.F9Change  (F9);
       if MakeVkReForm.RePanel.Parent     = MainPanel then MakeVkReForm.F9Change (F9);
       if MakeAGBForm.RePanel.Parent      = MainPanel then MakeAGBForm.F9Change  (F9);


       if GNU then Caption :=Application.Title+' ('+GetProjectVersion+')'+
                             ' - Mandant : '+
                             DM1.AktMandant+
                             '              GNU Compiled Version'
              else Caption :=Application.Title+' ('+
                             {$IFDEF AVE}'AVE-Edition '+{$ELSE}
                             {$IFDEF PRO}'S '+{$ENDIF}{$ENDIF}
                             GetProjectVersion+')'+
                             ' - Mandant : '+
                             DM1.AktMandant+
                             '              © 2004 JP-SOFT / JP und das CAO-Faktura-Team';

       if not Assigned(SScreen)
        then SScreenDelay :=5;
     end
        else
     begin
       if GNU then Caption :=Application.Title+
                             '              GNU Compiled Version'
              else Caption :=Application.Title+' ('+
                             {$IFDEF AVE}'AVE-Edition '+{$ELSE}
                             {$IFDEF PRO}'S '+{$ENDIF}{$ENDIF}
                             GetProjectVersion+')'+
                             '              © 2004 JP-SOFT / JP und das CAO-Faktura-Team';

       if Assigned (SScreen) then
       begin
          SScreen.Free;
          SScreen :=nil;
       end;

       Wechseln1Click (Sender);
     end;
     MainPanel.Color :=clBtnFace;
     Timer1.Enabled :=True;
     Timer1Timer(Sender);

     MainPanel.Width :=MainPanel.Width-1;

     {$IFDEF MULTILANG}
     if not fileexists (extractfilepath(paramstr(0))+CAOMultiLang.LanguageFile) then
     begin
        CAOMultiLang.LanguageFilesDirectory :=ExtractFilePath(ParamStr(0));
        CAOMultiLang.WriteComponentProperties;
     end;

     if fileexists (extractfilepath(paramstr(0))+'english.lng') then
     begin
       CAOMultiLang.InitForm (extractfilepath(paramstr(0))+'english.lng',
                              self);
     end;
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMainForm.Intro1Click(Sender: TObject);
begin
     if not assigned(SScreen) then SScreen :=tStartBox.Create (Application);
     if assigned (SScreen) then
     begin
       SScreen.PBar.Visible :=False;
       SScreen.Height :=SScreen.Height+SScreen.Height-SScreen.ClientHeight;
       SScreen.Modal :=True;
       SScreen.Position :=poMainFormCenter;
       SScreen.FormStyle :=fsNormal;
       SScreen.ShowModal;
       SScreen.Free;
       SScreen :=nil;
     end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.JPSOFTHomepage1Click(Sender: TObject);
begin
     StarteNewProgramm ('http://www.jp-soft.de/cao/','','');
end;
//------------------------------------------------------------------------------
procedure TMainForm.Log1Click(Sender: TObject);
begin
     LogForm.Show;
     if assigned (LastMenu) then MainMenu1.Merge (LastMenu);
end;
//------------------------------------------------------------------------------
procedure TMainForm.OLBarButtonClick(Sender: TObject; Index: Integer);
var I, Modul : integer;
begin
     //ggf. Suchdialog ausblenden
     Finddialog1.CloseDialog;
     Finddialog1.OnFind :=nil;

     if Sender is TJVOutlookBar
      then Modul :=OLBar.Pages[OLBar.ActivePageIndex].Buttons[Index].Tag
      else Modul :=Index; // Aufruf über das Menü


     if (LastOEPage=OLBar.ActivePageIndex)and(LastOEButton=Modul) then exit;

     if assigned(LastMenu) then MainMenu1.Unmerge (LastMenu);
     LastMenu :=Nil;


     // alte Panels aushängen
     I:=0;
     while i <= MainPanel.ControlCount-1 do
     Begin
       with MainPanel.Controls[i] do
       if owner <> self then
       begin
        if Owner=AdressForm        then begin
                                          AdressForm.FormDeactivate  (Sender);
                                          AdressForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=ArtikelForm       then begin
                                          ArtikelForm.FormDeactivate (Sender);
                                          ArtikelForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=KFZForm           then begin
                                          KFZForm.FormDeactivate (Sender);
                                          KFZForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=MitarbeiterForm    then begin
                                          MitarbeiterForm.FormDeactivate (Sender);
                                          MitarbeiterForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=PIMForm            then begin
                                          PIMForm.FormDeactivate (Sender);
                                          PIMForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=VertreterForm    then begin
                                          VertreterForm.FormDeactivate (Sender);
                                          VertreterForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=PLZForm           then begin
                                          PLZForm.FormDeactivate (Sender);
                                          PLZForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=BLZForm           then begin
                                          BLZForm.FormDeactivate (Sender);
                                          BLZForm.OnUpdateStatusBar :=nil;
                                        end;
        {$IFDEF ALPHA}
        if Owner=EBBestVorForm    then begin
                                          EBBestVorForm.FormDeactivate   (Sender);
                                          EBBestVorForm.OnUpdateStatusBar :=nil;
                                        end;
        {$ENDIF}
        if Owner=JournalVKREForm   then begin
                                          JournalVKREForm.FormDeactivate   (Sender);
                                          JournalVKREForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=JournalEKREForm   then begin
                                          JournalEKREForm.FormDeactivate   (Sender);
                                          JournalEKREForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=JournalVKAGBForm  then begin
                                          JournalVKAGBForm.FormDeactivate  (Sender);
                                          JournalVKAGBForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=JournalVKLIEFForm then begin
                                          JournalVKLIEFForm.FormDeactivate (Sender);
                                          JournalVKLIEFForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=JournalEKBESTForm then begin
                                          JournalEKBESTForm.FormDeactivate (Sender);
                                          JournalEKBESTForm.OnUpdateStatusBar :=nil;
                                          {
                                          try JournalEKBESTForm.Free; except end;
                                          JournalEKBESTForm :=nil;
                                          Continue;
                                          }
                                        end;
        if Owner=JournalVKKasseForm then begin
                                          JournalVKKasseForm.FormDeactivate (Sender);
                                          JournalVKKasseForm.OnUpdateStatusBar :=nil;
                                        end;

        if Owner=MakeAGBForm       then begin
                                          MakeAGBForm.FormDeactivate       (Sender);
                                          MakeAGBForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=MakeEKREForm      then begin
                                          MakeEKREForm.FormDeactivate      (Sender);
                                          MakeEKREForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=MakeVKREForm      then begin
                                          MakeVKREForm.FormDeactivate      (Sender);
                                          MakeVKREForm.OnUpdateStatusBar :=nil;
                                        end;
        if Owner=MakeVertragReForm then begin
                                          MakeVertragReForm.FormDeactivate (Sender);
                                          MakeVertragReForm.OnUpdateStatusBar :=nil;
                                         end;
        if Owner=MakeEKBestForm    then begin
                                          MakeEKBestForm.FormDeactivate    (Sender);
                                          MakeEKBestForm.OnUpdateStatusBar :=nil;
                                        end;
//        if Owner=ZahlForm          then ZahlForm.FormDeactivate         (Sender);
//        if Owner=ZahlAusForm       then ZahlAusForm.FormDeactivate      (Sender);
        if Owner=KassenBuchForm    then KassenBuchForm.FormDeactivate   (Sender);
//        if Owner=UeberweisungForm  then UeberweisungForm.FormDeactivate (Sender);
//        if Owner=LastschriftForm   then LastschriftForm.FormDeactivate  (Sender);
        if Owner=InfoForm          then begin
                                          InfoForm.FormDeactivate (Sender);
                                          InfoForm.OnUpdateStatusBar :=nil;
                                        end;
//        if Owner=ExportFibuForm    then begin
//                                          ExportFibuForm.Formdeactivate     (Sender);
//                                          try ExportFibuForm.Free; except end;
//                                          ExportFibuForm :=nil;
//                                          Continue;
//                                        end;
        if Owner=MahnForm          then begin
                                          MahnForm.FormDeactivate (Sender);
                                          MahnForm.OnUpdateStatusBar :=nil;
                                          try MahnForm.Free; except end;
                                          MahnForm :=nil;
                                          Continue;
                                        end;

//        if assigned(InventurForm) and
//           (Owner=InventurForm)    then begin
//                                          InventurForm.FormDeactivate   (Sender);
//                                          InventurForm.OnUpdateStatusBar :=nil;
//                                          parent :=Twincontrol(owner);
//                                          try InventurForm.Free; except end;
//                                          InventurForm :=nil;
//                                          Continue;
//                                        end;
        {$IFDEF WPTOOLS}
        if Owner=TextEditForm      then begin
                                          TextEditForm.OnUpdateStatusBar :=nil;
                                          TextEditForm.FormDeactivate      (Sender);
                                        end;
        {$ENDIF}
        {$IFDEF AVE}
        if assigned (ShopMainForm) and
           (Owner=ShopMainForm)    then begin
                                          ShopMainForm.FormDeactivate (Sender);
                                          ShopMainForm.OnUpdateStatusBar :=nil;
                                          parent :=Twincontrol(owner);
                                          try ShopMainForm.Free; except end;
                                          ShopMainForm :=nil;
                                          Continue;
                                        end;

        if assigned (AVEShopTransForm) and
           (Owner=AVEShopTransForm)then begin
                                          AVEShopTransForm.FormDeactivate (Sender);
                                          AVEShopTransForm.OnUpdateStatusBar :=nil;
                                          parent :=Twincontrol(owner);
                                          try AVEShopTransForm.Free; except end;
                                          AVEShopTransForm :=nil;
                                          Continue;
                                        end;
        {$ELSE}
        if //assigned(ShopTransForm) and
           (Owner=ShopTransForm)    then begin
                                          ShopTransForm.FormDeactivate   (Sender);
                                          ShopTransForm.OnUpdateStatusBar :=nil;
                                        {  try parent :=Twincontrol(owner); except end;
                                          try ShopTransForm.Free; except end;
                                          ShopTransForm :=nil;
                                          Continue; }
                                        end;
        {$ENDIF}
        if Owner=ExportForm         then begin
                                          ExportForm.FormDeactivate      (Sender);
                                          ExportForm.OnUpdateStatusBar :=nil;
                                        end;
//        if Owner=WartungsForm       then begin
//                                          WartungsForm.FormDeactivate (Sender);
//                                          WartungsForm.OnUpdateStatusBar :=nil;
//                                          parent :=Twincontrol(owner);
//                                          try WartungsForm.Free; except end;
//                                          WartungsForm :=nil;
//                                          Continue;
//                                         end;
//        if Owner=StatisticForm      then begin
//                                          StatisticForm.FormDeactivate      (Sender);
                                          //StatisticForm.OnUpdateStatusBar :=nil;
//                                          parent :=Twincontrol(owner);
//                                          try StatisticForm.Free; except end;
//                                          StatisticForm :=nil;
//                                          Continue;
//                                        end;
        try
          if (assigned (owner))and(assigned(parent))
            then parent :=Twincontrol(owner);
        except end;

        i :=0;

       end else Inc(i);
     end;

     // Statuszeile löschen
     OnUpdateStatusBar('', '', '', '', '');

     if DM1.CaoSecurity.CanOpenModul (Modul,0) then
     begin
       ActiveModul :=Modul;

       case Modul of
         1010: // Adressen
         begin
              AdressForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              AdressForm.AddrPanel.Parent := MainPanel;
              AdressForm.FormActivate (Sender);
              LastMenu :=AdressForm.Mainmenu1;
         end;
         1020: // Artikel
         begin
              ArtikelForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              ArtikelForm.ArtikelPanel.Parent := MainPanel;
              ArtikelForm.FormActivate(Sender);
              LastMenu :=ArtikelForm.Mainmenu1;
              ArtikelForm.F9Change (F9);
         end;
         1030: // Fahrzeuge (KFZ)
         begin
              if DM1.USE_KFZ then
              begin
                KFZForm.OnUpdateStatusBar :=OnUpdateStatusBar;
                KFZForm.KFZPanel.Parent := MainPanel;
                KFZForm.FormActivate (Sender);
                LastMenu :=KFZForm.Mainmenu1;
              end;
         end;
         1040: // Mitarbeiter
         begin
              MitarbeiterForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              MitarbeiterForm.MainPanel.Parent := MainPanel;
              MitarbeiterForm.FormActivate (Sender);
              LastMenu :=MitarbeiterForm.Mainmenu1;
         end;
         1050: // PIM
         begin
              PIMForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              PIMForm.MainPanel.Parent := MainPanel;
              PIMForm.FormActivate (Sender);
              LastMenu :=PIMForm.Mainmenu1;
         end;
         1060: // Notizen
         begin
              InfoForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              InfoForm.InfoPanel.Parent := MainPanel;
              InfoForm.FormActivate (Sender);
              LastMenu :=InfoForm.Mainmenu1;
         end;
         1070: // Vertreter
         begin
              VertreterForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              VertreterForm.MainPanel.Parent := MainPanel;
              VertreterForm.FormActivate (Sender);
              LastMenu :=VertreterForm.Mainmenu1;
         end;
         2010: //Angebot
         begin
            MakeAGBForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MakeAGBForm.Mainmenu1;
            MakeAGBForm.RePanel.Parent := MainPanel;
            MakeAGBForm.FormActivate (Sender);;
            MakeAGBForm.F9Change (F9);
         end;
         2040: //Rechnung
         begin
            MakeVkReForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MakeVkReForm.Mainmenu1;
            MakeVkReForm.RePanel.Parent := MainPanel;
            MakeVkReForm.FormActivate(Sender);
            MakeVkReForm.F9Change (F9);
         end;
         2050: //Einkauf
         begin
            MakeEKReForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MakeEKReForm.Mainmenu1;
            MakeEKReForm.RePanel.Parent := MainPanel;
            MakeEKReForm.FormActivate (Sender);
         end;
         2060: //EK-Bestellung
         begin
            MakeEKBestForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MakeEkBestForm.Mainmenu1;
            MakeEKBestForm.RePanel.Parent := MainPanel;
            MakeEKBestForm.FormActivate(Sender);
            //MakeEKBestForm.F9Change (F9);
         end;
         2070: // Wiederkehrende Rechnungen / Verträge
         begin
            MakeVertragReForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MakeVertragReForm.Mainmenu1;
            MakeVertragReForm.RePanel.Parent := MainPanel;
            MakeVertragReForm.FormActivate (Self);
         end;

         {$IFDEF ALPHA}
         2100: // Bestellvorschläge
         begin
            if not assigned (EBBestVorForm)
               then EBBestVorForm :=TEBBestVorForm.Create (Self);

            EBBestVorForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=EBBestVorForm.Mainmenu1;
            EBBestVorForm.MainPanel.Parent := MainPanel;
            EBBestVorForm.FormActivate (Self);
         end;
         {$ENDIF}

         2080: //Mahnungen
         begin
            if not assigned(MahnForm)
              then MahnForm :=tMahnForm.Create(Self);

            MahnForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            LastMenu :=MahnForm.Mainmenu1;
            MahnForm.MainPanel.Parent := MainPanel;
            MahnForm.FormActivate(Sender);
         end;
         {$IFDEF WPTOOLS}
         2090: //Textverarbeitung
         begin
            if not assigned (TextEditForm)
               then TextEditForm :=TTextEditForm.Create (Self);

            TextEditForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            TextEditForm.MainPanel.Parent := MainPanel;
            TextEditForm.FormActivate(Sender);
            LastMenu :=TextEditForm.Mainmenu1;
         end;
         {$ENDIF}
         3010: //Angebot
         begin
              JournalVKAGBForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalVKAGBForm.JournalPanel.Parent := MainPanel;
              JournalVKAGBForm.FormActivate (Self);
              LastMenu :=JournalVKAGBForm.Mainmenu1;
         end;
         3030: //Lieferschein
         begin
              JournalVKLIEFForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalVKLIEFForm.JournalPanel.Parent := MainPanel;
              JournalVKLIEFForm.FormActivate (Self);
              LastMenu :=JournalVKLIEFForm.Mainmenu1;
         end;
         3050: //Kasse
         begin
              JournalVKKasseForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalVKKasseForm.JournalPanel.Parent := MainPanel;
              JournalVKKasseForm.FormActivate (Self);
              LastMenu :=JournalVKKasseForm.Mainmenu1;
         end;
         3040: //Rechnung
         begin
              JournalVKREForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalVKREForm.JournalPanel.Parent := MainPanel;
              JournalVKREForm.FormActivate (Self);
              LastMenu :=JournalVKREForm.Mainmenu1;
         end;
         3100: //Einkauf
         begin
              JournalEKREForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalEKREForm.JournalPanel.Parent := MainPanel;
              JournalEKREForm.FormActivate (Self);
              LastMenu :=JournalEKREForm.Mainmenu1;
         end;
         3110: //EK-Bestellung
         begin
              JournalEKBESTForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              JournalEKBESTForm.JournalPanel.Parent := MainPanel;
              JournalEKBESTForm.FormActivate (Self);
              LastMenu :=JournalEKBESTForm.Mainmenu1;
         end;
         //Finanzen
         4010: //Kassenbuch
         begin
              KassenBuchForm.MainPanel.Parent :=MainPanel;
              KassenBuchForm.Formactivate (Sender);
              LastMenu :=KassenBuchForm.Mainmenu1;
         end;
//         4020: //Zahlungseingang
//         begin
//              if not assigned (ZahlForm)
//               then ZahlForm :=TZahlForm.Create (Self);

//              ZahlForm.ZahlungPanel.Parent := MainPanel;
//              ZahlForm.FormActivate (Sender);
//              LastMenu :=ZahlForm.Mainmenu1;
//         end;
//         4030: //Zahlungsausgang
//         begin
//              if not assigned (ZahlAusForm)
//               then ZahlAusForm :=TZahlAusForm.Create (Self);

//              ZahlAusForm.ZahlungPanel.Parent := MainPanel;
//              ZahlAusForm.FormActivate (Sender);
//              LastMenu :=ZahlAusForm.Mainmenu1;
//         end;
//         4040: //Überweisungen
//         begin
//              if not assigned (UeberweisungForm)
//               then UeberweisungForm :=TUeberweisungForm.Create (Self);
//
//              UeberweisungForm.MainPanel.Parent :=MainPanel;
//              UeberweisungForm.FormActivate (Sender);
//              LastMenu :=UeberweisungForm.Mainmenu1;
//         end;

//         4050: //Lastschriften
//         begin
//              if not assigned (LastschriftForm)
//               then LastschriftForm :=TLastschriftForm.Create (Self);

//              LastschriftForm.MainPanel.Parent :=MainPanel;
//              LastschriftForm.FormActivate (Sender);
//              LastMenu :=LastschriftForm.Mainmenu1;
//         end;
//         4060: //Export Fibu
//         begin
//              if not assigned(ExportFibuForm)
//                then ExportFibuForm :=tExportFibuForm.Create(Self);

//              ExportFibuForm.MainPanel.Parent :=MainPanel;
//              ExportFibuForm.FormActivate (Sender);
//              LastMenu :=ExportFibuForm.Mainmenu1;
//         end;
         // Tools
         5001: //PLZ
         begin
              PLZForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              PLZForm.Land :=DM1.LandK2;
              PLZForm.PLZPanel.Parent := MainPanel;
              PLZForm.FormActivate (Self);
         end;
         5002: //BLZ
         begin
              BLZForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              BLZForm.BLZPanel.Parent := MainPanel;
              BLZForm.FormActivate (Self);
         end;
         {$IFDEF AVE}
         5021:
         begin
              if not assigned (ShopMainForm)
               then ShopMainForm :=TShopMainForm.Create(Self);

              ShopMainForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              ShopMainForm.MainPanel.Parent := MainPanel;
              ShopMainForm.FormActivate (Self);
              LastMenu :=ShopMainForm.Mainmenu1;
         end;
         5020:
         begin
              if not assigned (AVEShopTransForm)
               then AVEShopTransForm :=TAVEShopTransForm.Create(Self);

              AVEShopTransForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              AVEShopTransForm.MainPanel.Parent := MainPanel;
              AVEShopTransForm.FormActivate (Self);
              LastMenu :=AVEShopTransForm.Mainmenu1;
         end;
         {$ELSE}
         5020: //Shop-Transfer
         begin
            if (dm1.ReadBoolean ('SHOP','USE_SHOP',False)=True) then
            begin
              //if not assigned (ShopTransForm)
              // then ShopTransForm :=TShopTransForm.Create (Self);

              ShopTransForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              ShopTransForm.MainPanel.Parent := MainPanel;
              ShopTransForm.FormActivate (Self);
              LastMenu :=ShopTransForm.Mainmenu1;
            end
               else
            begin
               MessageDlg ('Die Shopfunktionen sind derzeit deaktiviert !'+#13#10+
                           'Siehe Datei->Einstellungen (Shop)',mterror,[mbok],0);
            end;
         end;
         {$ENDIF}
//         5030: //Inventur
//         begin
//              if not assigned (InventurForm)
//               then InventurForm :=TInventurForm.Create (Self);

//              InventurForm.OnUpdateStatusBar :=OnUpdateStatusBar;
//              InventurForm.MainPanel.Parent := MainPanel;
//              InventurForm.FormActivate (Self);
//              LastMenu :=InventurForm.Mainmenu1;
//         end;
         5040: //Export
         begin
              ExportForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              ExportForm.MainPanel.Parent :=MainPanel;
              ExportForm.FormActivate (Sender);
              LastMenu :=ExportForm.Mainmenu1;
         end;
//         5050: //Wartungsdaten
//         begin
//              if not assigned (WartungsForm)
//               then WartungsForm :=TWartungsForm.Create (Self);

//              WartungsForm.OnUpdateStatusBar :=OnUpdateStatusBar;
//              WartungsForm.MainPanel.Parent := MainPanel;
//              WartungsForm.FormActivate (Self);
//              LastMenu :=WartungsForm.Mainmenu1;
//         end;
         5010: //Statistik
         begin
              if not assigned (StatisticForm)
               then StatisticForm :=TStatisticForm.Create (Self);
              //StatisticForm.OnUpdateStatusBar :=OnUpdateStatusBar;
              StatisticForm.MainPanel.Parent := MainPanel;
              StatisticForm.FormActivate (Self);
              //LastMenu :=StatisticForm.Mainmenu1;

         end;
       end; //case
     end
        else
     begin
        // Zugriff nicht erlaubt
        MessageDlg ('Zugriff verweigert',mterror,[mbok],0);
        ActiveModul :=-1;
     end;
     LastOEPage2   :=LastOEPage;
     LastOEButton2 :=LastOEButton;

     LastOEButton :=Modul;//Index;
     LastOEPage   :=OLBar.ActivePageIndex;


     if assigned (LastMenu) then
     begin
       if LastMenu.Items.Count>0 then
       begin
         For i:=0 to LastMenu.Items.Count-1 do
         begin
            LastMenu.Items[i].OnDrawItem    :=MainMenu1.Items[0].OnDrawItem;
            LastMenu.Items[i].OnMeasureItem :=MainMenu1.Items[0].OnMeasureItem;
         end;
       end;
       MainMenu1.Merge(LastMenu);
     end;

//     XPMenu1.Active :=False;
//     XPMenu1.Active :=True;

     if DM1.IsLinux then
     begin
        Menu :=nil;
        Application.ProcessMessages;
        Menu :=MainMenu1;
     end;


     I:=0;
     while i <= MainPanel.ControlCount-1 do
     Begin
        with MainPanel.Controls[i] do
        if owner <> self then
        begin
//           XPMenu1.InitComponent (Owner);
        end;
        inc(i);
     end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Rcksicherung1Click(Sender: TObject);
var RestoreForm : TRestoreForm;
begin
     LastOEButton          :=-1;
     LastOEPage            :=-1;
     OLBar.ActivePageIndex :=0;

     OLBarButtonClick(Sender,-1);

     RestoreForm :=TRestoreForm.Create (Self);
     try
        RestoreForm.ShowModal;
     finally
        RestoreForm.Free;
     end;

     FormShow(Sender);
end;
//------------------------------------------------------------------------------
procedure TMainForm.RegisteryEditor1Click(Sender: TObject);
var RegEdiForm: TRegEdiForm;
begin
     RegEdiForm :=tRegEdiForm.Create(Self);
     try
        RegEdiForm.ShowModal;
     finally
        FreeAndNil(RegEdiForm);
     end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ShopEinstellungen1Click(Sender: TObject);
var ShopSetupForm: TShopSetupForm;
begin
     LastOEPage            :=-1;
     LastOEButton          :=-1;
     OLBar.ActivePageIndex :=0;

     OLBarButtonClick(Sender,-1);

     MainPanel.Color :=clBtnFace;

     ShopSetupForm:=TShopSetupForm.Create(Self);
     try
        ShopSetupForm.ShowModal;
     finally
        ShopSetupForm.Free;
     end;

     // Italisierung erzwingen !!!

     ArtikelForm.First   :=True;
     AdressForm.First    :=True;

     MakeVKREForm.First  :=True;
     MakeEKREForm.First  :=True;
     MakeAGBForm.First   :=True;

     MainPanel.Color :=clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Timer1Timer(Sender: TObject);
var
  Memory : TMemoryStatus;
begin
     if SScreenDelay<3 then
     begin
        inc (SScreenDelay);
        if assigned(SScreen) then SScreen.Update;
     end
        else
     if SScreenDelay = 3 then
     begin
       inc (SScreenDelay);
       // SplashScreen abschalten
       if Assigned (SScreen) then
       begin
          //SScreen.Hide;
          SScreen.Free;
          SScreen :=nil;
       end;

       // Prüfen, of Plattform NT ist, sonst Warnung ausgeben.
       if (not IsNT)and
          (DM1.ReadBoolean('MAIN','NOT_NT_WARNING',True))and
          (not DM1.IsLinux) then
       begin
          MessageDlg ('CAO-Faktura unterstützt das von Ihnen eingesetzte '+
                      'Betriebssystem nicht.'+#13#10+
                      'Dies kann zu schweren Programmfehlern führen.'+#13#10+
                      'Bitte verwenden Sie Windows NT, '+
                      'Windows 2000 oder Windows XP !',mterror,[mbok],0);
       end;
     end
        else
     if (SScreenDelay>3)and(SScreenDelay<100)and(DM1.DB1.Connected) then
     begin
        inc(SScreenDelay);
        if SScreenDelay = 10 then
        begin
          // Notizen prüfen
          if DM1.AktMandant<>'' then InfoForm.PruefeWiedervorlage;
        end;

        if SScreenDelay = 15 then
        begin
          // Verträge prüfen
          if DM1.AktMandant<>'' then MakeVertragReForm.PruefeVertraege;
        end;
     end
        else
     if SScreenDelay=100 then
     begin
        if Int(Now)>LastDate then
        begin
           // Tageswechsel
           LastDate :=Int(Now);
           SScreenDelay :=5;
        end;
     end;

     try
       Memory.dwLength:=SizeOf(Memory);
       GlobalMemoryStatus(Memory);
       SBar.Panels[1].Text :=FormatFloat(',##0.00',Round(((Memory.dwTotalPhys - Memory.dwAvailPhys)/Memory.dwTotalPhys)*100))+' MB';
       if (assigned (AboutBox))and(AboutBox.Visible) then AboutBox.Timer1Timer(Self);
     except end;

     ConnectLED.Status:=DM1.DB1.Connected and DM1.DB1.PingServer;
     if not DM1.DB1.Connected then
     begin
       ConnectLED.Hint:='Datenbankverbindung unterbrochen!';
//       DM1.DB1.Connect;
     end else
           ConnectLED.Hint:='Die Datenbank ist mit dem Server '+DM1.DB1.HostName+' verbunden.';
end;
//------------------------------------------------------------------------------
procedure TMainForm.Wechseln1Click(Sender: TObject);
var Old : String; MandantAWForm: TMandantAWForm;
begin
     LastOEPage            :=-1;
     LastOEButton          :=-1;
     OLBar.ActivePageIndex :=0;

     OLBarButtonClick(Sender,-1);

     Old :=DM1.AktMandant;

     MandantAWForm:=TMandantAWForm.Create(Self);
     try
        MandantAWForm.Left :=Left+200;
        MandantAWForm.Top  :=Top +150;
        MandantAWForm.ShowModal;
     finally
        MandantAWForm.Free;
     end;

     if Old <> DM1.AktMandant then FormShow (Sender);

     SBar.Panels[0].Text :=DM1.View_User;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ZurueckBtnClick(Sender: TObject);
begin
     if LastOEButton2<0 then exit;
     OLBar.ActivePageIndex :=LastOEPage2;
     OLBarButtonClick (Sender, LastOEButton2);
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormActivate(Sender: TObject);
begin
  if assigned(LastMenu) then MainMenu1.Merge (LastMenu);
end;
//------------------------------------------------------------------------------
procedure TMainForm.Datenbankprfenoptimierenreparieren1Click(Sender: TObject);
var DBForm: TDBForm;
begin
     DBForm:=TDBForm.Create(Self);
     try
        DBForm.ShowModal;
     finally
        FreeAndNil(DBForm);
     end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Beenden1Click(Sender: TObject);
begin
     Close;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Anwenderforum1Click(Sender: TObject);
begin
     StarteNewProgramm ('http://www.jp-soft.de/board/','','');
end;
//------------------------------------------------------------------------------
procedure TMainForm.ber1Click(Sender: TObject);
begin
     AboutBox.ShowModal;
end;
//------------------------------------------------------------------------------
procedure TMainForm.CAOHandbuch1Click(Sender: TObject);
begin
  {$IFDEF WITHHELP}
  mHHelp.HelpTopic('');
  {$ELSE}
  ShowMessage('Das Hilfesystem befindet sich im Aufbau '+
              'und ist im Moment deaktiviert.');
  {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMainForm.ModulAuswahlClick(Sender: TObject);
begin
     if tMenuItem(Sender).Tag=0 then exit;

     OLBar.ActivePageIndex :=trunc(tMenuItem(Sender).Tag div 10);
     OLBarButtonClick (Self,tMenuItem(Sender).Tag);
end;
//------------------------------------------------------------------------------
procedure TMainForm.Datensicherung1Click(Sender: TObject);
var BackupForm : TBackupForm;
begin
     BackupForm :=tBackupForm.Create(Self);
     try
        BackupForm.ShowModal;
     finally
        FreeAndNil(BackupForm);
     end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Druckereinrichten1Click(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Einstellungen1Click(Sender: TObject);
var SetupForm: TSetupForm;
begin
     // aktuellen Zusatnd speichern
     DM1.WriteIntegerU ('','LastLeftMenuGrp',OLBar.ActivePageIndex);
     DM1.WriteIntegerU ('','LastLeftMenuBtn',LastOEButton);

     // alles ausblenden bzw. Module schließen
     LastOEPage            :=-1;
     LastOEButton          :=-1;
     OLBar.ActivePageIndex :=0;

     OLBarButtonClick(Sender,-1);

     MainPanel.Color :=clBtnFace;

     SetupForm:=TSetupForm.Create(Self);
     try
        SetupForm.ShowModal;
     finally
        FreeAndNil(SetupForm);
     end;

     // Initalisierung erzwingen !!!

     ArtikelForm.First   :=True;
     AdressForm.First    :=True;

     MakeVKREForm.First  :=True;
     MakeEKREForm.First  :=True;
     MakeAGBForm.First   :=True;

     FormShow (Sender);
end;
//------------------------------------------------------------------------------
procedure TMainForm.EKPreiseanzeigen1Click(Sender: TObject);
begin
     EKPreiseanzeigen1.Checked := not EKPreiseanzeigen1.Checked;
     F9 :=EKPreiseanzeigen1.Checked;

     if ArtikelForm.ArtikelPanel.Parent = MainPanel then ArtikelForm.F9Change  (F9);
     if MakeVkReForm.RePanel.Parent     = MainPanel then MakeVkReForm.F9Change (F9);
     if MakeAGBForm.RePanel.Parent      = MainPanel then MakeAGBForm.F9Change  (F9);
end;
//------------------------------------------------------------------------------
procedure TMainForm.eMailandenEntwickler1Click(Sender: TObject);
begin
     //StarteNewProgramm ('mailto:cao-develop@jp-soft.de?subject=Cao-Faktura','','');
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
{$IFDEF AVE}var ST : tDateTime;{$ENDIF}
begin
   try
     Timer1.Enabled :=False;

     if DM1.DB1.Connected then
     begin
       // aktuellen Zustand speichern
       DM1.WriteIntegerU ('','LastLeftMenuGrp',OLBar.ActivePageIndex);
       DM1.WriteIntegerU ('','LastLeftMenuBtn',LastOEButton);
       DM1.WriteBooleanU ('','LastF9Status'   ,F9);
     end;

     // alles aushängen
     OLBarButtonClick (self,-1);

     // SQL-Monitor aus
     ZMonitor1.Active:=false;
     ZMonitor1.AutoSave:=false;

     // DB schliessen
     if DM1.DB1.Connected then DM1.DB1.Disconnect;
     DM1.Transact1.Connection :=nil;


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


     {$IFDEF WITHHELP}
     // Hilfesystem freigeben
     mHHelp.Free;
     HHCloseAll;
     {$ENDIF}

   except

   end;
   canclose :=True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.StarteNewProgramm (Name,Cmd,Dir : String);
var res : integer;
    Msg : String;
begin
     res:=shellexecute (self.handle,
                        pchar('open'),PChar(name),pchar(cmd),pchar(dir),sw_shownormal);

     if res <= 32 then
     begin
        case res of
           0 : msg:='Zuwenig Speicher, ausführbare Datei war zerstört, '+
                    'Relokationswerte waren ungültig';
           2 : msg:='Datei wurde nicht gefunden.';
           3 : msg:='Verzeichnis wurde nicht gefunden.';
           5 : msg:='Fehler beim gemeinsamen Zugriff auf eine Datei '+
                    'im Netz oder Fehler'+
                    ' beim Zugriff auf eine gesperrte Datei im Netz.';
           6 : msg:='Bibliothek forderte separate Datensegmente für jede Task an.';
           8 : msg:='Zuwenig Speicher, um die Anwendung zu starten.';
           10: msg:='Falsche Windows-Version.';
           11: msg:='Ungültige ausführbare Datei. Entweder keine '+
                    'Windows-Anwendung oder Fehler in der EXE-Datei.';
           12: msg:='Anwendung für ein anderes Betriebssystem.';
           13: msg:='Anwendung für MS-DOS 4.0.';
           14: msg:='Typ der ausführbaren Datei unbekannt.';
           15: msg:='Versuch, eine Real-Mode-Anwendung (für eine frühere '+
                    'Windows-Version) zu laden.';
           16: msg:='Versuch, eine zweite Instanz einer ausführbaren Datei mit'+
                    ' mehreren Datensegmenten'+
                    ', die nicht als nur lesbar gekennzeichnet waren, zu laden.';
           19: msg:='Versuch, eine komprimierte ausführbare Datei zu laden. '+
                    'Die Datei muß dekomprimiert'+
                    ' werden, bevor sie geladen werden kann.';
           20: msg:='Ungültige dynamische Linkbibliothek (DLL). Eine der DLLs,'+
                    ' die benötigt wurde, um '+
                    'die Anwendung auszuführen, war beschädigt.';
           21: msg:='Anwendung benötigt Windows-32-Bit-Erweiterungen.';
           else msg :='Unbekannter Fehler Code :'+inttostr(res);
        end;
        msg:= msg+#0;
        messagebox(handle,@msg[1],'Problem',16);
    end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ZMonitor1MonitorEvent(Sql, Result: String);
var d : string;
    f : textfile;
begin
    if not DM1.SqlLog then exit;
    try
     if assigned(LogForm)
      then logform.addlog ('SQL:'+sql+#13#10+'RES:'+Result+#13#10);


     if (uppercase(dm1.user)='JAN')and
        (uppercase(dm1.Comp)='JPC') then
     begin
        d :=DM1.LogDir+'cao_sql_'+formatdatetime ('dd_mm_yyyy',now)+'.log';
        if not fileexists (d) then fileclose (filecreate (d));
        assignfile (F,D);
        append (f);
        try
           writeln (f,'SQL:'+sql+#13#10+'RES:'+Result);
        finally
           closefile (f);
        end;
     end;

    except end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung,
                                      Erstellt, Geaendert : String);
begin
     SBar.Panels[2].Text :=SuchZeit;
     SBar.Panels[3].Text :=Datensatz;
     SBar.Panels[4].Text :=Sortierung;
     SBar.Panels[5].Text :=Erstellt;
     SBar.Panels[6].Text :=Geaendert;
end;
//------------------------------------------------------------------------------
// c.) MSTUEBNER
procedure TMainForm.SetHelpContext;
begin
    // Stammdaten -- KFZ
    with KFZForm do
    begin
        KFZPanel.HelpContext        := 8050;
        Allg_TS.HelpContext         := 8050;
        Notiz_TS.HelpContext        := 8100;
        Hist_TS.HelpContext         := 8150;
        List_TS.HelpContext         := 8200;
    end;

    // Stammdaten -- Mitarbeiter
    with MitarbeiterForm do
    begin
        MainPanel.HelpContext              := 3600;
        Allg_TS.HelpContext                := 3600;
        Such_TS.HelpContext                := 3650;
        TabSheet1.HelpContext              := 3700;
        TabSheet2.HelpContext              := 3750;
    end;

    // Stammdaten -- PIM
    with PimForm do
    begin
        MainPanel.HelpContext              := 3800;
        VpMonthView1.HelpContext           := 3810;
        VpTaskList1.HelpContext            := 3815;

        VpCaoEventEditDialog1.HelpContext  := 3820; // Termin  neu/bearbeiten
        TaskDlgHelpContext                 := 3825; // Aufgabe neu/bearbeiten
    end;

    // Stammdaten -- Notizen
    with InfoForm do
    begin
        InfoPanel.HelpContext       := 3850;
    end;

    // Stammdaten -- Vertreter
    with VertreterForm do
    begin
        MainPanel.HelpContext       := 3900;
        Allg_TS.HelpContext         := 3900;
        TabSheet2.HelpContext       := 3950;
        TabSheet3.HelpContext       := 4000;
        Such_TS.HelpContext         := 4050;
    end;

    // Vorgänge -- Angebot
    with MakeAGBForm do
    begin
        EdiListTS.HelpContext       := 4100;
        AdressTS.HelpContext        := 4150;
        PosTS.HelpContext           := 4200;
        Fertig.HelpContext          := 4250;
        PosDetailTS.HelpContext     := 4300;
        PreisAlgTS.HelpContext      := 4350;
        PreisVKHisTS.HelpContext    := 4400;
        LiefPreisTS.HelpContext     := 4450;
        PreisEKHisTS.HelpContext    := 4500;
        EKBestTS.HelpContext        := 4550;
        TabSheet6.HelpContext       := 4600;
        StueckListTS.HelpContext    := 4650;
        LiefTS.HelpContext          := 4700;
    end;

    // Vorgänge -- Rechnung
    with MakeVKReForm do
    begin
        EdiListTS.HelpContext       := 4750;
        AdressTS.HelpContext        := 4800;
        PosTS.HelpContext           := 4850;
        Fertig.HelpContext          := 4900;
        PosDetailTS.HelpContext     := 4950;
        PreisAlgTS.HelpContext      := 5000;
        PreisVKHisTS.HelpContext    := 5050;
        LiefPreisTS.HelpContext     := 5600;
        PreisEKHisTS.HelpContext    := 5650;
        EKBestTS.HelpContext        := 5700;
        TabSheet6.HelpContext       := 5750;
        StueckListTS.HelpContext    := 5800;
        LiefTS.HelpContext          := 5850;
    end;

    // Vorgänge -- Einkauf
    with MakeEKReForm do
    begin
        EdiListTS.HelpContext       := 5900;
        AdressTS.HelpContext        := 5950;
        PosTS.HelpContext           := 6000;
        Fertig.HelpContext          := 6050;
    end;

    // Vorgänge -- EK-Bestellung
    with MakeEKBestForm do
    begin
        EdiListTS.HelpContext       := 6100;
        AdressTS.HelpContext        := 6150;
        PosTS.HelpContext           := 6200;
        Fertig.HelpContext          := 6250;
    end;

    // Vorgänge -- Verträge
    with MakeVertragReForm do
    begin
        EdiListTS.HelpContext       := 6300;
        AdressTS.HelpContext        := 6350;
        PosTS.HelpContext           := 6400;
        Fertig.HelpContext          := 6450;
    end;

    // Journale -- Angebot
    with JournalVKAGBForm do
    begin
        MainPanel.HelpContext       := 6500;
        JourGrid.HelpContext        := 6500;
        Allgemein.HelpContext       := 6525;
        TabSheet1.HelpContext       := 6550;
        JourInfoTS.HelpContext      := 6600;
    end;

    // Journale -- Lieferschein
    with JournalVKLiefForm do
    begin
        MainPanel.HelpContext       := 6650;
        Jourgrid.HelpContext        := 6650;
        Allgemein.HelpContext       := 6675;
        TabSheet1.HelpContext       := 6700;
    end;

    // Journale -- Kasse
    with JournalVKKasseForm do
    begin
        MainPanel.HelpContext       := 6750;
        TabSheet1.HelpContext       := 6750;
        TabSheet2.HelpContext       := 6800;
    end;

    // Journale -- Rechnung
    with JournalVKREForm do
    begin
        MainPanel.HelpContext       := 6850;
        JourGrid.HelpContext        := 6850;
        Allgemein.HelpContext       := 6875;
        TabSheet1.HelpContext       := 6900;
        ReInfoTS.HelpContext        := 6950;
    end;

    // Journale -- Einkauf
    with JournalEKREForm do
    begin
        MainPanel.HelpContext       := 7000;
        JourGrid.HelpContext        := 7000;
        Allgemein.HelpContext       := 7025;
        TabSheet1.HelpContext       := 7050;
    end;

    // Journale -- EK-Bestellung
    with JournalEKBestForm do
    begin
        MainPanel.HelpContext       := 7100;
        JourGrid.HelpContext        := 7100;
        Allgemein.HelpContext       := 7125;
        TabSheet1.HelpContext       := 7150;
    end;

    // Finanzen -- Kassenbuch
    with KassenBuchForm do
    begin
        MainPanel.HelpContext       := 7200;
    end;


    // Tools -- PLZ
    with PLZForm do
    begin
        PLZPanel.HelpContext        := 7500;
    end;

    // Tools -- BLZ
    with BLZForm do
    begin
        BLZPanel.HelpContext        := 7550;
    end;

    // Tools -- Shop-Transfer
    {$IFNDEF AVE}
    with ShopTransForm do
    begin
        ArtikelTS.HelpContext       := 7600;
        BestellTS.HelpContext       := 7650;
        UpdateTS.HelpContext        := 7700;
        KatTS.HelpContext           := 7750;
        HerstellerTS.HelpContext    := 7800;
    end;
    {$ENDIF}

    // Tools -- Export
    with ExportForm do
    begin
        AuswahlTS.HelpContext       := 7850;
        AllgTS.HelpContext          := 7900;
        SQLExecTS.HelpContext       := 7950;
        FelderTS.HelpContext        := 8000;
    end;
end;
//------------------------------------------------------------------------------
function TMainForm.FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
    {$IFDEF WITHHELP}
    if (Command in [Help_Context, Help_ContextPopup]) then
    begin
        if (help_enabled) then
        begin
            if DM1.ReadBoolean ('MAIN','HELP_DEBUG',False) then
            begin
               MessageDlg ('Aufruf Hilfe ID:'+InttoStr(Data),mtinformation,[mbok],0);
            end
               else
            begin
               mHHelp.HelpContext(Data);
               CallHelp := false;
               result := TRUE;
            end;
        end
        else
        {$ENDIF}
        ShowMessage('Das Hilfesystem befindet sich im Aufbau '+
                    'und ist im Moment deaktiviert.');
        {$IFDEF WITHHELP}
    end;
    {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMainForm.ShowHint (Sender : tObject);
begin
     if length(Application.Hint)>0 then
     begin
        Application.HintColor :=$00DDFFFF;
        SBar.SimpleText :=Application.Hint;
        SBar.SimplePanel :=True;
     end else SBar.SimplePanel :=False;
end;
//------------------------------------------------------------------------------
procedure TMainForm.JumpTo (Modul, ID, Jahr : Integer; BelegNeu : Boolean);
var Found, MakeNeu : Boolean;
begin
     // Journalaufrufe
     if Modul=VK_AGB then
     begin
       OLBar.ActivePageIndex :=2;
       Application.ProcessMessages;
       OLBarButtonClick (Self,3010);
       Application.ProcessMessages;
       JournalVKAGBForm.DatumAW.Year :=Jahr;
       JournalVKAGBForm.DatumAW.KindRange :=ksYear;
       Application.ProcessMessages;
       JournalVKAGBForm.JQuery.Locate ('REC_ID',Id,[]);
     end
        else
     if Modul=VK_RECH then
     begin
       OLBar.ActivePageIndex :=2;
       Application.ProcessMessages;
       OLBarButtonClick (Self,3040);
       Application.ProcessMessages;
       JournalVKREForm.DatumAW.Year :=Jahr;
       JournalVKREForm.DatumAW.KindRange :=ksYear;
       Application.ProcessMessages;
       JournalVKREForm.JQuery.Locate ('REC_ID',Id,[]);
     end
        else
     if Modul=EK_RECH then
     begin
       OLBar.ActivePageIndex :=2;
       Application.ProcessMessages;
       OLBarButtonClick (Self,3100);
       Application.ProcessMessages;
       JournalEKREForm.DatumAW.Year :=Jahr;
//       JournalEKREForm.DatumAW.KindRange :=ksYear;
       Application.ProcessMessages;
       JournalEKREForm.JQuery.Locate ('REC_ID',Id,[]);
     end
        else
     if Modul=EK_BEST then
     begin
       OLBar.ActivePageIndex :=2;
       Application.ProcessMessages;
       OLBarButtonClick (Self,3110);
       Application.ProcessMessages;
//       JournalEKBestForm.DatumAW.Year :=Jahr;
//       JournalEKBestForm.DatumAW.KindRange :=ksYear;
       Application.ProcessMessages;
//       JournalEKBestForm.JQuery.Locate ('REC_ID',Id,[]);
     end
        else
     // Belege im Edit
     if Modul=VK_AGB_EDI then
     begin
       OLBar.ActivePageIndex :=1;
       Application.ProcessMessages;
       OLBarButtonClick (Self,2010);
       Application.ProcessMessages;
       if not BelegNeu then
       begin
          MakeAgbForm.ReEdiTab.Locate ('REC_ID',Id,[]);
       end
          else
       begin
          MakeNeu :=True;
          Found :=MakeAGBForm.ReEdiTab.Locate ('ADDR_ID',Id,[]);
          if Found then
          begin
            if MessageDlg ('Dieser Kunde hat bereits mind. ein '+
                           'unfertiges Angebot.'+#13#10+
                           'Wollen Sie trotzdem ein neues erstellen ?',
                           mtconfirmation,[mbyes,mbno],0)<>mryes
             then MakeNeu :=False;
          end;
          if MakeNeu then
          begin
              MakeAGBForm.New1BtnClick (Self);
              MakeAGBForm.SetAdresse (ID);
          end;
       end;
     end
        else
     if Modul=VK_RECH_EDI then
     begin
       OLBar.ActivePageIndex :=1;
       Application.ProcessMessages;
       OLBarButtonClick (Self,2040);
       Application.ProcessMessages;
       if not BelegNeu then
       begin
          MakeVKReForm.ReEdiTab.Locate ('REC_ID',Id,[]);
       end
          else
       begin
          MakeNeu :=True;
          Found :=MakeVKReForm.ReEdiTab.Locate ('ADDR_ID',Id,[]);
          if Found then
          begin
            if MessageDlg ('Dieser Kunde hat bereits mind. eine '+
                           'unfertige Rechnung.'+#13#10+
                           'Wollen Sie trotzdem eine neue erstellen ?',
                           mtconfirmation,[mbyes,mbno],0)<>mryes
             then MakeNeu :=False;
          end;
          if MakeNeu then
          begin
              MakeVKReForm.New1BtnClick (Self);
              MakeVKReForm.SetAdresse (ID);
          end;
       end;
     end
        else
     if Modul=EK_RECH_EDI then
     begin
       OLBar.ActivePageIndex :=1;
       Application.ProcessMessages;
       OLBarButtonClick (Self,2050);
       Application.ProcessMessages;
       if not BelegNeu then
       begin
          MakeEKReForm.ReEdiTab.Locate ('REC_ID',Id,[]);
       end
          else
       begin
          MakeNeu :=True;
          Found :=MakeEKReForm.ReEdiTab.Locate ('ADDR_ID',Id,[]);
          if Found then
          begin
            if MessageDlg ('Dieser Kunde hat bereits mind. eine '+
                           'unfertige EK-Rechnung.'+#13#10+
                           'Wollen Sie trotzdem eine neue erstellen ?',
                           mtconfirmation,[mbyes,mbno],0)<>mryes
             then MakeNeu :=False;
          end;
          if MakeNeu then
          begin
              MakeEKReForm.New1BtnClick (Self);
              MakeEKReForm.SetAdresse (ID);
          end;
       end;
     end
        else
     if Modul=EK_BEST_EDI then
     begin
       OLBar.ActivePageIndex :=1;
       Application.ProcessMessages;
       OLBarButtonClick (Self,2060);
       Application.ProcessMessages;
       if not BelegNeu then
       begin
          MakeEKBestForm.ReEdiTab.Locate ('REC_ID',Id,[]);
       end
          else
       begin
          MakeNeu :=True;
          Found :=MakeEKBestForm.ReEdiTab.Locate ('ADDR_ID',Id,[]);
          if Found then
          begin
            if MessageDlg ('Dieser Kunde hat bereits mind. eine '+
                           'unfertige EK-Bestellung.'+#13#10+
                           'Wollen Sie trotzdem eine neue erstellen ?',
                           mtconfirmation,[mbyes,mbno],0)<>mryes
             then MakeNeu :=False;
          end;
          if MakeNeu then
          begin
              MakeEKBestForm.New1BtnClick (Self);
              MakeEKBestForm.SetAdresse (ID);
          end;
       end;
     end
        else
     // Notizen
     if Modul=MOD_NOTIZ then
     begin
       OLBar.ActivePageIndex :=1;
       Application.ProcessMessages;
       OLBarButtonClick (Self,1060);
       Application.ProcessMessages;
     end
        else
     //Verträge
     if Modul=VK_WKRE_EDI then
     begin
       OLBar.ActivePageIndex :=2;
       Application.ProcessMessages;
       OLBarButtonClick (Self,2070);
       Application.ProcessMessages;
     end;
end;
//------------------------------------------------------------------------------

end.

