table 88001 "Call Distributions"
{
    DataClassification = ToBeClassified;

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
            OptionMembers = "Open","Closed","No Order","No Response";
            trigger OnValidate()
            begin
                if Rec.Status <> Rec.Status::Open then begin
                    if not Confirm(StrSubstNo('Are you sure you want to change the status to %1?', Rec.Status), false) then
                        Error('');

                    //Check the permission++
                    if Rec."Employee Responsible" <> GetDelegatedSalesperson then begin
                        if Rec."Delegated Sales/Purchaser Code" = '' then
                            Error('Please select the Delegated Sales/Purchaser Code')
                        else begin
                            if Rec."Delegated Sales/Purchaser Code" <> GetDelegatedSalesperson then
                                Error('You are not Delegated person to close this call log');
                        end;
                    end;
                end;

                //Pranali08302023_US_13869++
                if (Rec.Status = Rec.Status::Closed) OR (Rec.Status = Rec.Status::"No Order") OR (Rec.Status = Rec.Status::"No Response") then begin
                    CreateCallDistribution(Rec);
                end;
                //Pranali08302023_US_13869--
            end;
        }
        field(3; "Customer Account"; Code[30])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     L_Customer: Record Customer;
            // begin
            //     L_Customer.Reset();
            //     L_Customer.SetRange("No.", Rec."Customer Account");
            //     if L_Customer.FindFirst() then begin
            //         if L_Customer.Blocked <> L_Customer.Blocked::" " then
            //             Error('Customer %1 is blocked', L_Customer."No.");
            //     end;
            // end;
        }
        field(4; Contact; Code[30])
        {
            Caption = 'Primary Contact';
            DataClassification = ToBeClassified;

            // trigger OnLookup()
            // var
            //     L_Contact: Record Contact;
            //     L_CountactCard: Page "Contact Card";
            // begin
            //     Clear(L_CountactCard);
            //     L_Contact.Reset();
            //     L_Contact.SetRange("No.", Rec.Contact);
            //     L_CountactCard.SetTableView(L_Contact);
            //     L_CountactCard.Run();
            // end;
        }
        field(5; "Route Number"; Code[30])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = ToBeClassified;
        }
        field(6; "Delivery Day"; Text[30])
        {
            Caption = 'Shipment Day';
            DataClassification = ToBeClassified;
        }
        field(7; "Delivery Date"; Date)
        {
            Caption = 'Shipment Date';
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
            Caption = 'Call log Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Validate("Delivery Date", CalcDate('<+1M>', Rec."Planned Date"));
            end;
        }
        field(9; "Planned Time"; Time)
        {
            Caption = 'Call log Time';
            DataClassification = ToBeClassified;
        }
        field(10; Telephone; Code[30])
        {
            Caption = 'Primary Telephone';
            DataClassification = ToBeClassified;
        }
        field(11; "Call Book ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Employee Responsible"; Code[100])
        {
            Caption = 'SalesPerson/Purchaser Code';
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
            Caption = 'Shipping Agent Service Code';
            DataClassification = ToBeClassified;
        }
        field(17; "Location"; Code[10])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        //Pranali07122023_US_13116--
        field(18; "Secondary Contact"; Code[30])
        {
            Caption = 'Secondary Contact';
            DataClassification = ToBeClassified;

            // trigger OnLookup()
            // var
            //     L_Contact: Record Contact;
            //     L_CountactCard: Page "Contact Card";
            // begin
            //     Clear(L_CountactCard);
            //     L_Contact.Reset();
            //     L_Contact.SetRange("No.", Rec.Contact);
            //     L_CountactCard.SetTableView(L_Contact);
            //     L_CountactCard.Run();
            // end;
        }
        field(19; "Secondary Telephone"; Code[30])
        {
            Caption = 'Secondary Telephone';
            DataClassification = ToBeClassified;
        }
        field(20; "Day Slot No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Call Day"; Text[50])
        {

        }
        field(22; "Primary Contact Name"; Text[100])
        {

        }
        field(23; "Secondary Contact Name"; Text[100])
        {

        }
        field(24; "Weekend Ship. Agnt. Serv. Code"; Code[10])
        {
            Caption = 'Weekend Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Weekend Shipping Agent Code"));
        }
        field(25; "Delegated Sales/Purchaser Code"; Code[100])
        {
            Caption = 'Delegated SalesPerson/Purchaser Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                L_UserSetup: Record "User Setup";
            begin
                //Check Permission++
                if CheckSuperpermission() = false then begin
                    if Rec."Delegated Sales/Purchaser Code" <> '' then begin
                        L_UserSetup.Reset();
                        L_UserSetup.SetRange("User ID", UserId);
                        L_UserSetup.SetFilter("Salespers./Purch. Code", '<>%1', '');
                        if L_UserSetup.FindFirst() then begin
                            if L_UserSetup."Salespers./Purch. Code" <> Rec."Delegated Sales/Purchaser Code" then
                                Error('Please select correct SalesPerson/Purchaser Code. It should be %1', L_UserSetup."Salespers./Purch. Code");
                        end else
                            Error('Setup missing. Please select the "Salespers./Purch. Code" on User Setup for User ID: %1', UserId);
                    end;
                end;
            end;
        }
        field(26; "Weekend Shipping Agent Code"; Text[30])
        {
            Caption = 'Weekend Shipping Agent Code';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent";
            Editable = false;

            trigger OnValidate()
            var
                ShippingAgent: Record "Shipping Agent";
            begin
                if Rec."Weekend Shipping Agent Code" <> '' then begin
                    ShippingAgent.Reset();
                    ShippingAgent.SetRange(code, Rec."Weekend Shipping Agent Code");
                    ShippingAgent.SetRange(Status, ShippingAgent.Status::Released);
                    if Not ShippingAgent.FindFirst() then
                        Error('Status must be equal to Released in Shipping Agent');
                end;
            end;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    local procedure CheckSuperpermission(): Boolean
    var
        L_UserSetup: Record "User Setup";
    begin
        if L_UserSetup.Get(UserId) then begin
            exit(L_UserSetup."Allow to Edit Call log");
        end else
            exit(false);
    end;

    local procedure GetDelegatedSalesperson(): Code[20]
    var
        L_UserSetup: Record "User Setup";
    begin
        L_UserSetup.Reset();
        L_UserSetup.SetRange("User ID", UserId);
        L_UserSetup.SetFilter("Salespers./Purch. Code", '<>%1', '');
        if L_UserSetup.FindFirst() then
            exit(L_UserSetup."Salespers./Purch. Code");

        exit('');

    end;

    local procedure CreateCallDistribution(Rec: Record "Call Distributions")
    var
        L_CallDistribution: Record "Call Distributions";
        L_CallDistribution1: Record "Call Distributions";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        //NoSeriesMgt: Codeunit "No. Series - Batch";
        SalesRecSetup: Record "Sales & Receivables Setup";
        L_Date: Record Date;
        L_ShippingAgentServices: Record "Shipping Agent Services";
        NewDFvar: DateFormula;
        ShippingTime: Text[100];
        NewDate: Date;
        Day: Text;
        L_Contact: Record Contact;
        tes: Page "Posted Sales Invoices";
    begin
        Clear(NewDate);
        Clear(NewDFvar);
        Clear(Day);
        SalesRecSetup.Get();

        L_CallDistribution.Init();
        L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
        L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
        L_CallDistribution.Validate(Contact, Rec.Contact);
        L_CallDistribution.Validate("Secondary Contact", Rec."Secondary Contact");
        L_CallDistribution.Validate("Employee Responsible", Rec."Employee Responsible");
        L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
        L_CallDistribution.Validate(Telephone, Rec.Telephone);
        L_CallDistribution.Validate("Secondary Telephone", Rec."Secondary Telephone");
        L_CallDistribution.Validate("Customer name", Rec."Customer name");
        L_CallDistribution.Validate("Route Number", Rec."Route Number");
        L_CallDistribution.Validate("Route Sequence", Rec."Route Sequence");
        L_CallDistribution.Validate("Weekend Shipping Agent Code", Rec."Weekend Shipping Agent Code");
        L_CallDistribution.Validate("Weekend Ship. Agnt. Serv. Code", Rec."Weekend Ship. Agnt. Serv. Code");
        L_CallDistribution.Validate("Call Day", Rec."Call Day");
        L_Contact.Reset();
        if L_Contact.Get(Rec.Contact) then begin
            L_CallDistribution.Validate(Telephone, L_Contact."Phone No.");
            L_CallDistribution.Validate("Primary Contact Name", L_Contact.Name);
        end;
        L_Contact.Reset();
        if L_Contact.Get(Rec."Secondary Contact") then begin
            L_CallDistribution.Validate("Secondary Telephone", L_Contact."Phone No.");
            L_CallDistribution.Validate("Secondary Contact Name", L_Contact.Name);
        end;
        Day := Rec."Call Day";
        L_Date.Reset();
        L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
        L_Date.SetFilter(L_Date."Period Start", '%1..%2', Rec."Planned Date", CalcDate('+7D', Rec."Planned Date"));
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

        //Update Delivery date and day based on weekend shipping agent service code++
        //This is new requirement++
        if UpperCase(Rec."Call Day") = UpperCase('FRIDAY') then begin
            if Rec."Weekend Ship. Agnt. Serv. Code" <> '' then begin
                L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date")); //Weekend+
            end else begin
                L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Monday++
            end;
        end else begin
            L_ShippingAgentServices.Reset();
            L_ShippingAgentServices.SetRange("Shipping Agent Code", Rec."Route Number");
            L_ShippingAgentServices.SetRange(Code, Rec."Route Sequence");
            if L_ShippingAgentServices.FindFirst() then begin
                if L_ShippingAgentServices."Shipping Time" = NewDFvar then //NewDFvar is blank varible
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"))
                else begin
                    L_CallDistribution.Validate("Delivery Date", CalcDate(L_ShippingAgentServices."Shipping Time", L_CallDistribution."Planned Date"))
                end;
            end else
                L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
        end;

        L_CallDistribution.Validate("Planned Time", Rec."Planned Time");
        // L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));//Pranali08222023_US_13869
        L_CallDistribution.Validate("Day Slot No.", Rec."Day Slot No.");
        L_CallDistribution.Insert(true);
        Message('Next Call log Created.');
    end;


    //Pranali08302023_US_13869++
    // local procedure CreateCallDistribution(Rec: Record "Call Distributions")
    // var
    //     L_CallDistribution: Record "Call Distributions";
    //     L_CallDistribution1: Record "Call Distributions";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     SalesRecSetup: Record "Sales & Receivables Setup";
    //     L_Customer: Record Customer;
    //     L_CallBookSetup: Record "Call Book Setup";
    //     L_CallBookSetup1: Record "Call Book Setup";
    //     Day: Text;
    //     NewDate: Date;
    //     L_Date: Record Date;
    // begin
    //     Clear(Day);
    //     Clear(NewDate);
    //     L_CallBookSetup.Reset();
    //     L_CallBookSetup.SetRange("Call Book ID", Rec."Call Book ID");
    //     if L_CallBookSetup.FindFirst() then;

    //     L_Customer.Get(Rec."Customer Account");
    //     SalesRecSetup.Get();

    //     L_CallDistribution.Init();
    //     L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
    //     L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
    //     L_CallDistribution.Validate(Contact, Rec.Contact);
    //     L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
    //     L_CallDistribution.Validate(Telephone, L_Customer."Phone No.");
    //     L_CallDistribution.Validate("Route Number", Rec."Route Number");
    //     L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");

    //     L_CallBookSetup1.Reset();
    //     L_CallBookSetup1.SetRange(L_CallBookSetup1."Call Book ID", L_CallDistribution."Call Book ID");
    //     if L_CallBookSetup1.FindFirst() then begin
    //         Day := format(L_CallBookSetup1."Call Day");
    //         L_Date.Reset();
    //         L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
    //         L_Date.SetFilter(L_Date."Period Start", '%1..%2', Today, CalcDate('+7D', Today));
    //         if L_Date.FindSet() then begin
    //             repeat
    //                 if (L_Date."Period Name" = Day) and (L_Date."Period Start" = Today) then begin
    //                     NewDate := CalcDate('+7D', L_Date."Period Start");
    //                 end
    //                 else
    //                     if (L_Date."Period Name" = Day) and (L_Date."Period Start" <> Today) then begin
    //                         NewDate := L_Date."Period Start";
    //                     end;
    //             until L_Date.Next() = 0;
    //         end;
    //         L_CallDistribution.Validate("Planned Date", NewDate);
    //         // if Day = 'Friday' then begin
    //         //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); 
    //         // end
    //         // else
    //         L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
    //     end;
    //     L_CallDistribution.Validate("Planned Time", Rec."Planned Time");
    //     L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
    //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
    //     L_CallDistribution.Validate("Route Sequence", Rec."Route Sequence");
    //     L_CallDistribution.Insert(true);
    //     Message('Call Log Created.');
    // end;
    // //Pranali08302023_US_13869--
}
