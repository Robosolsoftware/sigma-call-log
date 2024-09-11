page 88002 "Call logs"
{
    ApplicationArea = All;
    Caption = 'Call Logs';
    PageType = Worksheet;
    SourceTable = "Call Distributions";
    UsageCategory = Administration;
    CardPageId = "Call log Card";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(SalesPersonCodeFilter; SalesPersonCodeFilter)
                {
                    Caption = 'SalesPerson/Purchaser Code';
                    Editable = Edit_SalesPersonCodeFilter;
                    TableRelation = "Salesperson/Purchaser";
                    trigger OnValidate()
                    begin
                        // SalesPersonCodeFilterOnAfterValidate;
                        SetRecFilters;
                    end;
                }
                field(DelegatedSalesPersonCodeFilter; DelegatedSalesPersonCodeFilter)
                {
                    Caption = 'Delegated SalesPerson/Purchaser Code';
                    TableRelation = "Salesperson/Purchaser";
                    trigger OnValidate()
                    begin
                        //DelegatedSalesPersonCodeFilterOnAfterValidate;
                        SetRecFilters;
                    end;
                }
                field(CustomerAccountNoFilter; CustomerAccountNoFilter)
                {
                    Caption = 'Sell-to Customer No.';
                    Editable = Edit_CustomerAccountNo;
                    TableRelation = Customer;
                    trigger OnValidate()
                    begin
                        //CustomerAccountNoFilterOnAfterValidate;
                        SetRecFilters;
                    end;
                }

                field(DateFilter; DateFilter)
                {
                    Caption = 'Call log Date';
                    trigger OnValidate()
                    begin
                        //DateFilterOnAfterValidate();
                        SetRecFilters;
                    end;
                }
                field(StatusFilter; StatusFilter)
                {
                    Caption = 'Status';

                    trigger OnValidate()
                    begin
                        //StatusFilterOnAfterValidate;
                        SetRecFilters;
                    end;
                }
            }
            repeater(Control1)
            {
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        L_CallDistributionCard: Page "Call log Card";
                        L_CallDistribution: Record "Call Distributions";
                    begin
                        Clear(L_CallDistributionCard);
                        L_CallDistribution.Reset();
                        L_CallDistribution.SetRange("No.", Rec."No.");
                        if L_CallDistribution.FindFirst() then begin
                            L_CallDistributionCard.SetTableView(L_CallDistribution);
                            L_CallDistributionCard.Run();
                        end;
                    end;
                }
                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'SalesPerson/Purchaser Code';
                }
                field("Delegated Sales/Purchaser Code"; Rec."Delegated Sales/Purchaser Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Delegated SalesPerson/Purchaser Code';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ToolTip = 'Specifies the value of the Planned Date field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Planned Time"; Rec."Planned Time")
                {
                    ToolTip = 'Specifies the value of the Planned Time field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        L_Customer: Record Customer;
                        L_CustomerCard: Page "Customer Card";
                    begin
                        Clear(L_CustomerCard);
                        L_Customer.Reset();
                        L_Customer.SetRange("No.", Rec."Customer Account");
                        L_CustomerCard.SetTableView(L_Customer);
                        L_CustomerCard.Run();
                    end;
                }
                field("Customer name"; Rec."Customer name")//Pranali05222023_US_12667
                {
                    ToolTip = 'Specifies the value of the Customer name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Primary Contact field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Primary Contact';

                    trigger OnAssistEdit()
                    var
                        L_Contact: Record Contact;
                        L_CountactCard: Page "Contact Card";
                    begin
                        Clear(L_CountactCard);
                        L_Contact.Reset();
                        L_Contact.SetRange("No.", Rec.Contact);
                        L_CountactCard.SetTableView(L_Contact);
                        L_CountactCard.Run();
                    end;
                }
                field("Primary Contact Name"; Rec."Primary Contact Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Telephone; Rec.Telephone)
                {
                    ToolTip = 'Specifies the value of the Primary Telephone field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Primary Telephone';
                }
                field("Secondary Contact"; Rec."Secondary Contact")
                {
                    ToolTip = 'Specifies the value of the Secondary Contact field.';
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        L_Contact: Record Contact;
                        L_CountactCard: Page "Contact Card";
                    begin
                        Clear(L_CountactCard);
                        L_Contact.Reset();
                        L_Contact.SetRange("No.", Rec."Secondary Contact");
                        L_CountactCard.SetTableView(L_Contact);
                        L_CountactCard.Run();
                    end;
                }
                field("Secondary Contact Name"; Rec."Secondary Contact Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Secondary Telephone"; Rec."Secondary Telephone")
                {
                    ToolTip = 'Specifies the value of the Secondary Telephone field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")//Pranali05222023_US_12667
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }


                field("Route Number"; Rec."Route Number")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Code';

                }
                field("Route Sequence"; Rec."Route Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service Code field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Service Code';

                }
                field("Weekend Shipping Agent Code"; Rec."Weekend Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Weekend Shipping Agent Code field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Weekend Shipping Agent Code';
                }
                field("Weekend Ship. Agnt. Serv. Code"; Rec."Weekend Ship. Agnt. Serv. Code")
                {
                    ToolTip = 'Specifies the value of the Weekend Shipping Agent Service Code field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Weekend Shipping Agent Service Code';
                }
                field("Delivery Day"; Rec."Delivery Day")
                {
                    ToolTip = 'Specifies the value of the Delivery Day field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipment Day';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipment Date';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1905767507; Notes)//Pranali05232023_US_12620
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Assign Delegated SalesPerson/Purchaser Code")
            {
                ApplicationArea = All;
                Image = Change;

                trigger OnAction()
                var
                    UpdateDelegatedPerson: Report "Select Delegated SalesPerson";
                    L_CallLogs: Record "Call Distributions";
                begin
                    L_CallLogs.Reset();
                    Clear(UpdateDelegatedPerson);
                    CurrPage.SetSelectionFilter(L_CallLogs);
                    if L_CallLogs.FindSet() then begin
                        UpdateDelegatedPerson.SetTableView(L_CallLogs);
                        UpdateDelegatedPerson.Run();
                    end;
                end;
            }
        }
    }
    var

        StatusFilter: Option " ","Open","Closed","No Order","No Response";
        DateFilter: Date;
        CallBookIDFilter: Text;
        SalesPersonCodeFilter: Code[20];
        DelegatedSalesPersonCodeFilter: Code[20];
        CustomerAccountNoFilter: Text;
        PageCaption: Text;
        G_SalesPerson: Record "Salesperson/Purchaser";
        G_IsopenFromCustomerRout: Boolean;
        G_SalesPersonCodeFilter: Text;
        G_CustomerAccountNo: Text;
        Edit_SalesPersonCodeFilter: Boolean;
        Edit_CustomerAccountNo: Boolean;



    trigger OnOpenPage()
    var
        L_UserSetup: Record "User Setup";
    begin
        if G_IsopenFromCustomerRout = true then begin
            //Get Data ++
            SalesPersonCodeFilter := G_SalesPersonCodeFilter;
            CustomerAccountNoFilter := G_CustomerAccountNo;
            DateFilter := Today;
            StatusFilter := StatusFilter::Open;


            //Make Editable/UnEditable++
            Edit_CustomerAccountNo := false;
            Edit_SalesPersonCodeFilter := false;

            //Aply Filter++
            SetRecFilters;

        end else begin
            //Make Editable/UnEditable++
            Edit_CustomerAccountNo := true;
            Edit_SalesPersonCodeFilter := true;

            //Get Data ++
            L_UserSetup.Reset();
            L_UserSetup.SetRange("User ID", UserId);
            if L_UserSetup.FindFirst() then begin
                if L_UserSetup."Salespers./Purch. Code" <> '' then
                    SalesPersonCodeFilter := L_UserSetup."Salespers./Purch. Code";
            end;
            DateFilter := Today;
            StatusFilter := StatusFilter::Open;

            //Aply Filter++
            SetRecFilters;
        end;

        //Clear Global Variable++
        Clear(G_IsopenFromCustomerRout);
        Clear(G_SalesPersonCodeFilter);

        // //Pranali08222023_US_13869++
        // Rec.SetCurrentKey(Rec."Planned Date", Rec."Planned Time");
        // Rec.SetAscending(Rec."Planned Time", true);
        // //Pranali08222023_US_13869--
    end;

    procedure SetRecFilters()
    begin
        //Before Apply Filter Save Value++
        CurrPage.SaveRecord;

        if DateFilter <> 0D then
            Rec.SetFilter(Rec."Planned Date", '%1', DateFilter)
        Else
            Rec.SetRange(Rec."Planned Date");

        if CallBookIDFilter <> '' then
            Rec.SetFilter(Rec."Call Book ID", CallBookIDFilter)
        else
            Rec.SetRange(Rec."Call Book ID");

        if SalesPersonCodeFilter <> '' then
            Rec.SetFilter(Rec."Employee Responsible", SalesPersonCodeFilter)
        else
            Rec.SetRange(Rec."Employee Responsible");

        if DelegatedSalesPersonCodeFilter <> '' then
            Rec.SetFilter(Rec."Delegated Sales/Purchaser Code", DelegatedSalesPersonCodeFilter)
        else
            Rec.SetRange(Rec."Delegated Sales/Purchaser Code");

        if CustomerAccountNoFilter <> '' then
            Rec.SetFilter("Customer Account", CustomerAccountNoFilter)
        else
            Rec.SetRange("Customer Account");

        if StatusFilter <> StatusFilter::" " then begin
            //Rec.SetFilter(Status, '%1', StatusFilter)
            if StatusFilter = StatusFilter::Closed then
                Rec.SetRange(Status, Rec.Status::Closed)
            else
                if StatusFilter = StatusFilter::"No Order" then
                    Rec.SetRange(Status, Rec.Status::"No Order")
                else
                    if StatusFilter = StatusFilter::"No Response" then
                        Rec.SetRange(Status, Rec.Status::"No Response")
                    else
                        if StatusFilter = StatusFilter::Open then
                            Rec.SetRange(Status, Rec.Status::Open)

        end else
            Rec.SetRange(Status);

        //Upate page to filter 
        CurrPage.Update(false);
    end;

    procedure IsopenFromCustomerRout(_IsopenFromCustomerRout: Boolean; L_Calllogs: Record "Call Distributions")
    begin
        Clear(G_IsopenFromCustomerRout);
        Clear(G_SalesPersonCodeFilter);
        Clear(G_CustomerAccountNo);
        G_IsopenFromCustomerRout := _IsopenFromCustomerRout;
        G_SalesPersonCodeFilter := L_Calllogs."Employee Responsible";
        G_CustomerAccountNo := L_Calllogs."Customer Account";
    end;
}
