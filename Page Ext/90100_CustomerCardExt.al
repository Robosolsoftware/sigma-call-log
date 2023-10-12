// pageextension 90100 CustomerCardExt extends "Customer Card"
// {
//     layout
//     {
//         // Add changes to page layout here
//         // addafter("Shipping Agent Service Code")
//         // {
//         //     field("Call Book ID"; Rec."Call Book ID")
//         //     {
//         //         ApplicationArea = All;
//         //     }
//         //     field("Call Date"; Rec."Call Date")
//         //     {
//         //         ApplicationArea = All;
//         //     }
//         //     field("Call Day"; Rec."Call Day")
//         //     {
//         //         ApplicationArea = All;
//         //     }
//         //     field("Call Time"; Rec."Call Time")
//         //     {
//         //         ApplicationArea = All;
//         //     }
//         // }
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter(WordTemplate)
//         {
//             // action("&Create Task")
//             // {
//             //     ApplicationArea = All;
//             //     Caption = 'Create Initial Log';
//             //     Image = NewToDo;
//             //     ToolTip = 'Create a new task for customer.';

//             //     trigger OnAction()
//             //     var
//             //     begin
//             //         Rec.TestField("Primary Contact No.");
//             //         // Rec.TestField("Call Book ID");
//             //         // Rec.TestField("Call Date");
//             //         // Rec.TestField("Call Day");
//             //         // Rec.TestField("Call Time");
//             //         //TempTask.CreateTaskFromTask(Rec);
//             //         CreateCallLogTask(Rec);
//             //     end;
//             // }
//             // action("Call Logs")
//             // {
//             //     ApplicationArea = All;
//             //     Caption = 'Call Logs';
//             //     Image = Calls;
//             //     ToolTip = 'Open call logs for customer.';

//             //     trigger OnAction()
//             //     var
//             //         L_Calllogs: Record "Call Log";
//             //         L_CallLogList: Page "Call Logs";
//             //     begin
//             //         L_Calllogs.Reset();
//             //         L_Calllogs.SetRange("Customer Account", Rec."No.");
//             //         if L_Calllogs.FindSet() then begin
//             //             L_CallLogList.SetTableView(L_Calllogs);
//             //             L_CallLogList.Run();
//             //         end;
//             //     end;
//             // }
//         }
//     }
//     // local procedure CreateCallLogTask(Rec: Record Customer)
//     // var
//     //     L_CallLog: Record "Call Log";
//     //     NoSeriesMgt: Codeunit NoSeriesManagement;
//     //     SalesRecSetup: Record "Sales & Receivables Setup";
//     // begin
//     //     SalesRecSetup.Get();
//     //     L_CallLog.Reset();
//     //     L_CallLog.SetRange("Customer Account", Rec."No.");
//     //     L_CallLog.SetRange("Contact No.", Rec."Primary Contact No.");
//     //     L_CallLog.SetFilter(Status, '%1', L_CallLog.Status::Open);
//     //     if NOT L_CallLog.FindFirst() then begin
//     //         L_CallLog.Init();
//     //         L_CallLog.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
//     //         L_CallLog.Validate("Customer Account", Rec."No.");
//     //         L_CallLog.Validate("Contact No.", Rec."Primary Contact No.");
//     //         L_CallLog.Validate(Status, L_CallLog.Status::Open);
//     //         L_CallLog.Validate("Telephone No.", Rec."Phone No.");
//     //         L_CallLog.Validate("Route Number", Rec."Shipping Agent Code");
//     //         L_CallLog.Validate("Planned Date", Rec."Call Date");
//     //         L_CallLog.Validate("Planned Time", Rec."Call Time");
//     //         L_CallLog.Validate("Call Book ID", Rec."Call Book ID");
//     //         L_CallLog.Validate(Salesperson, Rec."Salesperson Code");
//     //         L_CallLog.Validate("Delivery Date", CalcDate('<+7D>', Rec."Call Date"));
//     //         L_CallLog.Insert(true);
//     //         Message('Call Log Created.');
//     //     end else begin
//     //         L_CallLog.Validate("Customer Account", Rec."No.");
//     //         L_CallLog.Validate("Contact No.", Rec."Primary Contact No.");
//     //         L_CallLog.Validate(Status, L_CallLog.Status::Open);
//     //         L_CallLog.Validate("Telephone No.", Rec."Phone No.");
//     //         L_CallLog.Validate("Route Number", Rec."Shipping Agent Code");
//     //         L_CallLog.Validate("Planned Date", Rec."Call Date");
//     //         L_CallLog.Validate("Planned Time", Rec."Call Time");
//     //         L_CallLog.Validate("Call Book ID", Rec."Call Book ID");
//     //         L_CallLog.Validate(Salesperson, Rec."Salesperson Code");
//     //         L_CallLog.Validate("Delivery Date", CalcDate('<+7D>', Rec."Call Date"));
//     //         L_CallLog.Modify(true);
//     //         Message('Call Log Updated.');
//     //     end;
//     // end;
// }