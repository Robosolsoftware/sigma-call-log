permissionset 88000 CallLog
{
    Assignable = true;
    Permissions = tabledata "Call Distributions" = RIMD,
        tabledata "Customer Route Master" = RIMD,
        table "Call Distributions" = X,
        table "Customer Route Master" = X,
        codeunit Functions = X,
        page "Call log Card" = X,
        page "Call log Setup" = X,
        page "Call Log Setup List" = X,
        page "Call logs" = X,
        report "Select Delegated SalesPerson" = X;
}