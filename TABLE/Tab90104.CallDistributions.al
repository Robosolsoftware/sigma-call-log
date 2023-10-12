table 90104 "Call Distributions"
{
    //Caption = 'Call Distributions';
    DataClassification = ToBeClassified;
    //DataCaptionFields = "No.";

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Open","Closed","No Order";
            trigger OnValidate()
            begin
                //Pranali08302023_US_13869++
                if Rec.Status = Rec.Status::Closed then begin
                    CreateCallDistribution(Rec);
                end;
                //Pranali08302023_US_13869--
            end;
        }
        field(3; "Customer Account"; Code[30])
        {
            Caption = 'Customer Account';
            DataClassification = ToBeClassified;
        }
        field(4; Contact; Code[30])
        {
            Caption = 'Contact';
            DataClassification = ToBeClassified;
        }
        field(5; "Route Number"; Code[30])
        {
            Caption = 'Route Number';
            DataClassification = ToBeClassified;
        }
        field(6; "Delivery Day"; Text[30])
        {
            Caption = 'Delivery Day';
            DataClassification = ToBeClassified;
        }
        field(7; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                DateForweek: Record Date;
            begin
                if Rec."Delivery Date" <> 0D then begin
                    if DateForweek.Get(DateForweek."Period Type"::Date, "Delivery Date") then begin
                        Rec."Delivery Day" := DateForweek."Period Name";
                    end;
                end else
                    Rec."Delivery Day" := '';
            end;
        }
        field(8; "Planned Date"; Date)
        {
            Caption = 'Planned Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Validate("Delivery Date", CalcDate('<+1M>', Rec."Planned Date"));
            end;
        }
        field(9; "Planned Time"; Time)
        {
            Caption = 'Planned Time';
            DataClassification = ToBeClassified;
        }
        field(10; Telephone; Code[10])
        {
            Caption = 'Telephone';
            DataClassification = ToBeClassified;
        }
        field(11; "Call Book ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Employee Responsible"; Code[100])
        {
            Caption = 'Employee Responsible';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        //Pranali05222023_US_12667++
        field(13; "Customer name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        //Pranali05222023_US_12667--

        //Pranali07122023_US_13116++
        field(15; Round; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,1,2,3';
            OptionMembers = " ","1","2","3";
        }
        field(16; "Route Sequence"; Code[10])
        {
            Caption = 'Route Sequence';
            DataClassification = ToBeClassified;
        }
        field(17; "Location"; Code[10])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        //Pranali07122023_US_13116--
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    //Pranali08302023_US_13869++
    local procedure CreateCallDistribution(Rec: Record "Call Distributions")
    var
        L_CallDistribution: Record "Call Distributions";
        L_CallDistribution1: Record "Call Distributions";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesRecSetup: Record "Sales & Receivables Setup";
        L_Customer: Record Customer;
        L_CallBookSetup: Record "Call Book Setup";
        L_CallBookSetup1: Record "Call Book Setup";
        Day: Text;
        NewDate: Date;
        L_Date: Record Date;
    begin
        Clear(Day);
        Clear(NewDate);
        L_CallBookSetup.Reset();
        L_CallBookSetup.SetRange("Call Book ID", Rec."Call Book ID");
        if L_CallBookSetup.FindFirst() then;

        L_Customer.Get(Rec."Customer Account");
        SalesRecSetup.Get();

        L_CallDistribution.Init();
        L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
        L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
        L_CallDistribution.Validate(Contact, Rec.Contact);
        L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
        L_CallDistribution.Validate(Telephone, L_Customer."Phone No.");
        L_CallDistribution.Validate("Route Number", Rec."Route Number");
        L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");

        L_CallBookSetup1.Reset();
        L_CallBookSetup1.SetRange(L_CallBookSetup1."Call Book ID", L_CallDistribution."Call Book ID");
        if L_CallBookSetup1.FindFirst() then begin
            Day := format(L_CallBookSetup1."Call Day");
            L_Date.Reset();
            L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
            L_Date.SetFilter(L_Date."Period Start", '%1..%2', Today, CalcDate('+7D', Today));
            if L_Date.FindSet() then begin
                repeat
                    if (L_Date."Period Name" = Day) and (L_Date."Period Start" = Today) then begin
                        NewDate := CalcDate('+7D', L_Date."Period Start");
                    end
                    else
                        if (L_Date."Period Name" = Day) and (L_Date."Period Start" <> Today) then begin
                            NewDate := L_Date."Period Start";
                        end;
                until L_Date.Next() = 0;
            end;
            L_CallDistribution.Validate("Planned Date", NewDate);
            // if Day = 'Friday' then begin
            //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); 
            // end
            // else
            L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
        end;
        L_CallDistribution.Validate("Planned Time", Rec."Planned Time");
        L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
        L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
        L_CallDistribution.Validate("Route Sequence", Rec."Route Sequence");
        L_CallDistribution.Insert(true);
        Message('Call Log Created.');
    end;
    //Pranali08302023_US_13869--
}
