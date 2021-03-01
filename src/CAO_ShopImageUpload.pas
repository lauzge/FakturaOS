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
Modul        : CAO_SHOPIMAGEUPLOAD
Stand        : 18.07.2003
Version      : 1.1.1.8
Beschreibung : Dialog für Bilder-Upload (Shop)

History :

18.07.2003 - Unit erstellt
16.08.2003 - Hersteller-Bild-Upload hinzugefügt


-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_ShopImageUpload;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, Buttons,
  StdCtrls, IdComponent, IdHTTP, CAO_ShopTrans;

type
  TImageSize = (isDefault, isLarge, isMedium);

type

  { TFileUpload }

  TFileUpload = class(TForm)
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    UploadBtn: TBitBtn;
    FileNameEdit1: TFileNameEdit;
    procedure FileNameEdit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UploadBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    Upload  : Boolean;
    Running : Boolean;
    Typ     : String;
    Action  : String;
    FName   : String;

    LocalFileName : String;

    ProxyPort : Integer;

    ShopTyp         : tShopTyp;

    ShopUser,
    ShopPW,
    ShopPW_MD5,
    ProxyAuthenticate,
    ProxyPassword,
    ProxyServer,
    ProxyUsername,
    ShopUpdateURL  : String;

    Function Init : Boolean;
  public
    { Public-Deklarationen }
    Function ProduktImage    (var Name, LocalFile : String;
                              Size : TImageSize) : Boolean;
    Function KategorieImage  (var Name : String) : Boolean;
    Function HerstellerImage (var Name : String) : Boolean;
  end;

var
  FileUpload: TFileUpload;

implementation

{$R *.frm}

uses
  MsMultiPartFormData, CAO_DM, ZSqlTypes, IdException;

{ TFileUpload }

Function TFileUpload.Init : Boolean;
begin
     Result :=False;

     FilenameEdit1.Text :='';
     Label1.Caption       :='';
     UploadBtn.Enabled    :=False;

     ShopUser          :=DM1.ReadString  ('SHOP','SHOPTRANS_USER','');
     ShopPW            :=DM1.ReadString  ('SHOP','SHOPTRANS_SECRET','');
     ShopUpdateURL     :=DM1.ReadString  ('SHOP','UPDATE_URL','');

     ProxyAuthenticate :=DM1.ReadString  ('SHOP','PROXY_AUTH','');
     ProxyPassword     :=DM1.ReadString  ('SHOP','PROXY_PASS','');
     ProxyPort         :=DM1.ReadInteger ('SHOP','PROXY_PORT',0);
     ProxyServer       :=DM1.ReadString  ('SHOP','PROXY_SERV','');
     ProxyUsername     :=DM1.ReadString  ('SHOP','PROXY_USER','');

     ShopTyp           :=tShopTyp(DM1.ReadInteger ('SHOP','TYP',ord(stOSC)));

     if ShopTyp=stXTC then
     begin
       // MD5-Paßwort erzeugen
       DM1.Uniquery.Close;
       DM1.Uniquery.Sql.Text :='SELECT MD5("'+StringToSql(ShopPW)+
                               '") as MD5_PASS';
       DM1.Uniquery.Open;
       ShopPW_MD5 :=DM1.Uniquery.FieldByName ('MD5_PASS').AsString;
       DM1.Uniquery.Close;
     end;

     if length(ShopUpdateURL)=0 then
     begin
        MessageDlg ('Die URL für das Shopupdate ist leer !'+#13#10+
                    'Siehe Datei->Einstellungen (Shop)',mterror,[mbok],0);
     end else Result :=True;
end;
//------------------------------------------------------------------------------
Function TFileUpload.ProduktImage   (var Name, LocalFile : String;
                                     Size : TImageSize) : Boolean;
var D : String;
begin
     FName   :='';
     Upload  :=False;
     Running :=False;

     Typ     :='products_image';

     if Size = isLarge then
     begin
        Action  :='products_image_upload_large';
        Caption :='Produkt-Bild hochladen (Groß)';
     end else
     if Size = isMedium then
     begin
        Action  :='products_image_upload_med';
        Caption :='Produkt-Bild hochladen (Mittel)';
     end
        else
     begin
        Action  :='products_image_upload';
        Caption :='Produkt-Bild hochladen';
     end;


     // products_image_large
     // products_image_med

     if Init then ShowModal;

     D :=FilenameEdit1.Text;
     if (length(D)>0)and(D[1]='"')and(D[length(D)]='"') then
     begin
        Delete (D,1,1);
        Delete (D,length(D),1);
     end;
     D:=uppercase(extractfileext(D));

     result :=(Upload)and(length(FName)>0);
     if result then
     begin
        Name :=FName;
        LocalFile :=LocalFileName;
     end
     else LocalFileName :='';
end;
//------------------------------------------------------------------------------
Function TFileUpload.KategorieImage (var Name : String) : Boolean;
var D : String;
begin
     FName   :='';
     Upload  :=False;
     Running :=False;
     Typ     :='categories_image';
     Action  :='categories_image_upload';
     Caption :='Kategorie-Bild hochladen';

     if Init then ShowModal;

     D :=FilenameEdit1.Text;
     if (length(D)>0)and(D[1]='"')and(D[length(D)]='"') then
     begin
        Delete (D,1,1);
        Delete (D,length(D),1);
     end;
     D:=uppercase(extractfileext(D));

     result :=(Upload)and(length(FName)>0);
     if result then Name :=FName;
end;
//------------------------------------------------------------------------------
Function TFileUpload.HerstellerImage (var Name : String) : Boolean;
var D : String;
begin
     FName   :='';
     Upload  :=False;
     Running :=False;
     Typ     :='manufacturers_image';
     Action  :='manufacturers_image_upload';
     Caption :='Hersteller-Bild hochladen';

     if Init then ShowModal;

     D :=FilenameEdit1.Text;
     if (length(D)>0)and(D[1]='"')and(D[length(D)]='"') then
     begin
        Delete (D,1,1);
        Delete (D,length(D),1);
     end;
     D:=uppercase(extractfileext(D));

     result :=(Upload)and(length(FName)>0);
     if result then Name :=FName;
end;
//------------------------------------------------------------------------------
procedure TFileUpload.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose :=not Running;
end;

procedure TFileUpload.UploadBtnClick(Sender: TObject);
var ResponseStream          : TStringStream;
    MultiPartFormDataStream : TMsMultiPartFormDataStream;
    Buf                     : Char;
    I                       : Integer;
    Code,Msg,FN,D,Res       : String;
begin
  FName :='';
  D :=FilenameEdit1.Text;
  if (length(D)>0)and(D[1]='"')and(D[length(D)]='"') then
  begin
     Delete (D,1,1);
     Delete (D,length(D),1);
  end;

  LocalFileName :=D;

  UploadBtn.Enabled       :=False;
  FilenameEdit1.Enabled :=False;
  Label1.Caption          :='';
  Screen.Cursor           :=crHourGlass;
  MultiPartFormDataStream := TMsMultiPartFormDataStream.Create;

  ResponseStream := TStringStream.Create('');
  try
     if ShopTyp=stXTC then
     begin
        IdHTTP1.Request.Username :='';
        IdHTTP1.Request.Password :='';
     end
        else
     begin
        IdHTTP1.Request.Username :=ShopUser;
        IdHTTP1.Request.Password :=ShopPW;
     end;

     if (length(ShopUser)>0)and(length(ShopPW)>0) then
     begin
          IdHTTP1.Request.BasicAuthentication :=True;
          IdHTTP1.HttpOptions :=[hoInProcessAuth];
     end;


     //IdHTTP1.Request.Username          :=ShopUser;
     //IdHTTP1.Request.Password          :=ShopPW;

     IdHttp1.Request.ContentType := MultiPartFormDataStream.RequestContentType;

     MultiPartFormDataStream.AddFormField('action',action);

     if ShopTyp=stXTC then
     begin
        MultiPartFormDataStream.AddFormField('user',ShopUser);
        MultiPartFormDataStream.AddFormField('password',ShopPW_MD5);
     end;

     MultiPartFormDataStream.AddFile( Typ, D, 'form-data');

     { You must make sure you call this method *before* sending the stream }
     MultiPartFormDataStream.PrepareStreamForDispatch;
     MultiPartFormDataStream.Position := 0;

     {
     if (length(ShopUser)>0)and(length(ShopPW)>0) then
     begin
          IdHTTP1.Request.BasicAuthentication :=True;
          IdHTTP1.HttpOptions :=[hoInProcessAuth];
     end;
     }
     IdHTTP1.ProxyParams.BasicAuthentication :=length(ProxyServer)>0;
     IdHTTP1.ProxyParams.ProxyPassword       :=ProxyPassword;
     IdHTTP1.ProxyParams.ProxyPort           :=ProxyPort;
     IdHTTP1.ProxyParams.ProxyServer         :=ProxyServer;
     IdHTTP1.ProxyParams.ProxyUsername       :=ProxyUsername;


     try
       IdHTTP1.Post( ShopUpdateURL,
                     MultiPartFormDataStream,
                     ResponseStream );

       Upload :=True; // Bild ist hochgeladen worden
     except

       on e: exception do
         begin
            if e is EIdConnClosedGracefully then
            begin
               Upload :=True;
               UploadBtn.Enabled :=True;
            end
               else
            begin
               MessageDlg ('Übertragungsfehler :'+#13#10+
                                 e.message, mterror,[mbok],0);
               Upload :=False;
               UploadBtn.Enabled :=True;
            end;
         end;
     end;
  finally
     MultiPartFormDataStream.Free;

     ResponseStream.Position :=0;
     Res :='';
     for i:=0 to ResponseStream.Size-1 do
     begin
        ResponseStream.Read (buf,1);
        Res :=Res+Buf;
     end;

     Code :='';
     MsG  :='';
     FN   :='';
{$IFDEF PRO}
     if Pos('<?XML',uppercase(Res))>0  then
     begin
        ShopTransForm.GetStatus(Res,Code,Msg,FN);
        if Code <>'0' then
        begin
           MessageDlg ('Übertragungsfehler : Code '+Code+#13#10+
                       'Meldung : '+Msg,mterror,[mbok],0);
        end else FName :=FN;
     end
        else
     begin
{$ENDIF}
       ResponseStream.Position :=0;
       FName :=ResponseStream.ReadString (255);
{$IFDEF PRO}
     end;
{$ENDIF}
     Label1.Caption :=FName;
     ResponseStream.Free;
     FilenameEdit1.Enabled :=True;
  end;
  Screen.Cursor :=crDefault;

  if Upload then Close;
end;

procedure TFileUpload.FileNameEdit1Change(Sender: TObject);
var D : String;
begin
  D :=FilenameEdit1.Text;
  if (length(D)>0)and(D[1]='"')and(D[length(D)]='"') then
  begin
     Delete (D,1,1);
     Delete (D,length(D),1);
  end;
  UploadBtn.Enabled :=(length(D)>0)and
                      (Fileexists(D));
end;

end.

