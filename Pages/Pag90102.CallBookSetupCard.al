page 90102 "Call Book Setup Card"
{
    Caption = 'Call Book Setup Card';
    PageType = Card;
    SourceTable = "Call Book Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Call Book ID"; Rec."Call Book ID")
                {
                    ToolTip = 'Specifies the value of the Call Book ID field.';
                    ApplicationArea = All;
                }
                field("Call Day"; Rec."Call Day")
                {
                    ToolTip = 'Specifies the value of the Call Day field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    ToolTip = 'Specifies the value of the Employee Responsible field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
