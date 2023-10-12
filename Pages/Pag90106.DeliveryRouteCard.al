page 90106 "Delivery Route Card"
{
    Caption = 'Delivery Route Card';
    PageType = Card;
    SourceTable = "Delivery Route Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Identification';
                field("Delivery Route"; Rec."Delivery Route")
                {
                    ToolTip = 'Specifies the value of the Delivery Route field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Temporary"; Rec."Temporary")
                {
                    ToolTip = 'Specifies the value of the Temporary field.';
                    ApplicationArea = All;
                }
            }
            group("Pick and Pack")
            {
                field("Delivery Day"; Rec."Delivery Day")
                {
                    ToolTip = 'Specifies the value of the Delivery Day field.';
                    ApplicationArea = All;
                }
                field("Picking Day"; Rec."Picking Day")
                {
                    ToolTip = 'Specifies the value of the Picking Day field.';
                    ApplicationArea = All;
                }
            }
            group(Storage)
            {
                field(Site; Rec.Site)
                {
                    ToolTip = 'Specifies the value of the Site field.';
                    ApplicationArea = All;
                }
                field(Warehouse; Rec.Warehouse)
                {
                    ToolTip = 'Specifies the value of the Warehouse field.';
                    ApplicationArea = All;

                }
            }
            group("Vehicle Details")
            {
                field(Vehicle; Rec.Vehicle)
                {
                    ToolTip = 'Specifies the value of the Vehicle field.';
                    ApplicationArea = All;
                }
                field(Driver; Rec.Driver)
                {
                    ToolTip = 'Specifies the value of the Driver field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
