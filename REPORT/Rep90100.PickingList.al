// report 90100 "Picking_List"  //Pranali_New_Screen_Cust++
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = all;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Picking_List.rdl';
//     Caption = 'Picking_List';

//     dataset
//     {

//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = where("Document Type" = const(Order));
//             RequestFilterFields = "Location Code", "Shipment Date", "Shipping Agent Code", "Shipping Agent Service Code";
//             column(LocationCode_SalesHeader; "Location Code")
//             {
//             }
//             column(ShipmentDate_SalesHeader; "Shipment Date")
//             {
//             }
//             column(ShippingAgentCode_SalesHeader; "Shipping Agent Code")
//             {
//             }
//             column(ShippingAgentServiceCode_SalesHeader; "Shipping Agent Service Code")
//             {
//             }
//             column(G_CompanyInfo_Pic; G_CompanyInfo.Picture)
//             {

//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 // DataItemTableView = SORTING("Document Type", "Document No.");
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemLinkReference = "Sales Header";
//                 column(DocumentNo_SalesLine; "Document No.")
//                 {
//                 }
//                 column(No_SalesLine; "No.")
//                 {
//                 }

//                 column(Description_SalesLine; Description)
//                 {
//                 }
//                 column(UnitofMeasureCode_SalesLine; "Unit of Measure Code")
//                 {
//                 }
//                 column(Quantity_SalesLine; Quantity)
//                 {
//                 }
//                 column(UnitPrice_SalesLine; "Unit Price")
//                 {
//                 }
//                 column(VAT_SalesLine; "VAT %")
//                 {
//                 }
//                 column(LineAmount_SalesLine; "Line Amount")
//                 {
//                 }
//                 column(ShippingAgentCode_SalesLine; "Shipping Agent Code")
//                 {
//                 }
//                 trigger OnPreDataItem()
//                 begin
//                     G_CompanyInfo.Get();
//                     G_CompanyInfo.CalcFields(Picture);
//                 end;
//             }

//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     // field()
//                     // {
//                     //     ApplicationArea = All;
//                     //     trigger OnValidate()
//                     //     begin

//                     //     end;
//                     // }
//                 }
//             }

//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }

//     }

//     // rendering
//     // {
//     //     layout(LayoutName)
//     //     {
//     //         Type = RDLC;
//     //         LayoutFile = 'mylayout.rdl';
//     //     }
//     // }

//     var
//         G_CompanyInfo: Record "Company Information";

// }