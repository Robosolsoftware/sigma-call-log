page 90103 "Call Log Setup List"
{
    ApplicationArea = All;
    Caption = 'Call Log Setup List';
    PageType = List;
    SourceTable = "Customer Route Master";
    UsageCategory = Administration;
    CardPageId = "Call log Setup";
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'SalesPerson/Purchaser Code';
                }
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer No.';
                }
                field("Delivery Route"; Rec."Delivery Route")
                {
                    ToolTip = 'Specifies the value of the Delivery Route field.';
                    ApplicationArea = All;
                    Caption = 'Shipping Agent Code';
                }
                field("Delivery Sequence"; Rec."Delivery Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Delivery Sequence field.';
                    ApplicationArea = All;
                    Caption = 'Shipping Agent Service Code';
                }
            }
        }
    }
}
