table 90102 "Customer Route Master"
{
    Caption = 'Customer Route Master';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Customer Account", "Delivery Route";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Customer Account"; Code[100])
        {
            Caption = 'Customer Account';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(3; "Contact ID"; Code[100])
        {
            Caption = 'Contact ID';
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(4; "Delivery Route"; Text[30])
        {
            Caption = 'Delivery Route';
            DataClassification = ToBeClassified;
            TableRelation = "Delivery Route Master"."Delivery Route";
        }
        field(5; "Drop Sequence"; Integer)
        {
            Caption = 'Drop Sequence';
            DataClassification = ToBeClassified;
        }
        field(6; "Call Book ID"; Code[30])
        {
            Caption = 'Call Book ID';
            DataClassification = ToBeClassified;
            TableRelation = "Call Book Setup"."Call Book ID";
        }
        field(7; "Call Time"; Time)
        {
            Caption = 'Call Time';
            DataClassification = ToBeClassified;
        }
        field(8; "Delivery Sequence"; Code[10])//Pranali07122023_US_13116
        {
            Caption = 'Delivery Sequence';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Delivery Route"));
        }
    }
    keys
    {
        key(PK; "Entry No.", "Customer Account")
        {
            Clustered = true;
        }
    }
}
