table 90101 "Call Book Setup"
{
    Caption = 'Call Book Setup';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Call Book ID";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Call Book ID"; Code[30])
        {
            Caption = 'Call Book ID';
            DataClassification = ToBeClassified;
        }
        field(3; "Call Day"; Enum Weekdays)
        {
            Caption = 'Call Day';
            DataClassification = ToBeClassified;
        }
        field(4; "Employee Responsible"; Code[100])
        {
            Caption = 'Employee Responsible';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Call Book ID")
        {
            Clustered = true;
        }
    }
}
