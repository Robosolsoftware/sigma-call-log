page 90107 "Call Distributions"
{
    ApplicationArea = All;
    Caption = 'Call Distributions';
    PageType = List;
    SourceTable = "Call Distributions";
    UsageCategory = Administration;
    Editable = true;
    CardPageId = "Call Distribution Card";
    RefreshOnActivate = true;
    DataCaptionExpression = PageCaption;
    //InsertAllowed = false;
    //ModifyAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(DateFilter; DateFilter)
                {
                    Caption = 'Date';
                    trigger OnValidate()
                    begin
                        DateFilterOnAfterValidate();
                    end;
                }
                field(CallBookIDFilter; CallBookIDFilter)
                {
                    Caption = 'Call Book ID';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CallBookList: Page "Call Book Setup List";
                    begin
                        CallBookList.LookupMode := true;
                        if CallBookList.RunModal() = Action::LookupOK then
                            Text := CallBookList.GetSelectionFilter()
                        else
                            exit(false);

                        exit(true);
                    end;

                    trigger OnValidate()
                    begin
                        CallBookIDFilterOnAfterValidate;
                    end;
                }
                field(SalesPersonCodeFilter; SalesPersonCodeFilter)
                {
                    Caption = 'SalesPerson/Purchaser Code';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        SalesPurchaserList: Page "Salespersons/Purchasers";
                    begin
                        SalesPurchaserList.LookupMode := true;
                        if SalesPurchaserList.RunModal() = Action::LookupOK then
                            Text := SalesPurchaserList.GetSelectionFilter()
                        else
                            exit(false);

                        exit(true);
                    end;

                    trigger OnValidate()
                    begin
                        SalesPersonCodeFilterOnAfterValidate;
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
                }
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer name"; Rec."Customer name")//Pranali05222023_US_12667
                {
                    ToolTip = 'Specifies the value of the Customer name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")//Pranali05222023_US_12667
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Telephone; Rec.Telephone)
                {
                    ToolTip = 'Specifies the value of the Telephone field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Route Number"; Rec."Route Number")
                {
                    ToolTip = 'Specifies the value of the Route Number field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Route Sequence"; Rec."Route Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Route Sequence field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Delivery Day"; Rec."Delivery Day")
                {
                    ToolTip = 'Specifies the value of the Delivery Day field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    ApplicationArea = All;
                    Editable = false;
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
                field(Round; Rec.Round)//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Round field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Location; Rec.Location)//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Location field.';
                    ApplicationArea = All;
                    Editable = false;
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
        area(navigation)
        {
            group("&Customer")
            {
                //Pranali05222023_US_12669++
                // action("Customer Trends")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Customer Trends';
                //     Image = ViewDetails;
                //     ToolTip = 'Open Customer Trends for customer.';
                //     trigger OnAction()
                //     var
                //         L_CustomerTrendTable: Record CustomerTrends;
                //         L_CustomerTrendsPage: Page "Customer Trends";
                //         L_EventSub: Codeunit EventSub;
                //         SalesH: Record "Sales Header";
                //         ChTrends: Record CustomerTrends;
                //     begin
                //         ChTrends.DeleteAll();
                //         L_EventSub.CreateCustomertrends(SalesH, Rec."Customer Account");
                //     end;

                // }
                //Pranali05222023_US_12669--

                //Pranali08242023_US_13869++
                action(CreateSalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Order';
                    ToolTip = 'Create a sales order for the customer';
                    Image = Document;
                    trigger OnAction()
                    begin
                        if Rec.Status = Rec.Status::Open then begin
                            CreateNewSalesOrder();
                        end
                        else
                            Message('Call Status is closed');
                    end;
                }
                //Pranali08242023_US_13869--
            }
        }
    }
    var
        DateFilter: Date;
        CallBookIDFilter: Text;
        SalesPersonCodeFilter: Text;
        PageCaption: Text;
        G_SalesPerson: Record "Salesperson/Purchaser";

    //Pranali08242023_US_13869++
    local procedure CreateNewSalesOrder()
    var
        L_SalesHeader: Record "Sales Header";
        L_SalesHeader1: Record "Sales Header";
        SalesRecSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        L_Customer: Record Customer;
        L_Salesorder: page "Sales Order";
    begin
        SalesRecSetup.Get();
        L_SalesHeader.Reset();
        L_SalesHeader.Init();
        L_SalesHeader.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Order Nos.", WORKDATE, TRUE));
        L_SalesHeader.Validate("Document Type", L_SalesHeader."Document Type"::Order);
        L_SalesHeader.Validate("Sell-to Customer No.", Rec."Customer Account");
        L_SalesHeader.Validate("Shipping Agent Code", Rec."Route Number");
        L_SalesHeader.Insert(true);
        L_SalesHeader1.Reset();
        L_SalesHeader1.SetRange(L_SalesHeader1."No.", L_SalesHeader."No.");
        L_Salesorder.SetTableView(L_SalesHeader1);
        L_Salesorder.Run();
    end;
    //Pranali08242023_US_13869--

    local procedure DateFilterOnAfterValidate()
    var
        myInt: Integer;
    begin
        CurrPage.SaveRecord;
        SetRecFilters;
        SetCaption();
    end;

    local procedure CallBookIDFilterOnAfterValidate()
    var
        myInt: Integer;
    begin
        CurrPage.SaveRecord;
        SetRecFilters;
        SetCaption();
    end;



    local procedure SalesPersonCodeFilterOnAfterValidate()
    var
        myInt: Integer;
    begin
        CurrPage.SaveRecord;
        SetRecFilters;
        SetCaption();
    end;

    procedure SetRecFilters()
    begin
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
        CurrPage.Update(false);
    end;

    local procedure SetCaption()
    begin
        PageCaption := GetFilterDescription();
    end;

    local procedure GetFilterDescription(): Text
    var
        ObjTranslation: Record "Object Translation";
        SourceTableName: Text;
        SalesSrcTableName: Text;
        Description: Text;
    begin
        GetRecFilters;

        if DateFilter <> 0D then begin
            SourceTableName := 'Date Filter';
            SalesSrcTableName := '';
            Description := '';
        end;
        if CallBookIDFilter <> '' then begin
            // SourceTableName := ObjTranslation.TranslateObject(ObjTranslation."Object Type"::Table, 90100);
            SourceTableName := 'Call Book ID';
            SalesSrcTableName := '';
            Description := '';
        end;
        if SalesPersonCodeFilter <> '' then begin
            SalesSrcTableName := ObjTranslation.TranslateObject(ObjTranslation."Object Type"::Table, 13);
            G_SalesPerson.Code := CopyStr(SalesPersonCodeFilter, 1, MaxStrLen(G_SalesPerson.Code));
            if G_SalesPerson.FindFirst() then
                Description := G_SalesPerson.Name;
        end;
        exit(StrSubstNo('%1 %2 %3 %4 %5 %6 %7', 'Call Distributions', SourceTableName, CallBookIDFilter, SalesSrcTableName, SalesPersonCodeFilter, DateFilter, Description));
    end;

    local procedure GetRecFilters()
    begin
        if Rec.GetFilters <> '' then
            UpdateBasicRecFilters;
    end;

    local procedure UpdateBasicRecFilters()
    begin
        CallBookIDFilter := Rec.GetFilter("Call Book ID");
        SalesPersonCodeFilter := Rec.GetFilter("Employee Responsible");
    end;

    trigger OnOpenPage()
    begin
        //Pranali08222023_US_13869++
        Rec.SetCurrentKey(Rec."Planned Date", Rec."Planned Time");
        Rec.SetAscending(Rec."Planned Time", true);
        //Pranali08222023_US_13869--
    end;
}
