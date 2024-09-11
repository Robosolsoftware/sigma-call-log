report 88000 "Select Delegated SalesPerson"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Delegated SalesPerson/Purchaser Code';
    ProcessingOnly = true;


    dataset
    {
        dataitem("Call Distributions"; "Call Distributions")
        {

            trigger OnAfterGetRecord()
            begin
                if DelegatedSalesPersonPurchaserCode <> '' then begin
                    "Call Distributions"."Delegated Sales/Purchaser Code" := DelegatedSalesPersonPurchaserCode;
                    "Call Distributions".Modify();
                end;
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(DelegatedSalesPersonPurchaserCode; DelegatedSalesPersonPurchaserCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Select - Delegated Salespeople/Purchasers';
                        TableRelation = "Salesperson/Purchaser".Code;
                        ShowMandatory = true;

                    }
                }
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            if CloseAction = CloseAction::OK then
                if DelegatedSalesPersonPurchaserCode = '' then
                    Error('Delegated Salespeople/Purchasers Should not be blank');

        end;
    }



    trigger OnPostReport()
    begin
        Message('Completed..');
    end;

    var
        myInt: Integer;
        DelegatedSalesPersonPurchaserCode: Code[20];
}