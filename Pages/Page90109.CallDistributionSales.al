// page 90109 "Sales Distributions" //Pranali_New_Screen_Cust++
// {
//     Caption = 'Sales Distributions';
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = "Sales Header";
//     RefreshOnActivate = true;
//     Editable = true;
//     CardPageId = "Sales Order";
//     SourceTableView = WHERE("Document Type" = CONST(Order));
//     DataCaptionExpression = PageCaption;
//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field(LocationFilter; LocationFilter)
//                 {
//                     Caption = 'Location';
//                     //TableRelation = Location.Code;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         LocationList: Page "Location List";
//                     begin
//                         LocationList.LookupMode := true;
//                         if LocationList.RunModal() = Action::LookupOK then
//                             Text := LocationList.GetSelectionFilter()
//                         else
//                             exit(false);

//                         exit(true);
//                     end;

//                     trigger OnValidate()
//                     begin
//                         LocationFilterOnAfterValidate();
//                     end;
//                 }
//                 field(DateFilter; DateFilter)
//                 {
//                     Caption = 'Date';
//                     trigger OnValidate()
//                     begin
//                         DateFilterOnAfterValidate();
//                     end;
//                 }
//                 field(AgentFilter; AgentFilter)
//                 {
//                     Caption = 'Delivery Route';
//                     TableRelation = "Shipping Agent".Code;
//                     trigger OnValidate()
//                     begin
//                         AgentFilterOnAfterValidate();
//                     end;
//                 }
//                 field(AgentFilterService; AgentFilterService)
//                 {
//                     Caption = 'Drop Sequence';
//                     TableRelation = "Shipping Agent Services".Code;
//                     trigger OnValidate()
//                     begin
//                         AgentServiceFilterOnAfterValidate();
//                     end;
//                 }
//             }
//             repeater(Control1)
//             {
//                 field("Shipping Agent Code"; Rec."Shipping Agent Code")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies which shipping agent is used to transport the items on the sales document to the customer.';
//                 }
//                 field("Shipment Method Code"; Rec."Shipment Method Code")
//                 {
//                     ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
//                     ApplicationArea = All;
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies a unique number that identifies the sales order. The number can be generated automatically from a number series, or you can number each of them manually.';
//                 }
//                 field("Sell-to Customer No."; Rec."Sell-to Customer No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the name of the customer that you’re selling to. By default, the same customer is suggested as the ship-to customer. If needed, you can specify a different ship-to customer on the document.';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
//                 }
//                 field("Shipment Date"; Rec."Shipment Date")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
//                 }
//                 field("Amount Including VAT"; Rec."Amount Including VAT")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document. This will include invoice discounts.';
//                 }
//                 field("Shipped Status"; Rec."Shipped Status")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shipped Status field.';
//                 }
//             }
//         }
//         area(Factboxes)
//         {

//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action("Picking List")
//             {
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedCategory = Report;
//                 Image = Print;
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     PL: Report 90100;
//                     SH: Record "Sales Header";
//                 begin
//                     Clear(PL);
//                     SH.Reset();
//                     if LocationFilter <> '' then
//                         SH.SetFilter(SH."Location Code", '%1', LocationFilter);
//                     if DateFilter <> 0D then
//                         SH.SetFilter(SH."Shipment Date", '%1', DateFilter);
//                     if AgentFilter <> '' then
//                         SH.SetFilter(SH."Shipping Agent Code", '%1', AgentFilter);
//                     if AgentFilterService <> '' then
//                         SH.SetFilter(SH."Shipping Agent Service Code", '%1', AgentFilterService);
//                     if SH.FindSet() then begin
//                         // repeat
//                         // PL.SetTableView(SH);
//                         // PL.RunModal();
//                         Report.RunModal(90100, false, false, SH);
//                         // until SH.Next() = 0;
//                     end;
//                 end;
//             }
//         }
//     }
//     trigger OnAfterGetRecord()
//     begin
//         Rec.CalcFields("Completely Shipped");
//         if Rec."Completely Shipped" = true then begin
//             Rec."Shipped Status" := Rec."Shipped Status"::Complete;
//         end
//         else
//             Rec."Shipped Status" := Rec."Shipped Status"::Incompleted;
//         Rec.Modify();
//     end;

//     var
//         LocationFilter: Code[10];
//         DateFilter: Date;
//         AgentFilter: Code[10];
//         AgentFilterService: Code[10];
//         Location: page "Location List";
//         sales: page "Sales Order List";
//         PageCaption: Text;

//     local procedure LocationFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         // CurrPage.SaveRecord();
//         SetRecFilters;
//         SetCaption();
//     end;

//     local procedure DateFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         // CurrPage.SaveRecord;
//         SetRecFilters;
//         SetCaption();
//     end;

//     local procedure AgentFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         // CurrPage.SaveRecord;
//         SetRecFilters;
//         SetCaption();
//     end;

//     local procedure AgentServiceFilterOnAfterValidate()
//     var
//         myInt: Integer;
//     begin
//         // CurrPage.SaveRecord;
//         SetRecFilters;
//         SetCaption();
//     end;

//     local procedure SetRecFilters()
//     var
//         myInt: Integer;
//     begin
//         if LocationFilter <> '' then
//             Rec.SetRange(Rec."Location Code", LocationFilter)
//         Else
//             Rec.SetRange(Rec."Location Code");

//         if DateFilter <> 0D then
//             Rec.SetRange(Rec."Shipment Date", DateFilter)
//         else
//             Rec.SetRange(Rec."Shipment Date");

//         if AgentFilter <> '' then
//             Rec.SetRange(Rec."Shipping Agent Code", AgentFilter)
//         else
//             Rec.SetRange(Rec."Shipping Agent Code");
//         if AgentFilterService <> '' then
//             Rec.SetRange(Rec."Shipping Agent Service Code", AgentFilterService)
//         else
//             Rec.SetRange(Rec."Shipping Agent Service Code");
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
//         SourceTableName1: Text;
//         SourceTableName2: Text;
//         SourceTableName3: Text;
//     begin
//         if LocationFilter <> '' then begin
//             SourceTableName := 'Location';
//         end;
//         if DateFilter <> 0D then begin
//             SourceTableName1 := 'Date Filter';
//         end;
//         if AgentFilter <> '' then begin
//             SourceTableName2 := 'Agent';
//         end;
//         if AgentFilterService <> '' then begin
//             SourceTableName3 := 'Agent Service';
//         end;
//         exit(StrSubstNo('%1 %2 %3 %4 %5 %6 %7', 'Sales Distributions', SourceTableName, LocationFilter, SourceTableName1, DateFilter, SourceTableName2, AgentFilter, SourceTableName3, AgentFilterService));
//     end;
// }