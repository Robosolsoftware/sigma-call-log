// page 90100 "Call Logs"
// {
//     ApplicationArea = All;
//     Caption = 'Call Logs';
//     PageType = List;
//     SourceTable = "Call Log";
//     UsageCategory = Administration;
//     CardPageID = "Call Log Card";
//     RefreshOnActivate = true;
//     DataCaptionExpression = PageCaption;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field(CallBookIDFilter; CallBookIDFilter)
//                 {
//                     Caption = 'Call Book ID';
//                     trigger OnLookup(var Text: Text): Boolean
//                     begin

//                     end;

//                     trigger OnValidate()
//                     begin
//                         CallBookIDFilterOnAfterValidate;
//                     end;
//                 }
//                 field(SalesPersonCodeFilter; SalesPersonCodeFilter)
//                 {
//                     Caption = 'SalesPerson/Purchaser Code';
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         SalesPurchaserList: Page "Salespersons/Purchasers";
//                     begin
//                         SalesPurchaserList.LookupMode := true;
//                         if SalesPurchaserList.RunModal() = Action::LookupOK then
//                             Text := SalesPurchaserList.GetSelectionFilter()
//                         else
//                             exit(false);

//                         exit(true);
//                     end;

//                     trigger OnValidate()
//                     begin
//                         SalesPersonCodeFilterOnAfterValidate;
//                     end;
//                 }

//             }
//             repeater(Control1)
//             {
//                 field(Status; Rec.Status)
//                 {
//                     ToolTip = 'Specifies the value of the Status field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                     ApplicationArea = All;
//                     Visible = false;
//                     Editable = false;
//                 }
//                 field("Call Book ID"; Rec."Call Book ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Salesperson; Rec.Salesperson)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Customer Account"; Rec."Customer Account")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Account field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Customer Account Name"; Rec."Customer Account Name")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Account Name field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Contact No."; Rec."Contact No.")
//                 {
//                     ToolTip = 'Specifies the value of the Contact No. field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Contact Name"; Rec."Contact Name")
//                 {
//                     ToolTip = 'Specifies the value of the Contact Name field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Telephone No."; Rec."Telephone No.")
//                 {
//                     ToolTip = 'Specifies the value of the Telephone No. field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Route Number"; Rec."Route Number")
//                 {
//                     ToolTip = 'Specifies the value of the Route Number field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Delivery Day"; Rec."Delivery Day")
//                 {
//                     ToolTip = 'Specifies the value of the Delivery Day field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Delivery Date"; Rec."Delivery Date")
//                 {
//                     ToolTip = 'Specifies the value of the Delivery Date field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Planned Date"; Rec."Planned Date")
//                 {
//                     ToolTip = 'Specifies the value of the Planned Date field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Planned Time"; Rec."Planned Time")
//                 {
//                     ToolTip = 'Specifies the value of the Planned Time field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action(NewCallLogAddin)
//             {
//                 AccessByPermission = TableData "Call Log" = RIM;
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Create Initial Log';
//                 Image = Document;
//                 ToolTip = 'Create new call log.';

//                 trigger OnAction()
//                 begin
//                     Rec.CreateAndShowNewCallLog();
//                 end;
//             }
//         }
//     }
//     var
//         CallBookIDFilter: Text;
//         SalesPersonCodeFilter: Text;
//         PageCaption: Text;
//         G_SalesPerson: Record "Salesperson/Purchaser";

//     local procedure CallBookIDFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         CurrPage.SaveRecord;
//         SetRecFilters;
//         SetCaption();
//     end;

//     local procedure SalesPersonCodeFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         CurrPage.SaveRecord;
//         SetRecFilters;
//         SetCaption();
//     end;

//     procedure SetRecFilters()
//     begin
//         if CallBookIDFilter <> '' then
//             Rec.SetFilter(Rec."Call Book ID", CallBookIDFilter)
//         else
//             Rec.SetRange(Rec."Call Book ID");

//         if SalesPersonCodeFilter <> '' then
//             Rec.SetFilter(Rec.Salesperson, SalesPersonCodeFilter)
//         else
//             Rec.SetRange(Rec.Salesperson);
//         CurrPage.Update(false);
//     end;

//     local procedure SetCaption()
//     begin
//         PageCaption := GetFilterDescription();
//     end;

//     local procedure GetFilterDescription(): Text
//     var
//         ObjTranslation: Record "Object Translation";
//         SourceTableName: Text;
//         SalesSrcTableName: Text;
//         Description: Text;
//     begin
//         GetRecFilters;

//         if CallBookIDFilter <> '' then
//             // SourceTableName := ObjTranslation.TranslateObject(ObjTranslation."Object Type"::Table, 90100);
//             SourceTableName := 'Call Book ID';
//         SalesSrcTableName := '';
//         Description := '';
//         if SalesPersonCodeFilter <> '' then begin
//             SalesSrcTableName := ObjTranslation.TranslateObject(ObjTranslation."Object Type"::Table, 13);
//             G_SalesPerson.Code := CopyStr(SalesPersonCodeFilter, 1, MaxStrLen(G_SalesPerson.Code));
//             if G_SalesPerson.FindFirst() then
//                 Description := G_SalesPerson.Name;
//         end;
//         exit(StrSubstNo('%1 %2 %3 %4 %5 %6', 'Call Logs', SourceTableName, CallBookIDFilter, SalesSrcTableName, SalesPersonCodeFilter, Description));
//     end;

//     local procedure GetRecFilters()
//     begin
//         if Rec.GetFilters <> '' then
//             UpdateBasicRecFilters;
//     end;

//     local procedure UpdateBasicRecFilters()
//     begin
//         CallBookIDFilter := Rec.GetFilter("Call Book ID");
//         SalesPersonCodeFilter := Rec.GetFilter(Salesperson);
//     end;
// }
