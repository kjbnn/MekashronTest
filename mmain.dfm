object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'YK_TEST VERSION 4.0   '#169' 2023 Copyright: ukzeropoint@gmail.com'
  ClientHeight = 414
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    556
    414)
  PixelsPerInch = 96
  TextHeight = 15
  object lbWebServiceParams: TLabel
    Left = 8
    Top = 272
    Width = 285
    Height = 15
    Caption = 'WebServiceParams (Entity_Add && Telemarketing_add)'
  end
  object lbSQLstatement: TLabel
    Left = 8
    Top = 96
    Width = 139
    Height = 15
    Caption = 'User data for calback table'
  end
  object btRun: TButton
    Left = 120
    Top = 360
    Width = 318
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = btRunClick
  end
  object eMySQL: TLabeledEdit
    Left = 8
    Top = 24
    Width = 540
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 101
    EditLabel.Height = 15
    EditLabel.Caption = 'MySQL connection'
    TabOrder = 1
    OnChange = eMySQLChange
  end
  object eWebSevice: TLabeledEdit
    Left = 8
    Top = 64
    Width = 540
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 120
    EditLabel.Height = 15
    EditLabel.Caption = 'WebSevice connection'
    TabOrder = 2
    OnChange = eWebSeviceChange
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 395
    Width = 556
    Height = 19
    Panels = <
      item
        Width = 150
      end>
    ExplicitTop = 400
  end
  object mmWebServiceParams: TMemo
    Left = 8
    Top = 288
    Width = 540
    Height = 63
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      
        'ol_EntityId=192 ol_UserName=bis ol_Password=123 BusinessId=1  Em' +
        'ployee_EntityId=1  '
      
        'CategoryID=2 Password=password CountryISO=RU affiliate_entityID=' +
        '1'
      'campaignID=1 ')
    TabOrder = 4
  end
  object mmSQLstatement: TMemo
    Left = 8
    Top = 112
    Width = 540
    Height = 146
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'DELETE FROM test_db.callback;'
      
        'INSERT INTO test_db.callback (Date,DID,CID,Number,Confirmed,Lang' +
        'uage,Prefix,isExtracted, '
      'FirstName, LastName, Email) '
      
        'VALUES ('#39'2023-02-20 15:02:00'#39','#39'972 55-946-1380'#39','#39'89519064313'#39','#39'1' +
        #39',1,'#39'RU'#39','#39#39',0,'#39'Yury'#39', '#39'Kostiv'#39', '
      #39'ukzeropoint@gmail.com'#39');'
      
        'INSERT INTO test_db.callback (Date,DID,CID,Number,Confirmed,Lang' +
        'uage,Prefix,isExtracted, '
      'FirstName, LastName, Email) '
      
        'VALUES ('#39'2023-02-28 15:02:00'#39','#39'972 55-946-1380'#39','#39'89064441057'#39','#39'1' +
        #39',1,'#39'RU'#39','#39#39',0,'#39'Mark'#39', '#39'Dragon'#39', '
      #39'mdrag@gmail.com'#39');')
    TabOrder = 5
  end
  object HTTPRIO1: THTTPRIO
    OnAfterExecute = HTTPRIO1AfterExecute
    OnBeforeExecute = HTTPRIO1BeforeExecute
    URL = 'http://localhost:33322/soap/IBusinessAPI'
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soUTF8InHeader, soCacheMimeResponse, soUTF8EncodeXML, soSOAP12]
    Left = 448
    Top = 40
  end
end
