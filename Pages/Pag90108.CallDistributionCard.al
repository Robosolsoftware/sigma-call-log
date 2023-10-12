page 90108 "Call Distribution Card"
{
    Caption = 'Call Distribution Card';
    PageType = Card;
    SourceTable = "Call Distributions";
    Editable = true;

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
                    Editable = G_Edit;
                }
                field("Customer name"; Rec."Customer name")//Pranali05222023_US_12667
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer name field.';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field("Post Code"; Rec."Post Code")//Pranali05222023_US_12667
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field("Delivery Day"; Rec."Delivery Day")
                {
                    ToolTip = 'Specifies the value of the Delivery Day field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ToolTip = 'Specifies the value of the Planned Date field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field("Planned Time"; Rec."Planned Time")
                {
                    ToolTip = 'Specifies the value of the Planned Time field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field(Round; Rec.Round)//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Round field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
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
                field("Route Number"; Rec."Route Number")
                {
                    ToolTip = 'Specifies the value of the Route Number field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field("Route Sequence"; Rec."Route Sequence")//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Route Sequence field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field(Telephone; Rec.Telephone)
                {
                    ToolTip = 'Specifies the value of the Telephone field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
                field(Location; Rec.Location)//Pranali07122023_US_13116
                {
                    ToolTip = 'Specifies the value of the Location field.';
                    ApplicationArea = All;
                    Editable = G_Edit;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
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
}
