page 90101 "Call Book Setup List"
{
    ApplicationArea = All;
    Caption = 'Call Book Setup List';
    PageType = List;
    SourceTable = "Call Book Setup";
    UsageCategory = Administration;
    Editable = false;
    RefreshOnActivate = true;
    CardPageId = "Call Book Setup Card";

    layout
    {
        area(content)
        {


            repeater(General)
            {
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

            }
        }
    }
    procedure GetSelectionFilter(): Text
    var
        CallBookSetup: Record "Call Book Setup";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(CallBookSetup);
        exit(GetSelectionFilterForCallBookSetup(CallBookSetup));
    end;

    procedure GetSelectionFilterForCallBookSetup(var CallBookSetup: Record "Call Book Setup"): Text
    var
        RecRef: RecordRef;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        RecRef.GetTable(CallBookSetup);
        exit(SelectionFilterManagement.GetSelectionFilter(RecRef, CallBookSetup.FieldNo("Call Book ID")));
    end;
}
