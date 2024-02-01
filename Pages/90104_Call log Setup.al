page 90104 "Call log Setup"
{
    ApplicationArea = All;
    Caption = 'Call Log Setup';
    PageType = Card;
    SourceTable = "Customer Route Master";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = G_EditCallLogSetup;
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'SalesPerson/Purchaser Code';
                }
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer No.';

                    trigger OnValidate()
                    var
                        L_Customer: Record Customer;
                    begin
                        L_Customer.Reset();
                        L_Customer.SetRange("No.", Rec."Customer Account");
                        if L_Customer.FindFirst() then begin
                            Rec."Delivery Route" := L_Customer."Shipping Agent Code";
                            Rec."Delivery Sequence" := L_Customer."Shipping Agent Service Code";
                        end else begin
                            Rec."Delivery Route" := '';
                            Rec."Delivery Sequence" := '';
                        end;

                    end;
                }
                field("Contact ID"; Rec."Contact ID")
                {
                    ToolTip = 'Specifies the value of the Primary Contact ID field.';
                    ApplicationArea = All;
                    Caption = 'Primary Contact ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Page_ContactList: Page "Contact List";
                        Tab_Cont: Record Contact;
                        ContBusRel: Record "Contact Business Relation";
                        ConfirmManagement: Codeunit "Confirm Management";
                        Text002: Label 'Do you wish to create a contact for %1 %2?';
                        L_Customer: Record Customer;
                        UpdateContFromCust: Codeunit "CustCont-Update";
                    begin
                        Clear(Page_ContactList);
                        Page_ContactList.LookupMode(true);

                        ContBusRel.Reset();
                        ContBusRel.SetCurrentKey("Link to Table", "No.");
                        ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
                        ContBusRel.SetRange("No.", Rec."Customer Account");
                        if not ContBusRel.FindFirst() then begin
                            Error('No Contact available for the customer number %1', Rec."Customer Account");
                            // L_Customer.Reset();
                            // L_Customer.SetRange("No.", Rec."Customer Account");
                            // if L_Customer.FindFirst() then begin
                            //     if not ConfirmManagement.GetResponseOrDefault(StrSubstNo(Text002, L_Customer.TableCaption(), L_Customer."No."), true) then
                            //         exit;
                            //     UpdateContFromCust.InsertNewContact(L_Customer, false);
                            //     ContBusRel.FindFirst();
                            // end;
                        end;
                        //Commit();

                        Tab_Cont.FilterGroup(2);
                        Tab_Cont.Reset();
                        Tab_Cont.SetRange("Company No.", ContBusRel."Contact No.");
                        if Tab_Cont.IsEmpty() then begin
                            Tab_Cont.SetRange("Company No.");
                            Tab_Cont.SetRange("No.", ContBusRel."Contact No.");
                        end;
                        Page_ContactList.SetTableView(Tab_Cont);
                        if Page_ContactList.RunModal() = Action::LookupOK then begin
                            Page_ContactList.GetRecord(Tab_Cont);
                            Text := Tab_Cont."No.";
                        end;
                        exit(true);
                    end;

                }
                field("Secondary Contact ID"; Rec."Secondary Contact ID")
                {
                    ToolTip = 'Specifies the value of the Secondary Contact ID field.';
                    ApplicationArea = All;
                    Caption = 'Secondary Contact ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Page_ContactList: Page "Contact List";
                        Tab_Cont: Record Contact;
                        ContBusRel: Record "Contact Business Relation";
                        ConfirmManagement: Codeunit "Confirm Management";
                        Text002: Label 'Do you wish to create a contact for %1 %2?';
                        L_Customer: Record Customer;
                        UpdateContFromCust: Codeunit "CustCont-Update";
                    begin
                        Clear(Page_ContactList);
                        Page_ContactList.LookupMode(true);

                        ContBusRel.Reset();
                        ContBusRel.SetCurrentKey("Link to Table", "No.");
                        ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
                        ContBusRel.SetRange("No.", Rec."Customer Account");
                        if not ContBusRel.FindFirst() then begin
                            Error('No Contact available for the customer number %1', Rec."Customer Account");
                            // L_Customer.Reset();
                            // L_Customer.SetRange("No.", Rec."Customer Account");
                            // if L_Customer.FindFirst() then begin
                            //     if not ConfirmManagement.GetResponseOrDefault(StrSubstNo(Text002, L_Customer.TableCaption(), L_Customer."No."), true) then
                            //         exit;
                            //     UpdateContFromCust.InsertNewContact(L_Customer, false);
                            //     ContBusRel.FindFirst();
                            // end;
                        end;
                        //Commit();

                        Tab_Cont.FilterGroup(2);
                        Tab_Cont.Reset();
                        Tab_Cont.SetRange("Company No.", ContBusRel."Contact No.");
                        if Tab_Cont.IsEmpty() then begin
                            Tab_Cont.SetRange("Company No.");
                            Tab_Cont.SetRange("No.", ContBusRel."Contact No.");
                        end;
                        Page_ContactList.SetTableView(Tab_Cont);
                        if Page_ContactList.RunModal() = Action::LookupOK then begin
                            Page_ContactList.GetRecord(Tab_Cont);
                            Text := Tab_Cont."No.";
                        end;
                        exit(true);
                    end;
                }
            }
            group(Route)
            {
                Editable = false;
                field("Delivery Route"; Rec."Delivery Route")
                {
                    ToolTip = 'Specifies the value of the Delivery Route field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Code';
                }
                field("Delivery Sequence"; Rec."Delivery Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Delivery Sequence field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Service Code';
                }
            }
            group(Call)
            {
                group("Monday Slots")
                {
                    field(Monday; Rec.Monday)
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            Clear(G_MondaySlotsEdit);
                            if Rec.Monday = true then
                                G_MondaySlotsEdit := true
                            else
                                G_MondaySlotsEdit := false;
                        end;
                    }
                    field("Monday Time Slot1"; Rec."Monday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_MondaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Monday', 1, Rec)
                        end;
                    }
                    field("Monday Time Slot2"; Rec."Monday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_MondaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Monday', 2, Rec)
                        end;
                    }
                    field("Monday Time Slot3"; Rec."Monday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_MondaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Monday', 3, Rec)
                        end;
                    }
                }
                group("Tuesday Slots")
                {
                    field(Tuesday; Rec.Tuesday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            Clear(G_TuesdaySlotsEdit);
                            if Rec.Tuesday = true then
                                G_TuesdaySlotsEdit := true
                            else
                                G_TuesdaySlotsEdit := false;

                        end;
                    }
                    field("Tuesday Time Slot1"; Rec."Tuesday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_TuesdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Tuesday', 1, Rec)
                        end;
                    }
                    field("Tuesday Time Slot2"; Rec."Tuesday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_TuesdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Tuesday', 2, Rec)
                        end;
                    }
                    field("Tuesday Time Slot3"; Rec."Tuesday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_TuesdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Tuesday', 3, Rec)
                        end;
                    }
                }

                group("Wednesday Slots")
                {
                    field(Wednesday; Rec.Wednesday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            Clear(G_WednessdaySlotsEdit);
                            if Rec.Wednesday = true then
                                G_WednessdaySlotsEdit := true
                            else
                                G_WednessdaySlotsEdit := false;
                        end;
                    }
                    field("Wednesday Time Slot1"; Rec."Wednesday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_WednessdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Wednesday', 1, Rec)
                        end;
                    }
                    field("Wednesday Time Slot2"; Rec."Wednesday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_WednessdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Wednesday', 2, Rec)
                        end;
                    }
                    field("Wednesday Time Slot3"; Rec."Wednesday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_WednessdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Wednesday', 3, Rec)
                        end;
                    }
                }

                group("Thursday Slots")
                {
                    field(Thursday; Rec.Thursday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin

                            Clear(G_ThursdaySlotsEdit);

                            if Rec.Thursday = true then
                                G_ThursdaySlotsEdit := true
                            else
                                G_ThursdaySlotsEdit := false;
                        end;
                    }
                    field("Thursday Time Slot1"; Rec."Thursday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_ThursdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Thursday', 1, Rec)
                        end;
                    }
                    field("Thursday Time Slot2"; Rec."Thursday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_ThursdaySlotsEdit;
                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Thursday', 2, Rec)
                        end;
                    }
                    field("Thursday Time Slot3"; Rec."Thursday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_ThursdaySlotsEdit;
                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Thursday', 3, Rec)
                        end;
                    }
                }

                group("Friday Slots")
                {
                    field(Friday; Rec.Friday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            Clear(G_FridaySlotsEdit);

                            if Rec.Friday = true then
                                G_FridaySlotsEdit := true
                            else
                                G_FridaySlotsEdit := false;
                        end;
                    }
                    field("Friday Time Slot1"; Rec."Friday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_FridaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Friday', 1, Rec)
                        end;
                    }
                    field("Friday Time Slot2"; Rec."Friday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_FridaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Friday', 2, Rec)
                        end;
                    }
                    field("Friday Time Slot3"; Rec."Friday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_FridaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Friday', 3, Rec)
                        end;
                    }
                }

                group("Saturday Slots")
                {
                    field(Saturday; Rec.Saturday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            Clear(G_SaturdaySlotsEdit);
                            if Rec.Saturday = true then
                                G_SaturdaySlotsEdit := true
                            else
                                G_SaturdaySlotsEdit := false;

                        end;
                    }
                    field("Saturday Time Slot1"; Rec."Saturday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_SaturdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Saturday', 1, Rec)
                        end;
                    }
                    field("Saturday Time Slot2"; Rec."Saturday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_SaturdaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Saturday', 2, Rec)
                        end;
                    }
                    field("Saturday Time Slot3"; Rec."Saturday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_SaturdaySlotsEdit;


                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Saturday', 3, Rec)
                        end;
                    }
                }

                group("Sunday Slots")
                {
                    field(Sunday; Rec.Sunday)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            Clear(G_SundaySlotsEdit);
                            if Rec.Sunday = true then
                                G_SundaySlotsEdit := true
                            else
                                G_SundaySlotsEdit := false;
                        end;
                    }
                    field("Sunday Time Slot1"; Rec."Sunday Time Slot1")
                    {
                        ApplicationArea = All;
                        Editable = G_SundaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Sunday', 1, Rec)
                        end;
                    }
                    field("Sunday Time Slot2"; Rec."Sunday Time Slot2")
                    {
                        ApplicationArea = All;
                        Editable = G_SundaySlotsEdit;
                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Sunday', 2, Rec)
                        end;
                    }
                    field("Sunday Time Slot3"; Rec."Sunday Time Slot3")
                    {
                        ApplicationArea = All;
                        Editable = G_SundaySlotsEdit;

                        trigger OnValidate()
                        var
                            Functions: Codeunit Functions;
                        begin
                            Functions.CheckDulicateTimeSlot('Sunday', 3, Rec)
                        end;
                    }
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Process)
            {
                Caption = 'Process';
                action("&Create Task")
                {
                    ApplicationArea = All;
                    Caption = 'Create Initial Log';
                    Image = NewToDo;
                    ToolTip = 'Create a new task for customer.';

                    trigger OnAction()
                    var
                    begin
                        Rec.TestField("Customer Account");
                        Rec.TestField("Salesperson Code");
                        G_Functions.SetDistribution(Rec);
                        Message('Call Logs has been created');
                    end;
                }
                action("Call Logs")
                {
                    ApplicationArea = All;
                    Caption = 'Call Logs';
                    Image = Calls;
                    ToolTip = 'Open call logs for customer.';

                    trigger OnAction()
                    var
                        L_Calllogs: Record "Call Distributions";
                        L_CallLogList: Page "Call logs";
                    begin
                        L_Calllogs.Reset();
                        L_Calllogs.SetRange("Customer Account", Rec."Customer Account");
                        L_Calllogs.SetRange("Employee Responsible", Rec."Salesperson Code");
                        if L_Calllogs.FindSet() then begin
                            L_CallLogList.IsopenFromCustomerRout(true, L_Calllogs);
                            L_CallLogList.SetTableView(L_Calllogs);
                            L_CallLogList.Run();
                        end else
                            Message('Please Create Initial Log');
                    end;
                }
                // action(NewSalesOrder)
                // {
                //     AccessByPermission = TableData "Sales Header" = RIM;
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Sales Order';
                //     Image = Document;
                //     RunObject = Page "Sales Order";
                //     RunPageLink = "Sell-to Customer No." = FIELD("Customer Account");
                //     RunPageMode = Create;
                //     ToolTip = 'Create a sales order for the customer.';
                //     //  Visible = NOT IsOfficeAddin;
                // }

                //Pranali_New_Screen_Cust++
                // action(CreateSalesOrder)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Sales Order';
                //     ToolTip = 'Create a sales order for the customer';
                //     Image = Document;
                //     trigger OnAction()
                //     begin
                //         CreateNewSalesOrder();
                //     end;
                // }
                //Pranali_New_Screen_Cust--
            }
        }
    }

    var
        G_Functions: Codeunit Functions;
        G_MondaySlotsEdit: Boolean;
        G_TuesdaySlotsEdit: Boolean;
        G_WednessdaySlotsEdit: Boolean;
        G_ThursdaySlotsEdit: Boolean;
        G_FridaySlotsEdit: Boolean;
        G_SaturdaySlotsEdit: Boolean;
        G_SundaySlotsEdit: Boolean;
        G_EditCallLogSetup: Boolean;
        sales: Page "Sales & Receivables Setup";


    trigger OnOpenPage()
    var
        L_Calllogs: Record "Call Distributions";
    begin
        Clear(G_MondaySlotsEdit);
        Clear(G_TuesdaySlotsEdit);
        Clear(G_WednessdaySlotsEdit);
        Clear(G_ThursdaySlotsEdit);
        Clear(G_FridaySlotsEdit);
        Clear(G_SaturdaySlotsEdit);
        Clear(G_SundaySlotsEdit);

        if Rec.Monday = true then
            G_MondaySlotsEdit := true
        else
            G_MondaySlotsEdit := false;

        if Rec.Tuesday = true then
            G_TuesdaySlotsEdit := true
        else
            G_TuesdaySlotsEdit := false;

        if Rec.Wednesday = true then
            G_WednessdaySlotsEdit := true
        else
            G_WednessdaySlotsEdit := false;

        if Rec.Thursday = true then
            G_ThursdaySlotsEdit := true
        else
            G_ThursdaySlotsEdit := false;

        if Rec.Friday = true then
            G_FridaySlotsEdit := true
        else
            G_FridaySlotsEdit := false;

        if Rec.Saturday = true then
            G_SaturdaySlotsEdit := true
        else
            G_SaturdaySlotsEdit := false;

        if Rec.Sunday = true then
            G_SundaySlotsEdit := true
        else
            G_SundaySlotsEdit := false;


        G_EditCallLogSetup := true;
        L_Calllogs.Reset();
        L_Calllogs.SetRange("Customer Account", Rec."Customer Account");
        L_Calllogs.SetRange("Employee Responsible", Rec."Salesperson Code");
        if L_Calllogs.FindFirst() then
            G_EditCallLogSetup := false;
    end;

    trigger OnAfterGetRecord()
    var
        L_Calllogs: Record "Call Distributions";
    begin
        G_EditCallLogSetup := true;
        L_Calllogs.Reset();
        L_Calllogs.SetRange("Customer Account", Rec."Customer Account");
        L_Calllogs.SetRange("Employee Responsible", Rec."Salesperson Code");
        if L_Calllogs.FindFirst() then
            G_EditCallLogSetup := false;
    end;

}
