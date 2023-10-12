// page 90109 "Call Log Card"
// {
//     ApplicationArea = All;
//     Caption = 'Call Log Card';
//     PageType = Card;
//     SourceTable = "Call Log";
//     InsertAllowed = false;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                     ApplicationArea = All;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ToolTip = 'Specifies the value of the Status field.';
//                     ApplicationArea = All;
//                     Editable = G_StatusEditable;
//                     trigger OnValidate()
//                     begin
//                         if Rec.Status = Rec.Status::Closed then begin
//                             G_StatusEditable := false;
//                         end;
//                     end;
//                 }
//                 field("Customer Account"; Rec."Customer Account")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Account field.';
//                     ApplicationArea = All;
//                 }
//                 field("Customer Account Name"; Rec."Customer Account Name")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Account Name field.';
//                     ApplicationArea = All;
//                 }
//                 field("Contact No."; Rec."Contact No.")
//                 {
//                     ToolTip = 'Specifies the value of the Contact No. field.';
//                     ApplicationArea = All;
//                 }
//                 field("Contact Name"; Rec."Contact Name")
//                 {
//                     ToolTip = 'Specifies the value of the Contact Name field.';
//                     ApplicationArea = All;
//                 }
//                 field("Telephone No."; Rec."Telephone No.")
//                 {
//                     ToolTip = 'Specifies the value of the Telephone No. field.';
//                     ApplicationArea = All;
//                 }
//                 field("Route Number"; Rec."Route Number")
//                 {
//                     ToolTip = 'Specifies the value of the Route Number field.';
//                     ApplicationArea = All;
//                 }
//                 field("Delivery Date"; Rec."Delivery Date")
//                 {
//                     ToolTip = 'Specifies the value of the Delivery Date field.';
//                     ApplicationArea = All;
//                 }
//                 field("Delivery Day"; Rec."Delivery Day")
//                 {
//                     ToolTip = 'Specifies the value of the Delivery Day field.';
//                     ApplicationArea = All;
//                 }
//                 field("Planned Date"; Rec."Planned Date")
//                 {
//                     ToolTip = 'Specifies the value of the Planned Date field.';
//                     ApplicationArea = All;
//                 }
//                 field("Planned Time"; Rec."Planned Time")
//                 {
//                     ToolTip = 'Specifies the value of the Planned Time field.';
//                     ApplicationArea = All;
//                 }
//                 field("Call Book ID"; Rec."Call Book ID")
//                 {
//                     ToolTip = 'Specifies the value of the Call Book ID field.';
//                     ApplicationArea = All;
//                 }
//                 field(Salesperson; Rec.Salesperson)
//                 {
//                     ToolTip = 'Specifies the value of the Salesperson field.';
//                     ApplicationArea = All;
//                 }
//                 field("Closing Reason"; Rec."Closing Reason")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(navigation)
//         {
//             group("&Customer")
//             {
//                 action("Customer Trends")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Customer Trends';
//                     Image = ViewDetails;
//                     ToolTip = 'Open Customer Trends for customer.';
//                     trigger OnAction()
//                     var
//                         L_CustomerTrendTable: Record CustomerTrends;
//                         L_CustomerTrendsPage: Page "Customer Trends";
//                         L_EventSub: Codeunit EventSub;
//                         SalesH: Record "Sales Header";
//                         ChTrends: Record CustomerTrends;
//                     begin
//                         // Clear(L_CustomerTrendsPage);
//                         // L_CustomerTrendTable.Reset();
//                         // L_CustomerTrendTable.SetRange("Customer No.", Rec."Customer Account");
//                         // if L_CustomerTrendTable.FindSet() then begin
//                         //     L_CustomerTrendsPage.SetTableView(L_CustomerTrendTable);
//                         //     L_CustomerTrendsPage.Run();
//                         // end;
//                         ChTrends.DeleteAll();
//                         L_EventSub.CreateCustomertrends(SalesH, Rec."Customer Account");
//                     end;

//                 }
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         Clear(G_StatusEditable);
//         if Rec.Status = Rec.Status::Closed then
//             G_StatusEditable := false
//         else
//             G_StatusEditable := true;
//     end;

//     var
//         G_StatusEditable: Boolean;
// }
