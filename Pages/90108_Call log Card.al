page 90108 "Call log Card"
{
    Caption = 'Call Log Card';
    PageType = Card;
    SourceTable = "Call Distributions";
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    ToolTip = 'Specifies the value of the Employee Responsible field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'SalesPerson/Purchaser Code';
                }
                field("Customer Account"; Rec."Customer Account")
                {
                    ToolTip = 'Specifies the value of the Customer Account field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Sell-to Customer No.';

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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer name field.';
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
                    ToolTip = 'Specifies the value of the Secondary Contact field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ToolTip = 'Specifies the value of the Planned Date field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Call log Date';
                }
                field("Planned Time"; Rec."Planned Time")
                {
                    ToolTip = 'Specifies the value of the Planned Time field.';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Call log Time';
                }
                field("Route Number"; Rec."Route Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Code';

                }
                field("Route Sequence"; Rec."Route Sequence")//Pranali07122023_US_13116
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Shipping Agent Service Code';
                }
                field("Weekend Ship. Agnt. Serv. Code"; Rec."Weekend Ship. Agnt. Serv. Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Weekend Shipping Agent Service Code';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    ApplicationArea = All;
                    //Editable = G_Edit;
                    Editable = false;
                    Caption = 'Shipment Date';
                }
                field("Delivery Day"; Rec."Delivery Day")
                {
                    ToolTip = 'Specifies the value of the Delivery Day field.';
                    ApplicationArea = All;
                    //Editable = G_Edit;
                    Editable = false;
                    Caption = 'Shipment Day';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action("Customer Trends")
            {
                ApplicationArea = All;
                Caption = 'Customer Trends';
                Image = ViewDetails;
                ToolTip = 'Open Customer Trends for customer.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    L_CustomerTrendTable: Record CustomerTrends;
                    L_CustomerTrendsPage: Page "Customer Trends";
                    CTFunctions: Codeunit "CT Functions";
                    SalesH: Record "Sales Header";
                    ChTrends: Record CustomerTrends;
                begin
                    if not Confirm('Do you want to open Customer Trends?', true) then
                        Error('');

                    CurrPage.Update();
                    CTFunctions.CreateCustomertrends(Rec."Customer Account", Rec."Employee Responsible", Rec."Delivery Date", Rec."Route Number", Rec."Route Sequence", Rec."Weekend Ship. Agnt. Serv. Code", '');
                end;

            }

        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        G_Edit := Rec.Status = Rec.Status::Open;
    end;

    var
        //[InDataSet]
        G_Edit: Boolean;
        tes: Page "Customer Card";
}
