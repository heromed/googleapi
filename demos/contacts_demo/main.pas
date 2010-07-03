unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GoogleLogin, StdCtrls, GHelper,GContacts,Generics.Collections,NativeXml,GDataCommon,
  ExtCtrls, ComCtrls, ToolWin, Menus, ImgList,JPEG, ExtDlgs;

type
  TForm3 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Label5: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    ImageList1: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox3: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    ListBox2: TListBox;
    Label11: TLabel;
    ComboBox4: TComboBox;
    Label12: TLabel;
    ComboBox5: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox6: TComboBox;
    Label15: TLabel;
    ComboBox7: TComboBox;
    Image1: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ToolButton3: TToolButton;
    OpenPictureDialog1: TOpenPictureDialog;
    ToolButton4: TToolButton;
    Button1: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form3: TForm3;
  Contact: TGoogleContact;
  Loginer: TGoogleLogin;
  GmailContact: string;
  List:TList<TContact>;

implementation

uses Profile;

{$R *.dfm}

procedure TForm3.ComboBox1Change(Sender: TObject);
var i:integer;
begin
  if ComboBox1.ItemIndex>0 then
    begin
      ListBox1.Items.Clear;
      List:=TList<TContact>.Create;
      List:=Contact.ContactsByGroup[ComboBox1.Items[ComboBox1.ItemIndex]];
      for i:=0 to List.Count - 1 do
        begin
          if List[i].TagTitle.Value='' then
            if List[i].PrimaryEmail<>'' then
              ListBox1.Items.Add(List[i].PrimaryEmail)
            else
              ListBox1.Items.Add('NoName Contact')
          else
            ListBox1.Items.Add(List[i].TagTitle.Value)
        end;
    end
 else
   begin
     ListBox1.Items.Clear;
     for i:=0 to Contact.Contacts.Count - 1 do
        begin
          if Contact.Contacts[i].TagTitle.Value='' then
            if Contact.Contacts[i].PrimaryEmail<>'' then
              ListBox1.Items.Add(Contact.Contacts[i].PrimaryEmail)
            else
              ListBox1.Items.Add('NoName Contact')
          else
              ListBox1.Items.Add(Contact.Contacts[i].TagTitle.Value)
        end;
   end;
end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
  case Contact.Contacts[ListBox1.ItemIndex].Emails[ComboBox2.ItemIndex].EmailType of
    ttHome:label7.Caption:='��������';
    ttOther:label7.Caption:='������';
    ttWork:label7.Caption:='�������';
  end;
end;

procedure TForm3.ComboBox3Change(Sender: TObject);
begin
case Contact.Contacts[ListBox1.ItemIndex].Phones[ComboBox3.ItemIndex].PhoneType of
 tpAssistant:label9.Caption:='���������������';
 tpCallback:label9.Caption:='������������';
 tpCar:label9.Caption:='�������������';
 TpCompany_main:label9.Caption:='������� �������';
 tpFax:label9.Caption:='����';
 tpHome:label9.Caption:='��������';
 tpHome_fax:label9.Caption:='�������� ����';
 tpIsdn:label9.Caption:='ISDN';
 tpMain:label9.Caption:='��������';
 tpMobile:label9.Caption:='���������';
 tpOther:label9.Caption:='������';
 tpOther_fax:label9.Caption:='���� (������)';
 tpPager:label9.Caption:='�������';
 tpRadio:label9.Caption:='������������';
 tpTelex:label9.Caption:='������';
 tpTty_tdd:label9.Caption:='IP-�������';
 TpWork:label9.Caption:='�������';
 tpWork_fax:label9.Caption:='������� ����';
 tpWork_mobile:label9.Caption:='������� ���������';
 tpWork_pager:label9.Caption:='������� �������';
end;
end;

procedure TForm3.ComboBox4Change(Sender: TObject);
begin
 case Contact.Contacts[ListBox1.ItemIndex].WebSites[ComboBox4.ItemIndex].SiteType of
   twHomePage:label17.Caption:='�������� ��������';
   twBlog:label17.Caption:='����';
   twProfile:label17.Caption:='�������';
   twHome:label17.Caption:='������ ����';
   twWork:label17.Caption:='������� ����';
   twOther:label17.Caption:='������';
   twFtp:label17.Caption:='FTP';
 end;
end;

procedure TForm3.ComboBox5Change(Sender: TObject);
begin
  case Contact.Contacts[ListBox1.ItemIndex].Relations[ComboBox5.ItemIndex].Realition of
   tr_None:label13.Caption:='����������';
   tr_Assistant:label13.Caption:='��������';
   tr_Brother:label13.Caption:='����';
   tr_Child:label13.Caption:='�������';
   tr_domestic_partner:label13.Caption:='';
   tr_Father:label13.Caption:='�������';
   tr_Friend:label13.Caption:='����';
   tr_Manager:label13.Caption:='���������';
   tr_Mother:label13.Caption:='����';
   tr_parent:label13.Caption:='��������';
   tr_Partner:label13.Caption:='�������';
   tr_referred_by:label13.Caption:='������������';
   tr_Relative:label13.Caption:='��������';
   tr_Sister:label13.Caption:='������';
   tr_Spouse:label13.Caption:='�������';
  end;
end;

procedure TForm3.ComboBox6Change(Sender: TObject);
begin
  case Contact.Contacts[ListBox1.ItemIndex].IMs[ComboBox6.ItemIndex].Protocol of
    tiAIM:label18.Caption:='AIM';
    tiMSN:label18.Caption:='MSN';
    tiYAHOO:label18.Caption:='YAHOO';
    tiSKYPE:label18.Caption:='SKYPE';
    tiQQ:label18.Caption:='QQ';
    tiGOOGLE_TALK:label18.Caption:='GOOGLE TALK';
    tiICQ:label18.Caption:='ICQ';
    tiJABBER:label18.Caption:='JABBER';
  end;
end;

procedure TForm3.ComboBox7Change(Sender: TObject);
begin
  label19.Caption:=Contact.Contacts[ListBox1.ItemIndex].UserFields[ComboBox7.ItemIndex].Value
end;

procedure TForm3.ListBox1Click(Sender: TObject);
var img: TJPEGImage;
    i:integer;
begin
try
  if Contact.RetriveContactPhoto(ListBox1.ItemIndex)<>nil then
    Image1.Picture.Assign(Contact.RetriveContactPhoto(ListBox1.ItemIndex))
  else
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'noimage.jpg');
  label2.Caption:=Contact.Contacts[ListBox1.ItemIndex].TagName.FullNameString;
  label4.Caption:=Contact.Contacts[ListBox1.ItemIndex].TagOrganization.OrgName.Value+' '+Contact.Contacts[ListBox1.ItemIndex].TagOrganization.OrgTitle.Value;

  ComboBox2.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].Emails.Count-1 do
    ComboBox2.Items.Add(Contact.Contacts[ListBox1.ItemIndex].Emails[i].Address);
  if ComboBox2.Items.Count>0 then
    begin
      ComboBox2.ItemIndex:=0;
      ComboBox2Change(self);
    end;

  ComboBox3.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].Phones.Count - 1 do
    ComboBox3.Items.Add(Contact.Contacts[ListBox1.ItemIndex].Phones[i].Text);
  if ComboBox3.Items.Count>0 then
    begin
      ComboBox3.ItemIndex:=0;
      ComboBox3Change(self);
    end;

  ComboBox4.Items.Clear;
    for I := 0 to Contact.Contacts[ListBox1.ItemIndex].WebSites.Count - 1 do
    ComboBox4.Items.Add(Contact.Contacts[ListBox1.ItemIndex].WebSites[i].Href);
  if ComboBox4.Items.Count>0 then
    begin
      ComboBox4.ItemIndex:=0;
      ComboBox4Change(self);
    end;

  ComboBox5.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].Relations.Count - 1 do
    ComboBox5.Items.Add(Contact.Contacts[ListBox1.ItemIndex].Relations[i].Value);
  if ComboBox5.Items.Count>0 then
    begin
      ComboBox5.ItemIndex:=0;
      ComboBox5Change(self);
    end;

  ComboBox6.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].IMs.Count - 1 do
    ComboBox6.Items.Add(Contact.Contacts[ListBox1.ItemIndex].IMs[i].Address);
  if ComboBox6.Items.Count>0 then
    begin
      ComboBox6.ItemIndex:=0;
      ComboBox6Change(self);
    end;

  ComboBox7.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].UserFields.Count - 1 do
    ComboBox7.Items.Add(Contact.Contacts[ListBox1.ItemIndex].UserFields[i].Key);
  if ComboBox7.Items.Count>0 then ComboBox7.ItemIndex:=0;

  ListBox2.Items.Clear;
  for I := 0 to Contact.Contacts[ListBox1.ItemIndex].PostalAddreses.Count - 1 do
   ListBox2.Items.Add(Contact.Contacts[ListBox1.ItemIndex].PostalAddreses[i].FormattedAddress.Value)

except

end;
end;

procedure TForm3.ListBox1DblClick(Sender: TObject);
begin
  Contact.Contacts[ListBox1.ItemIndex].TagName.FullName.Value:='������ ���� ��������';
  Contact.Contacts[ListBox1.ItemIndex].TagName.GivenName.Value:='������';
  Contact.Contacts[ListBox1.ItemIndex].TagName.AdditionalName.Value:='����';
  Contact.Contacts[ListBox1.ItemIndex].TagName.FamilyName.Value:='��������';


//  Contact.Contacts[ListBox1.ItemIndex].TagTitle.Value:='������ ���� ��������';
  Contact.Contacts[ListBox1.ItemIndex].PrimaryEmail:='vlad383@mail.ru';
  Contact.UpdateContact(ListBox1.ItemIndex);
  ListBox1.Items[ListBox1.ItemIndex]:=Contact.Contacts[ListBox1.ItemIndex].ContactName;
//Contact.UpdateContact(Contact.Contacts[ListBox1.ItemIndex]);
//if Contact.AddContact(Contact.Contacts[ListBox1.ItemIndex])then
//  ShowMessage('Created');
//  StatusBar1.Panels[3].Text:=IntToStr(Contact.Contacts.Count);
//  ListBox1.Items.Add(Contact.Contacts.Last.ContactName)
end;

procedure TForm3.ToolButton1Click(Sender: TObject);
begin
ProfileForm.Show;
end;

procedure TForm3.ToolButton2Click(Sender: TObject);
var i:integer;
     iCounterPerSec: TLargeInteger;
     T1, T2: TLargeInteger; //�������� �������� �� � ����� ��������

begin
  if Loginer.Login()=lrOk then
    begin
      Contact:=TGoogleContact.Create(self,Loginer.Auth,GmailContact);
    //�������� �����
      QueryPerformanceFrequency(iCounterPerSec);
      QueryPerformanceCounter(T1);


      StatusBar1.Panels[1].Text:=IntToStr(Contact.RetriveGroups);
      StatusBar1.Panels[3].Text:=IntToStr(Contact.RetriveContacts);
      //Contact.LoadContactsFromFile('ContactList.xml');

      //����������
      QueryPerformanceCounter(T2);
      StatusBar1.Panels[5].Text:=(FormatFloat('0.0000', (T2 - T1) / iCounterPerSec) + ' ���.');


      QueryPerformanceFrequency(iCounterPerSec);
      QueryPerformanceCounter(T1);
      Contact.SaveContactsToFile('ContactList.xml');
       QueryPerformanceCounter(T2);
      ShowMessage((FormatFloat('0.0000', (T2 - T1) / iCounterPerSec) + ' ���.'));

      ListBox1.Items.Clear;
      for i:=0 to Contact.Contacts.Count - 1 do
        begin
          ListBox1.Items.Add(Contact.Contacts[i].ContactName)
        end;
      ComboBox1.Items.Clear;
      ComboBox1.Items.Add('���');
      for i:=0 to Contact.Groups.Count - 1 do
        ComboBox1.Items.Add(Contact.Groups[i].Title.Value);
      ComboBox1.ItemIndex:=1;
    end;
end;

procedure TForm3.ToolButton3Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
     Contact.UpdatePhoto(ListBox1.ItemIndex,OpenPictureDialog1.FileName);
end;

procedure TForm3.ToolButton4Click(Sender: TObject);
begin
  Contact.DeletePhoto(ListBox1.ItemIndex);
 //FormGogle.Show
end;

end.
