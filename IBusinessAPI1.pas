// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : C:\ProjectMek\IBusinessAPI.xml
//  >Import : C:\ProjectMek\IBusinessAPI.xml>0
//  >Import : C:\ProjectMek\IBusinessAPI.xml>1
// Version  : 1.0
// (2/4/2023 6:21:27 PM - - $Rev: 108085 $)
// ************************************************************************ //

unit IBusinessAPI1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:unsignedByte    - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  ArrayOfByte = array of Byte;                  { "urn:eSignatureIntf"[GblCplx] }
  ArrayOfFloat = array of Double;               { "urn:CommonWSTypes"[GblCplx] }
  ArrayOfString = array of string;              { "urn:CommonWSTypes"[GblCplx] }
  ArrayOfInt = array of Integer;                { "urn:CommonWSTypes"[GblCplx] }

  // ************************************************************************ //
  // Namespace : urn:BusinessApiIntf-IBusinessAPI
  // soapAction: urn:BusinessApiIntf-IBusinessAPI#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IBusinessAPIbinding
  // service   : IBusinessAPIservice
  // port      : IBusinessAPIPort
  // URL       : http://localhost:33322/soap/IBusinessAPI
  // ************************************************************************ //
  IBusinessAPI = interface(IInvokable)
  ['{FC4260E4-8538-A2CD-8D30-5C86FF7E21B7}']
    function  Ol_login(const UserName: string; const Password: string; const IP: string; const Language: string; const DeviceKind: Integer; const SystemInfo: ArrayOfString; 
                       const Token: string): string; stdcall;
    function  Entity_Add(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const BusinessId: Integer; const Employee_EntityId: Integer; const CategoryID: Integer;
                         const Email: string; const Password: string; const FirstName: string; const LastName: string; const Mobile: string;
                         const CountryISO: string; const affiliate_entityID: Integer): string; stdcall;
    function  UpdateTerminate(const password: string): string; stdcall;
    function  General_Users_Get(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const Fields: ArrayOfString; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; 
                                const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  General_Business_Get(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; const LimitFrom: Integer; 
                                   const LimitCount: Integer): string; stdcall;
    function  Sales_Inventory_Get(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                  const FilterValues: ArrayOfString; const OrderBy: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_PaymentsMethod_Get(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                       const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Entity_Find(const ol_EntityId: Integer; const ol_UserName: string; const ol_Password: string; const BusinessId: Integer; const Limit_entities_per_business: Boolean; const Fields: ArrayOfString; 
                          const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  GenerateUserGuide(const FileName: string; const Guide: string; const Password: string): string; stdcall;
    function  GetUserGuide(const FileName: string; const Guide: string; const Password: string): string; stdcall;
    function  Entity_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const EntityId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString; 
                            const ImageFields: ArrayOfString; const ImageValues: ArrayOfString): string; stdcall;
    function  Sales_Orders_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const orderId: Integer; const BusinessId: Integer; const Employee_EntityId: Integer; 
                                  const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString): string; stdcall;
    function  Sales_Orders_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; 
                               const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Orders_Product_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const order_productId: Integer; const BusinessId: Integer; const EntityId: Integer; 
                                          const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString): string; stdcall;
    function  Sales_Orders_Product_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                       const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Orders_Payment_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const order_paymentId: Integer; const BusinessId: Integer; const EntityId: Integer; 
                                          const ChargePayment: Boolean; const CreateOnFailedCharge: Boolean; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString): string; stdcall;
    function  Entity_Logtraffic(const ol_EntityID: Integer; const device: Integer; const System_: string; const IP: string; const URL: string): string; stdcall;
    function  CustomFields_GetBoxValues(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FieldID: Integer): string; stdcall;
    function  CustomFields_GetTableRecords(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const TableID: Integer; const ParentRecordID: Integer): string; stdcall;
    function  CustomFields_GetFields(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FormID: Integer): string; stdcall;
    function  General_ConnectionData_Get(const password: string): string; stdcall;
    function  Entity_VerifyContactInfo(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const businessId: Integer; const entityID: Integer; const VerifyType: Integer; 
                                       const VerificationCode: string): string; stdcall;
    function  CustomFields_AddBoxValues(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FieldId: Integer; const Values: ArrayOfString): string; stdcall;
    function  Outgoing_get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const MessageType: Integer; const MessageID: Integer; const EntityID: Integer; 
                           const Status: string; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Outgoing_set(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const OutgoingId: Integer; const Status: Integer; const ErrorMessage: string; 
                           const Destination: string): string; stdcall;
    function  Outgoing_add(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const MessageType: Integer; const MessageID: Integer; const Priority: Integer; 
                           const EntityIds: ArrayOfInt; const From: string; const ScheduleTo: string; const Order_DocumentID: Integer; const Destination: string; 
                           const Body: string): string; stdcall;
    function  Entity_Forgotpassword(const ol_UserName: string; const RemindKind: Integer; const Language: string; const businessID: Integer): string; stdcall;
    function  Incoming_Add(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const IncomingType: Integer; const IncomingFromName: string; const IncomingFrom: string; 
                           const Subject: string; const Body: string): string; stdcall;
    function  Purchase_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; const LimitFrom: Integer; 
                           const LimitCount: Integer): string; stdcall;
    function  Purchase_Products_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const purchaseId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                    const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Purchase_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const purchaseId: Integer; const EntityId: Integer; const employee_entityId: Integer; 
                              const affiliate_entityID: Integer; const agent_usr_ID: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString): string; stdcall;
    function  Sales_Document_Issue(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const businessID: Integer; const EntityId: Integer; const Created_employee_entityID: Integer; 
                                   const documentID_prefix: Integer; const documentID: Integer; const DocumentType: Integer; const Order_productIDs: ArrayOfInt; const order_paymentIDs: ArrayOfInt; 
                                   const sendbyemail: Boolean; const sendbysms: Boolean): string; stdcall;
    function  General_DataList_Get(const TableName: string; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString): string; stdcall;
    function  General_Decrypt(const Identification: string): string; stdcall;
    function  Purchase_Product_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const purchase_productId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                      ): string; stdcall;
    function  Purchase_Payment_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const purchase_paymentId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                      ): string; stdcall;
    function  General_Reports_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const DLL_File_Name: string; const FunctionName: string; const ParamsFields: ArrayOfString; 
                                  const ParamsValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  RomaTestFunc(const Password: string; const Mode: Integer; const Params: string): string; stdcall;
    function  Telemarketing_add(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const campaignID: Integer; const EntityIds: ArrayOfInt): string; stdcall;
    function  System_Version_Get(const ol_Username: string; const ol_Password: string): string; stdcall;
    function  Sales_Orders_Payments_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                        const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Products_Categories_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                            const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Purchase_Catalog_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                   const FilterValues: ArrayOfString; const OrderBy: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Documents_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                  const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  UserGuide_ReadWrite(const FileName: string; const Password: string; const Content: string): string; stdcall;
    function  Purchase_Inventory_Count_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const countId: Integer; const businessId: Integer; const Purchase_ProductIds: ArrayOfInt; 
                                              const Counts: ArrayOfInt): string; stdcall;
    function  Purchase_Inventory_Count_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; const LimitFrom: Integer; 
                                           const LimitCount: Integer): string; stdcall;
    function  Purchase_Inventory_Lost_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const lostType: Integer; const Purchase_ProductIds: ArrayOfInt; const Counts: ArrayOfInt
                                             ): string; stdcall;
    function  Sales_Orders_Commissions_Set(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const orderID: Integer; const EntityIds: ArrayOfInt; const Totals: ArrayOfFloat
                                           ): string; stdcall;
    function  Restaurant_Orders_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const rOrderId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                       ): string; stdcall;
    function  Restaurant_Zone_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const zoneId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                     ): string; stdcall;
    function  Restaurant_Zone_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                  const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Restaurant_Tables_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const tableId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                       ): string; stdcall;
    function  Restaurant_Tables_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                    const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Restaurant_Orders_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                    const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  PushNotifications(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const ToEntityId: Integer; const Token: string; const AppId: string; 
                                const Title: string; const Body: string; const MessageText: string; const isSilent: Boolean): string; stdcall;
    function  Entity_Device_Log(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const LogType: Integer; const Devicekind: Integer; const Token: string; 
                                const AppID: string; const log: string; const Latitude: Double; const Longitude: Double; const EventDate: string
                                ): string; stdcall;
    function  Device_Log_Remove(const Password: string): string; stdcall;
    function  Outgoing_Campaign_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                    const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  System_Sync_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const DeviceId: Integer; const Sync_modified_date: string; 
                              const Tables: ArrayOfString): string; stdcall;
    function  General_Business_Device_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const bDeviceId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                             ): string; stdcall;
    function  General_Business_Device_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                          const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Products_Categories_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const CategoryID: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                               ): string; stdcall;
    function  Sales_Product_Packages_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const packageId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString; 
                                            const ProductIds: ArrayOfString; const SellPrices: ArrayOfString): string; stdcall;
    function  Sales_Product_Packages_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                         const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Employees_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                            const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Employees_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const entityId: Integer; const businessId: Integer; const NamesArray: ArrayOfString; 
                               const ValuesArray: ArrayOfString): string; stdcall;
    function  Employees_Shift_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const EntityId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                  const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Employees_Shift_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const entityId: Integer; const businessId: Integer; const NamesArray: ArrayOfString; 
                                     const ValuesArray: ArrayOfString): string; stdcall;
    function  Entity_Device_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const Fields: ArrayOfString; const FilterFields: ArrayOfString; const FilterValues: ArrayOfString; 
                                const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Log_Isapi_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const DateFrom: string; const DateTo: string; const IP: string; 
                            const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Product_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const productId: Integer; const businessId: Integer; const NamesArray: ArrayOfString; 
                                   const ValuesArray: ArrayOfString): string; stdcall;
    function  Sales_Product_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_PaymentsMethod_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const paymentId: Integer; const businessId: Integer; const NamesArray: ArrayOfString; 
                                          const ValuesArray: ArrayOfString): string; stdcall;
    function  Entity_Categories_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const parentId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                    const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Orders_Documents_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                         const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Sales_Orders_Documents_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const order_documentId: Integer; const BusinessId: Integer; const NamesArray: ArrayOfString; 
                                            const ValuesArray: ArrayOfString): string; stdcall;
    function  Outgoing_Campaign_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const messageId: Integer; const businessId: Integer; const NamesArray: ArrayOfString; 
                                       const ValuesArray: ArrayOfString): string; stdcall;
    function  General_Business_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                                      ): string; stdcall;
    function  Entity_Import(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Employee_EntityId: Integer; const affiliate_entityId: Integer; 
                            const ImportId: Integer; const ImportDataJSON: string): string; stdcall;
    function  General_Reports_Export(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const DLL_File_Name: string; const FunctionName: string; const ParamsFields: ArrayOfString; 
                                     const ParamsValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): ArrayOfByte; stdcall;
    function  General_Functions(const FunctionType: string; const InputFields: ArrayOfString; const InputValues: ArrayOfString): string; stdcall;
    function  Telemarketing_Campaign_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                         const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Entity_Files_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const BusinessId: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                               const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Entity_Files_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const FileId: Integer; const BusinessId: Integer; const NamesArray: ArrayOfString; 
                                  const ValuesArray: ArrayOfString; const FileData: ArrayOfByte): string; stdcall;
    function  Tasks_Candidates_Get(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const taskID: Integer; const Fields: ArrayOfString; const FilterFields: ArrayOfString; 
                                   const FilterValues: ArrayOfString; const LimitFrom: Integer; const LimitCount: Integer): string; stdcall;
    function  Tasks_Candidates_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const TaskId: Integer; const entity_employeeID: Integer; const NamesArray: ArrayOfString; 
                                      const ValuesArray: ArrayOfString): string; stdcall;
    function  Tasks_Update(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const TaskId: Integer; const NamesArray: ArrayOfString; const ValuesArray: ArrayOfString
                           ): string; stdcall;
  end;

function GetIBusinessAPI(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IBusinessAPI;


implementation
  uses System.SysUtils;

function GetIBusinessAPI(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IBusinessAPI;
const
  defWSDL = 'C:\ProjectMek\IBusinessAPI.xml';
  defURL  = 'http://localhost:33322/soap/IBusinessAPI';
  defSvc  = 'IBusinessAPIservice';
  defPrt  = 'IBusinessAPIPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IBusinessAPI);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { IBusinessAPI }
  InvRegistry.RegisterInterface(TypeInfo(IBusinessAPI), 'urn:BusinessApiIntf-IBusinessAPI', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IBusinessAPI), 'urn:BusinessApiIntf-IBusinessAPI#%operationName%');
  { IBusinessAPI.Entity_Logtraffic }
  InvRegistry.RegisterParamInfo(TypeInfo(IBusinessAPI), 'Entity_Logtraffic', 'System_', 'System', '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfByte), 'urn:eSignatureIntf', 'ArrayOfByte');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFloat), 'urn:CommonWSTypes', 'ArrayOfFloat');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'urn:CommonWSTypes', 'ArrayOfString');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfInt), 'urn:CommonWSTypes', 'ArrayOfInt');

end.