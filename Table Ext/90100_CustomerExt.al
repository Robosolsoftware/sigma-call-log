// tableextension 90100 CustomerExt extends Customer
// {
//     fields
//     {
//         // Add changes to table fields here

//         // field(50122; "Call Book ID"; Code[100])
//         // {
//         //     DataClassification = ToBeClassified;
//         // }
//         // field(50123; "Call Date"; Date)
//         // {
//         //     DataClassification = ToBeClassified;
//         //     trigger OnValidate()
//         //     var
//         //         DateForweek: Record Date;
//         //     begin
//         //         if Rec."Call Date" <> 0D then begin
//         //             if DateForweek.Get(DateForweek."Period Type"::Date, "Call Date") then begin
//         //                 Rec."Call Day" := DateForweek."Period Name";
//         //             end;
//         //         end else
//         //             Rec."Call Day" := '';
//         //     end;
//         // }
//         // field(50124; "Call Day"; Text[20])
//         // {
//         //     DataClassification = ToBeClassified;
//         //     // OptionMembers = " ","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday";
//         //     // OptionCaption = ' ,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
//         // }
//         // field(50126; "Call Time"; Time)
//         // {
//         //     DataClassification = ToBeClassified;

//         // }
//     }

//     var
//         myInt: Integer;
// }