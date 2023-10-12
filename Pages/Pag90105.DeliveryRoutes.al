page 90105 "Delivery Routes"
{
    ApplicationArea = All;
    Caption = 'Delivery Routes';
    PageType = List;
    SourceTable = "Delivery Route Master";
    UsageCategory = Administration;
    CardPageId = "Delivery Route Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
            }
        }
    }
}
