{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : ARTSERNUMSUCHDLG.PAS / DFM                                    }
{ BESCHREIBUNG : Dialog zur Suche nach Seriennummern                           }
{ STAND        : 09.05.2004                                                    }
{ VERSION      : 1.2.5.3                                                       }
{ © 2004 Jan Pokrandt / Jan@JP-Soft.de                                         }
{                                                                              }
{ Diese Unit gehört zum Projekt CAO-Faktura und wird unter der                 }
{ GNU General Public License Version 2.0 freigegeben                           }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ This program is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU General Public License                  }
{ as published by the Free Software Foundation; either version 2               }
{ of the License, or any later version.                                        }
{                                                                              }
{ This program is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                }
{ GNU General Public License for more details.                                 }
{                                                                              }
{ You should have received a copy of the GNU General Public License            }
{ along with this program; if not, write to the Free Software                  }
{ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.  }
{                                                                              }
{    ******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************     }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ Historie :                                                                   }
{ 09.05.2004 - Unit ins CVS gestellt                                           }
{                                                                              }
{ Todo :                                                                       }
{                                                                              }
{******************************************************************************}

{01.01.2021 für FreePascal und CodeTyphon von Volker Stark volker@vostnet.at portiert}

unit ArtSernumSuchDlg;

{$ifdef fpc}{$mode delphi}{$endif}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, ExtCtrls, ComCtrls, DBGrids, DBCtrls, ZDataset, ZAbstractRODataset;

type

  { TSerNumSuchForm }

  TSerNumSuchForm = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    CaoDBGrid1: TDBGrid;
    CaoDBGrid2: TDBGrid;
    DBText1: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SNSucheArtDS: TDataSource;
    SNSucheArtTabARTNUM: TZRawStringField;
    SNSucheArtTabKURZNAME: TZRawStringField;
    SNSucheArtTabMATCHCODE: TZRawStringField;
    SNSucheArtTabREC_ID: TZIntegerField;
    SNSucheDS: TDataSource;
    NotFoundLab: TLabel;
    NotFoundPan: TPanel;
    PC1: TPageControl;
    SNSucheTabEINK_NUM: TZIntegerField;
    SNSucheTabEK_DATUM: TZDateField;
    SNSucheTabEK_JOURNALPOS_ID: TZIntegerField;
    SNSucheTabEK_JOURNAL_ID: TZIntegerField;
    SNSucheTabLIEFERANT: TZRawStringField;
    SNSucheTabLIEF_NUM: TZIntegerField;
    SNSucheTabLS_DATUM: TZDateField;
    SNSucheTabLS_JOURNALPOS_ID: TZIntegerField;
    SNSucheTabLS_JOURNAL_ID: TZIntegerField;
    SNSucheTabLS_KUNDE: TZRawStringField;
    SNSucheTabSERNUMMER: TZRawStringField;
    SNSucheTabSNUM_ID: TZIntegerField;
    SNSucheTabVERK_NUM: TZIntegerField;
    SNSucheTabVK_DATUM: TZDateField;
    SNSucheTabVK_JOURNALPOS_ID: TZIntegerField;
    SNSucheTabVK_JOURNAL_ID: TZIntegerField;
    SNSucheTabVK_KUNDE: TZRawStringField;
    SuchBtn: TBitBtn;
    SNEdi: TEdit;
    HelpBtn: TBitBtn;
    CloseBtn: TBitBtn;
    Label1: TLabel;
    ArtikelTS: TTabSheet;
    SerNumTS: TTabSheet;
    SerNumDetailsTS: TTabSheet;
    SNSucheArtTab: TZQuery;
    SNSucheTab: TZQuery;
    procedure CaoDBGrid1DblClick(Sender: TObject);
    procedure CaoDBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SNEdiChange(Sender: TObject);
    procedure SNEdiKeyPress(Sender: TObject; var Key: char);
    procedure SNSucheArtTabAfterScroll(DataSet: TDataSet);
    procedure SuchBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  SerNumSuchForm: TSerNumSuchForm;

implementation

{$R *.frm}

{ TSerNumSuchForm }

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.FormShow(Sender: TObject);
begin
     NotFoundLab.Caption :='Bitte geben Sie eine Seriennummer ein.';
     NotFoundPan.Visible :=True;
     PC1.Visible         :=False;
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNEdiChange(Sender: TObject);
begin
     SuchBtn.Enabled :=length(SNEdi.Text)>0;
     SNSucheArtTab.Close;
     SNSucheTab.Close;

     FormShow(Sender);
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNEdiKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
        key :=#0;
        SuchBtnClick(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNSucheArtTabAfterScroll(DataSet: TDataSet);
begin
     if SNSucheArtTab.RecordCount=0 then exit;

     SNSucheTab.Close;
     SNSucheTab.ParamByName ('SN').AsString :=SNSucheArtTab.ParamByName ('SN').AsString;
     SNSucheTab.ParamByName ('AID').AsInteger :=SNSucheArtTabREC_ID.AsInteger;
     SNSucheTab.Open;

     SernumTS.Caption :='Seriennummern ('+IntToStr(SNSucheTab.RecordCount)+')';
     SerNumDetailsTS.TabVisible :=SNSucheTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SuchBtnClick(Sender: TObject);
var S : String;
begin
     S :='%'+SNEdi.Text+'%';
     SNSucheArtTab.ParamByName('SN').AsString :=S;
     SNSucheArtTab.Open;

     if SNSucheArtTab.RecordCount=1 then
     begin
        if SNSucheTab.RecordCount=1
         then PC1.ActivePage :=SerNumDetailsTS
         else PC1.ActivePage :=SerNumTS;
        ArtikelTS.TabVisible :=False;
        SerNumTS.TabVisible :=SNSucheTab.RecordCount>1;
     end
        else
     begin
        ArtikelTS.Caption :='Artikel ('+IntToStr(SNSucheArtTab.RecordCount)+')';
        ArtikelTS.TabVisible :=SNSucheArtTab.RecordCount>1;
        PC1.ActivePage :=ArtikelTS;
        SerNumTS.TabVisible :=SNSucheTab.RecordCount>0;
     end;

     PC1.Visible         :=SNSucheArtTab.RecordCount>0;
     NotFoundPan.Visible :=SNSucheArtTab.RecordCount=0;

     if SNSucheArtTab.RecordCount=0
      then NotFoundLab.Caption :='Zu Ihrem Suchbegriff'+#13#10+
                                 'wurden keine Seiennummern gefunden.';
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.CaoDBGrid1DblClick(Sender: TObject);
begin
     if SNSucheArtTab.RecordCount>0 then
     begin
      if SNSucheTab.RecordCount=1
       then PC1.ActivePage :=SerNumDetailsTS
       else PC1.ActivePage :=SerNumTS;
     end;
end;
//------------------------------------------------------------------------------
procedure TSerNumSuchForm.CaoDBGrid2DblClick(Sender: TObject);
begin
     if SNSucheTab.RecordCount>0
      then PC1.ActivePage :=SerNumDetailsTS;
end;
//------------------------------------------------------------------------------

end.

