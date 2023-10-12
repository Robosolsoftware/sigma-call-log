page 90103 "Customer Route List"
{
    ApplicationArea = All;
    Caption = 'Customer Route List';
    PageType = List;
    SourceTable = "Customer Route Master";
    UsageCategory = Administration;
    CardPageId = "Customer Master Route Card";
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                }
                field("Delivery Route"; Rec."Delivery Route")
                {
                    ToolTip = 'Specifies the value of the Delivery Route field.';
                    ApplicationArea = All;
                }
                field("Delivery Sequence"; Rec."Delivery Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Delivery Sequence field.';
                    ApplicationArea = All;
                }
                field("Call Book ID"; Rec."Call Book ID")
                {
                    ToolTip = 'Specifies the value of the Call Book ID field.';
                    ApplicationArea = All;
                }
                field("Call Time"; Rec."Call Time")
                {
                    ToolTip = 'Specifies the value of the Call Time field.';
                    ApplicationArea = All;
                }
                field("Drop Sequence"; Rec."Drop Sequence")
                {
                    ToolTip = 'Specifies the value of the Drop Sequence field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
