tableextension 90105 "SalesHeaderExt" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(90100; "Shipped Status"; Enum "Shipped Status")
        {
            DataClassification = ToBeClassified;
        }
        // modify("Completely Shipped")
        // {
        // trigger OnAfterValidate()
        // begin
        //     if Rec."Completely Shipped" = true then begin
        //         Rec."Shipped Status" := Rec."Shipped Status"::Complete;
        //     end
        //     else
        //         Rec."Shipped Status" := Rec."Shipped Status"::Incompleted;
        // end;
        // }

        //Pranali07122023_US_13116++
        field(90101; Round; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,1,2,3';
            OptionMembers = " ","1","2","3";
        }
        field(90102; "Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        //Pranali07122023_US_13116--
    }

    var
        myInt: Integer;
}