pageextension 90110 "SalesOrderExt" extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipping Agent Service Code")
        {
            field(Round; Rec.Round)//Pranali07122023_US_13116
            {
                ApplicationArea = all;
            }
        }
        addafter("Due Date")
        {
            field("Delivery Date"; Rec."Delivery Date")//Pranali07122023_US_13116
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }




    var
        G_SalesHeader1: Record "Sales Header";
}