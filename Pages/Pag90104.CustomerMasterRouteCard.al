page 90104 "Customer Master Route Card"
{
    ApplicationArea = All;
    Caption = 'Customer Master Route Card';
    PageType = Card;
    SourceTable = "Customer Route Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                }
                field("Contact ID"; Rec."Contact ID")
                {
                    ToolTip = 'Specifies the value of the Contact ID field.';
                    ApplicationArea = All;
                }
            }
            group(Route)
            {
                field("Delivery Route"; Rec."Delivery Route")
                {
                    ToolTip = 'Specifies the value of the Delivery Route field.';
                    ApplicationArea = All;
                }
                field("Delivery Sequence"; Rec."Delivery Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Delivery Sequence field.';
                    ApplicationArea = All;
                }
                field("Drop Sequence"; Rec."Drop Sequence")
                {
                    ToolTip = 'Specifies the value of the Drop Sequence field.';
                    ApplicationArea = All;
                }
            }
            group(Call)
            {
                field("Call Book ID"; Rec."Call Book ID")
                {
                    ToolTip = 'Specifies the value of the Call Book ID field.';
                    ApplicationArea = All;
                }
                field("Call Time"; Rec."Call Time")
                {
                    ToolTip = 'Specifies the value of the Call Time field.';
                    ApplicationArea = All;
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
                        CreateCallDistribution(Rec);
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
                        L_CallLogList: Page "Call Distributions";
                    begin
                        L_Calllogs.Reset();
                        L_Calllogs.SetRange("Customer Account", Rec."Customer Account");
                        if L_Calllogs.FindSet() then begin
                            L_CallLogList.SetTableView(L_Calllogs);
                            L_CallLogList.Run();
                        end;
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

    local procedure CreateCallDistribution(Rec: Record "Customer Route Master")
    var
        L_CallDistribution: Record "Call Distributions";
        L_CallDistribution1: Record "Call Distributions";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesRecSetup: Record "Sales & Receivables Setup";
        L_Customer: Record Customer;
        L_CallBookSetup: Record "Call Book Setup";
        L_CallBookSetup1: Record "Call Book Setup";
        Day: Text;
        SystemTime: Time;
        NewDate: Date;
        DayTime: DateTime;
        L_Date: Record Date;
    begin
        Clear(SystemTime);
        Clear(Day);
        Clear(NewDate);
        Clear(DayTime);
        L_CallBookSetup.Reset();
        L_CallBookSetup.SetRange("Call Book ID", Rec."Call Book ID");
        if L_CallBookSetup.FindFirst() then;

        L_Customer.Get(Rec."Customer Account");
        SalesRecSetup.Get();
        L_CallDistribution.Reset();
        L_CallDistribution.SetRange("Customer Account", Rec."Customer Account");
        L_CallDistribution.SetRange(Contact, Rec."Contact ID");
        L_CallDistribution.SetRange("Call Book ID", Rec."Call Book ID");
        L_CallDistribution.SetFilter(Status, '%1', L_CallDistribution.Status::Open);
        if L_CallDistribution.FindFirst() then begin
            L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
            L_CallDistribution.Validate(Contact, Rec."Contact ID");
            L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
            L_CallDistribution.Validate(Telephone, L_Customer."Phone No.");
            L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
            L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
            //Pranali08242023_US_13869++
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
                //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Pranali08222023_US_13869
                // end
                // else
                L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
            end;

            //Pranali08242023_US_13869--
            L_CallDistribution.Validate("Planned Time", Rec."Call Time");
            L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
            L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
            L_CallDistribution.Modify(true);
            Message('Call Log Updated.');
        end else begin
            L_CallDistribution.Init();
            L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
            L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
            L_CallDistribution.Validate(Contact, Rec."Contact ID");
            L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
            L_CallDistribution.Validate(Telephone, L_Customer."Phone No.");
            L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
            L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
            //Pranali08242023_US_13869++
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
                //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Pranali08222023_US_13869
                // end
                // else
                L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
            end;
            //Pranali08242023_US_13869--
            L_CallDistribution.Validate("Planned Time", Rec."Call Time");
            L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
            // L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));//Pranali08222023_US_13869
            L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
            L_CallDistribution.Insert(true);
            Message('Call Log Created.');
        end;
    end;

    //Pranali_New_Screen_Cust++
    // local procedure CreateNewSalesOrder()
    // var
    //     L_SalesHeader: Record "Sales Header";
    //     L_SalesHeader1: Record "Sales Header";
    //     SalesRecSetup: Record "Sales & Receivables Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     L_Customer: Record Customer;
    //     L_Salesorder: page "Sales Order";
    // begin
    //     SalesRecSetup.Get();
    //     L_SalesHeader.Reset();
    //     L_SalesHeader.Init();
    //     L_SalesHeader.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Order Nos.", WORKDATE, TRUE));
    //     L_SalesHeader.Validate("Document Type", L_SalesHeader."Document Type"::Order);
    //     L_SalesHeader.Validate("Sell-to Customer No.", Rec."Customer Account");
    //     L_SalesHeader.Validate("Shipping Agent Code", Rec."Delivery Route");
    //     L_SalesHeader.Insert(true);
    //     L_SalesHeader1.Reset();
    //     L_SalesHeader1.SetRange(L_SalesHeader1."No.", L_SalesHeader."No.");
    //     L_Salesorder.SetTableView(L_SalesHeader1);
    //     L_Salesorder.Run();
    // end;
    //Pranali_New_Screen_Cust--

}
