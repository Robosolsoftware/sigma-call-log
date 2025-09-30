tableextension 88002 "CL Customer Trend Header" extends "Customer Trend Header"
{
    fields
    {
        // Add changes to table fields here
        field(88000; "Call Log Salesperson Code"; Code[100])
        {
            Caption = 'Call Log Salesperson Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Customer Route Master"."Salesperson Code" where("Customer Account" = FIELD("Customer No.")));
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}