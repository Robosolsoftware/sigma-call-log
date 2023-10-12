tableextension 90101 SalesAndRecSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50110; "Task Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Nos.';
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}