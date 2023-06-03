unit mMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Net.URLClient, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
  Soap.Rio, Soap.SOAPHTTPClient, Soap.InvokeRegistry;

type
  TmyPair = record
    Key, Value: String;
  end;

  TfmMain = class(TForm)
    btRun: TButton;
    eMySQL: TLabeledEdit;
    eWebSevice: TLabeledEdit;
    StatusBar1: TStatusBar;
    mmWebServiceParams: TMemo;
    lbWebServiceParams: TLabel;
    HTTPRIO1: THTTPRIO;
    mmSQLstatement: TMemo;
    lbSQLstatement: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure eWebSeviceChange(Sender: TObject);
    procedure eMySQLChange(Sender: TObject);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure HTTPRIO1AfterExecute(const MethodName: string;
      SOAPResponse: TStream);
    procedure btRunClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    SOAPRequestCount: Int64;
    function ReadIniSetting(Sec, Key, Def: String): String;
    procedure WriteIniSetting(Sec, Key, Value: String);
  public
  end;

procedure GetParams(const Source: String; slParams, slValues: TStringList);

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  System.IniFiles, IBusinessAPI1, dmUnit, mRun, System.SyncObjs,
  ActiveX, ShellAPI;

const
  DEF_MYSQL_CONNECTION =
    'server=127.0.0.1 port=3306 user_name=root password= database=test_db';
  DEF_WEBSEVICE_CONNECTION = 'http://localhost:33322/soap/IBusinessAPI';
  INI_FILE = '.\Setting.ini';
  INI_SEC = 'CONNECTIONS';

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CoUninitialize();
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  eMySQL.Text := ReadIniSetting(INI_SEC, 'MYSQL', DEF_MYSQL_CONNECTION);
  eWebSevice.Text := ReadIniSetting(INI_SEC, 'WEBSEVICE',
    DEF_WEBSEVICE_CONNECTION);
  {$IFDEF MSWINDOWS}
    ShellExecute(0, nil, 'del_xml.bat', nil, nil, SW_SHOWNORMAL);
  {$ENDIF}

  run := TRun.Create(True);
  run.Event := TEvent.Create(nil, false, false, '');
  run.Start;
end;

function TfmMain.ReadIniSetting(Sec, Key, Def: String): String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(INI_FILE);
  try
    Result := Ini.ReadString(Sec, Key, Def);
    if Result = Def then
      WriteIniSetting(Sec, Key, Def);
  finally
    Ini.Free;
  end;
end;

procedure TfmMain.WriteIniSetting(Sec, Key, Value: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(INI_FILE);
  try
    Ini.WriteString(Sec, Key, Value);
  finally
    Ini.Free;
  end;
end;

procedure TfmMain.eMySQLChange(Sender: TObject);
begin
  WriteIniSetting(INI_SEC, 'MYSQL', eMySQL.Text);
end;

procedure TfmMain.eWebSeviceChange(Sender: TObject);
begin
  WriteIniSetting(INI_SEC, 'WEBSEVICE', eWebSevice.Text);
end;

procedure TfmMain.HTTPRIO1AfterExecute(const MethodName: string;
  SOAPResponse: TStream);
var
  sl: TStringList;
begin
  SOAPResponse.Position := 0;
  sl := TStringList.Create;
  sl.LoadFromStream(SOAPResponse);
  sl.SaveToFile('.\SOAPResponse_' + IntTostr(SOAPRequestCount)+ '.xml');
  sl.Free;
end;

procedure TfmMain.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  sl: TStringList;
begin
  SOAPRequest.Position := 0;
  sl := TStringList.Create;
  sl.LoadFromStream(SOAPRequest);
  inc(SOAPRequestCount);
  sl.SaveToFile('.\SOAPRequest_' + IntTostr(SOAPRequestCount) + '.xml');
  sl.Free;
end;

procedure GetParams(const Source: String; slParams, slValues: TStringList);
var
  i: Word;
  m1: Word;
  str: String;

begin
  str := Source;
  // format string
  i := 1;
  while i <= length(str) do
    if (not(AnsiChar(str[i]) in ([' ', '0' .. '9', 'a' .. 'z', 'A' .. 'Z', '_', '=', '.',
      '@']))) or ((str[i] = ' ') and ((i + 1) < length(str)) and
      (str[i + 1] = ' ')) or ((str[i] = '=') and ((i + 1) < length(str)) and
      (str[i + 1] = '=')) then
      Delete(str, i, 1)
    else
      inc(i);

  for i := 1 to slParams.Count do
  begin
    m1 := Pos(slParams[i - 1], str);
    if m1 > 0 then
      Delete(str, 1, m1 + length(slParams[i - 1]) - 1)
    else
      continue;

    if (str[1] = '=') then
      Delete(str, 1, 1)
    else
      continue;

    m1 := Pos(' ', str);
    if m1 > 1 then
      slValues[i - 1] := Copy(str, 1, m1 - 1)
    else if m1 = 1 then
      slValues[i - 1] := ''
    else
      slValues[i - 1] := str;
  end;
end;

procedure TfmMain.btRunClick(Sender: TObject);
begin
  run.Event.SetEvent;
end;

end.
