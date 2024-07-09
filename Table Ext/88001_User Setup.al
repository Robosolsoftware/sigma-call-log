tableextension 88001 "CL User Setup" extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(88001; "Allow to Edit Call log"; Boolean)
        {
            Caption = 'Allow to Edit Delegated SalesPerson/Purchaser Code';
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