// table 90100 "Call Log"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; Code[40])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2; Status; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Open","Closed";
//             OptionCaption = ' ,Open,Closed';
//             trigger OnValidate()
//             var
//                 SalesRecSetup: Record "Sales & Receivables Setup";
//                 L_CallLog: Record "Call Log";
//                 NoSeriesMgt: Codeunit NoSeriesManagement;
//             begin
//                 if CurrFieldNo <> 0 then begin
//                     if Rec.Status = Rec.Status::Closed then begin
//                         SalesRecSetup.Get();
//                         L_CallLog.Init();
//                         L_CallLog.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
//                         L_CallLog.Validate("Customer Account", Rec."Customer Account");
//                         L_CallLog.Validate("Contact No.", Rec."Contact No.");
//                         //L_CallLog.Validate(Status, L_CallLog.Status::Open);
//                         L_CallLog.Status := L_CallLog.Status::Open;
//                         L_CallLog.Validate("Telephone No.", Rec."Telephone No.");
//                         L_CallLog.Validate("Route Number", Rec."Route Number");
//                         L_CallLog.Validate("Planned Date", CalcDate('<+7D>', Rec."Planned Date"));
//                         L_CallLog.Validate("Planned Time", Rec."Planned Time");
//                         L_CallLog.Validate("Call Book ID", Rec."Call Book ID");
//                         L_CallLog.Validate(Salesperson, Rec.Salesperson);
//                         L_CallLog.Validate("Delivery Date", CalcDate('<+7D>', L_CallLog."Planned Date"));
//                         L_CallLog.Insert(true);
//                         Message('Call Log Created for next week.');
//                     end;
//                 end;
//             end;
//         }
//         field(3; "Customer Account"; Code[100])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Customer."No.";
//             trigger OnValidate()
//             var
//                 L_Customer: Record Customer;
//             begin
//                 L_Customer.Reset();
//                 IF L_Customer.Get(Rec."Customer Account") then begin
//                     Rec.Validate("Customer Account Name", L_Customer.Name);
//                 end;
//             end;
//         }
//         field(4; "Customer Account Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Contact No."; Code[100])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Contact."No.";
//             trigger OnValidate()
//             var
//                 L_Contact: Record Contact;
//             begin
//                 L_Contact.Reset();
//                 if L_Contact.Get(Rec."Contact No.") then begin
//                     Rec.Validate("Contact Name", L_Contact.Name);
//                 end;
//             end;
//         }
//         field(6; "Contact Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; "Telephone No."; Code[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; "Route Number"; Code[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9; "Delivery Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             var
//                 DateForweek: Record Date;
//             begin
//                 if Rec."Delivery Date" <> 0D then begin
//                     if DateForweek.Get(DateForweek."Period Type"::Date, "Delivery Date") then begin
//                         Rec."Delivery Day" := DateForweek."Period Name";
//                     end;
//                 end else
//                     Rec."Delivery Day" := '';
//             end;
//         }
//         field(10; "Delivery Day"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(11; "Planned Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Call Date';
//             trigger OnValidate()
//             begin
//                 Rec.Validate("Delivery Date", CalcDate('<+7D>', Rec."Planned Date"));
//             end;
//         }
//         field(12; "Planned Time"; Time)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Call Time';
//         }
//         field(13; "Call Book ID"; Code[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(14; Salesperson; Code[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "Closing Reason"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "","Answered","Call Back","No Order","Call Taken";
//             OptionCaption = ' ,Answered,Call Back,No Order,Call Taken';
//         }
//     }

//     keys
//     {
//         key(PK; "No.")
//         {
//             Clustered = true;
//         }
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

//     procedure CreateAndShowNewCallLog()
//     var
//         L_CallLog: Record "Call Log";
//         L_CustomerAccount: Code[100];
//         L_Customer: Record Customer;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         SalesRecSetup: Record "Sales & Receivables Setup";
//     begin
//         SalesRecSetup.Get;
//         Clear(L_CustomerAccount);
//         L_CustomerAccount := Rec.GetFilter("Customer Account");
//         L_Customer.Reset();
//         If L_Customer.Get(L_CustomerAccount) then begin
//             L_CallLog.Init();
//             L_CallLog.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
//             L_CallLog.Validate("Call Book ID", L_CallLog."No.");
//             L_CallLog.Validate("Customer Account", L_CustomerAccount);
//             L_CallLog.Validate("Contact No.", L_Customer."Primary Contact No.");
//             L_CallLog.Validate(Status, L_CallLog.Status::Open);
//             L_CallLog.Validate("Telephone No.", L_Customer."Phone No.");
//             L_CallLog.Validate("Route Number", L_Customer."Shipping Agent Code");
//             L_CallLog.Validate(Salesperson, L_Customer."Salesperson Code");
//             L_CallLog.Insert(true);
//             PAGE.Run(PAGE::"Call Log Card", L_CallLog)
//         end;
//     end;

// }