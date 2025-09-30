pageextension 88002 "CL Customer Trend Card" extends "Customer Trend Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Call Log Salesperson Code"; Rec."Call Log Salesperson Code")
            {
                ApplicationArea = All;
                Caption = 'Call Log Salesperson Code';
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}