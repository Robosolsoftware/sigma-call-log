tableextension 88000 SalesAndRecSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(88000; "Task Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Call log Nos.';
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}