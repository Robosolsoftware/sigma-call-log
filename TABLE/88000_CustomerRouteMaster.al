table 88000 "Customer Route Master"
{
    Caption = 'Customer Route Master';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Customer Account", "Delivery Route";

    fields
    {
        field(2; "Customer Account"; Code[100])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            var
                L_Customer: Record Customer;
            begin
                L_Customer.Reset();
                L_Customer.SetRange("No.", Rec."Customer Account");
                if L_Customer.FindFirst() then begin
                    L_Customer.TestField("QAU Approved");
                    L_Customer.TestField(Status, L_Customer.Status::Released);
                end;

            end;
        }
        field(3; "Contact ID"; Code[100])
        {
            Caption = 'Primary Contact ID';
            DataClassification = ToBeClassified;
            //TableRelation = Contact;
        }
        field(4; "Delivery Route"; Text[30])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent";
            Editable = false;

            trigger OnValidate()
            var
                ShippingAgent: Record "Shipping Agent";
            begin
                if Rec."Delivery Route" <> '' then begin
                    ShippingAgent.Reset();
                    ShippingAgent.SetRange(code, Rec."Delivery Route");
                    ShippingAgent.SetRange(Status, ShippingAgent.Status::Released);
                    if Not ShippingAgent.FindFirst() then
                        Error('Status must be equal to Released in Shipping Agent');
                end;
            end;
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
            //TableRelation = "Call Book Setup"."Call Book ID";
        }
        field(7; "Call Time"; Time)
        {
            Caption = 'Call Time';
            DataClassification = ToBeClassified;
        }
        field(8; "Delivery Sequence"; Code[10])//Pranali07122023_US_13116
        {
            Caption = 'Shipping Agent Service Code';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Delivery Route"));
            Editable = false;

            trigger OnValidate()
            var
                ShippingAgentServices: Record "Shipping Agent Services";
            begin
                if Rec."Delivery Sequence" <> '' then begin
                    ShippingAgentServices.Reset();
                    ShippingAgentServices.SetRange(code, Rec."Delivery Sequence");
                    ShippingAgentServices.SetRange(Status, ShippingAgentServices.Status::Released);
                    if Not ShippingAgentServices.FindFirst() then
                        Error('Status must be equal to Released in Shipping Agent Service');
                end;
            end;
        }
        field(9; "Secondary Contact ID"; Code[100])
        {
            Caption = 'Secondary Contact ID';
            DataClassification = ToBeClassified;
            //TableRelation = Contact;
        }
        field(10; Monday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Tuesday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Wednesday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Thursday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Friday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Saturday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Sunday; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Monday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(18; "Monday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(19; "Monday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }
        field(20; "Tuesday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(21; "Tuesday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(22; "Tuesday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }

        field(23; "Wednesday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(24; "Wednesday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(25; "Wednesday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }

        field(26; "Thursday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(27; "Thursday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(28; "Thursday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }

        field(29; "Friday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(30; "Friday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(31; "Friday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }

        field(32; "Saturday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(33; "Saturday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(34; "Saturday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }

        field(35; "Sunday Time Slot1"; Time)
        {
            Caption = 'Call Time Slot1';
        }
        field(36; "Sunday Time Slot2"; Time)
        {
            Caption = 'Call Time Slot2';
        }
        field(37; "Sunday Time Slot3"; Time)
        {
            Caption = 'Call Time Slot3';
        }
        field(38; "Salesperson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser";
            Caption = 'SalesPerson/Purchaser Code';
        }
        field(39; "Weekend Ship. Agnt. Serv. Code"; Code[10])
        {
            Caption = 'Weekend Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Delivery Route"));
            Editable = false;

            trigger OnValidate()
            var
                ShippingAgentServices: Record "Shipping Agent Services";
            begin
                if Rec."Weekend Ship. Agnt. Serv. Code" <> '' then begin
                    ShippingAgentServices.Reset();
                    ShippingAgentServices.SetRange(code, Rec."Weekend Ship. Agnt. Serv. Code");
                    ShippingAgentServices.SetRange(Status, ShippingAgentServices.Status::Released);
                    if Not ShippingAgentServices.FindFirst() then
                        Error('Status must be equal to Released in Shipping Agent Service');
                end;
            end;
        }

    }
    keys
    {
        key(PK; "Customer Account", "Salesperson Code")
        {
            Clustered = true;
        }
    }


    trigger OnDelete()
    var
        CallDistributions: Record "Call Distributions";
    begin
        CallDistributions.Reset();
        CallDistributions.SetRange("Employee Responsible", Rec."Salesperson Code");
        CallDistributions.SetRange("Customer Account", Rec."Customer Account");
        CallDistributions.SetRange(Status, CallDistributions.Status::Open);
        if CallDistributions.FindFirst() then begin
            if not Confirm('Open call logs exist. Do you want to delete?', false) then
                Error('');

            CallDistributions.Reset();
            CallDistributions.SetRange("Employee Responsible", Rec."Salesperson Code");
            CallDistributions.SetRange("Customer Account", Rec."Customer Account");
            if CallDistributions.FindSet() then
                CallDistributions.DeleteAll();
        end;
    end;
}
