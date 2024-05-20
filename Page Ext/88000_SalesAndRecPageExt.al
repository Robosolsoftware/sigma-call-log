pageextension 88000 SalesAndRecSetup extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Task Nos."; Rec."Task Nos.")
            {
                ApplicationArea = All;
                Caption = 'Call log Nos.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        te: Page "Date-Time Dialog";
}