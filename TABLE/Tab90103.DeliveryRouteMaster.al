table 90103 "Delivery Route Master"
{
    Caption = 'Delivery Route Master';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Delivery Route", Description;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Delivery Route"; Text[30])
        {
            Caption = 'Delivery Route';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent".Code;//Pranali05102023
            trigger OnValidate()
            var
                L_ShippingAgent: Record "Shipping Agent";
            begin
                //Pranali05102023++ 
                if L_ShippingAgent.Get(Rec."Delivery Route") then
                    Rec.Description := L_ShippingAgent.Name;
                //Pranali05102023--
            end;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; "Temporary"; Boolean)
        {
            Caption = 'Temporary';
            DataClassification = ToBeClassified;
        }
        field(5; "Delivery Day"; Enum Weekdays)
        {
            Caption = 'Delivery Day';
            DataClassification = ToBeClassified;
        }
        field(6; "Picking Day"; Enum Weekdays)
        {
            Caption = 'Picking Day';
            DataClassification = ToBeClassified;
        }
        field(7; Site; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Warehouse; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(9; Vehicle; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Driver; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Delivery Route")
        {
            Clustered = true;
        }
    }
}
