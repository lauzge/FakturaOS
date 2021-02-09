{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{Visual PlanIt String Resources - To create language specific versions of
 Visual PlanIt controls, translate the strings in VpSR.INC to the desired
 language and re-compile your application package.}

unit VpSR;
  {- Visual PlanIt String Resources}

interface

{$I vpsr.inc}

type
  // For acquiring the labels that go with each telephone field, i.e. Home, work, fax etc...                                 }
  TVpPhoneType = (ptAssistant, ptCallback, ptCar, ptCompany, ptHome, ptHomeFax,
                  ptISDN, ptMobile, ptOther, ptOtherFax, ptPager, ptPrimary,
                  ptRadio, ptTelex, ptTTYTDD, ptWork, ptWorkFax);

  TVpEMailType = (mtWork, mtHome, mtOther);

  TVpWebSiteType = (wtBusiness, wtPersonal);

  TVpAddressType = (atWork, atHome);

  TVpCategoryType = (ctBusiness, ctClients, ctFamily, ctOther, ctPersonal);

function AddressLabel(AddressType: TVpAddressType): String;
function EMailLabel(EMailType: TVpEMailType): string;
function PhoneLabel(PhoneType: TVpPhoneType): string;
function WebSiteLabel(WebSiteType: TVpWebSiteType): String;
function CategoryLabel(CategoryType: TVpCategoryType): string;

implementation

function AddressLabel(AddressType: TVpAddressType): String;
begin
  Result := '';
  case AddressType of
    atWork : Result := RSWorkAddressLabel;
    atHome : Result := RSHomeAddressLabel;
  end;
end;

function EMailLabel(EmailType: TVpEmaiLType): String;
begin
  Result := '';
  case EMailType of
    mtHome      : Result := RSHomeEMailLabel;
    mtOther     : Result := RSOtherEMailLabel;
    mtWork      : Result := RSWorkEMailLabel;
  end;
end;

function PhoneLabel(PhoneType: TVpPhoneType): string;
begin
  Result := '';
  case PhoneType of
    ptAssistant : Result := RSPhoneTypeLabel1;
    ptCallback  : Result := RSPhoneTypeLabel2;
    ptCar       : Result := RSPhoneTypeLabel3;
    ptCompany   : Result := RSPhoneTypeLabel4;
    ptHome      : Result := RSPhoneTypeLabel5;
    ptHomeFax   : Result := RSPhoneTypeLabel6;
    ptISDn      : Result := RSPhoneTypeLabel7;
    ptMobile    : Result := RSPhoneTypeLabel8;
    ptOther     : Result := RSPhoneTypeLabel9;
    ptOtherFax  : Result := RSPhoneTypeLabel10;
    ptPager     : Result := RSPhoneTypeLabel11;
    ptPrimary   : Result := RSPhoneTypeLabel12;
    ptRadio     : Result := RSPhoneTypeLabel13;
    ptTelex     : Result := RSPhoneTypeLabel14;
    ptTTYTDD    : Result := RSPhoneTypeLabel15;
    ptWork      : Result := RSPhoneTypeLabel16;
    ptWorkFax   : Result := RSPhoneTypeLabel17;
  end;
end;

function WebSiteLabel(WebsiteType: TVpWebsiteType): String;
begin
  Result := '';
  case WebsiteType of
    wtBusiness : Result := RSBusinessWebSiteLabel;
    wtPersonal : Result := RSPersonalWebsiteLabel;
  end;
end;

function CategoryLabel(CategoryType: TVpCategoryType): string;
begin
  Result := '';
  case CategoryType of
    ctBusiness : Result := RSCategoryLabel1;
    ctClients  : Result := RSCategoryLabel2;
    ctFamily   : Result := RSCategoryLabel3;
    ctOther    : Result := RSCategoryLabel5;
    ctPersonal : Result := RSCategoryLabel4;
  end;
end;

end.

