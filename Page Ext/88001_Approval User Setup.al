pageextension 88001 "CL Approval User Setup" extends "Approval User Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Allow to Edit Call log"; Rec."Allow to Edit Call log")
            {
                ApplicationArea = All;
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