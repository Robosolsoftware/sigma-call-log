codeunit 88000 Functions
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure CheckDulicateTimeSlot(_Day: Text; TimeSlot: Integer; _Rec: Record "Customer Route Master")
    begin
        case _Day of
            'Monday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Monday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Monday Time Slot1" = _Rec."Monday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot1");

                                if _Rec."Monday Time Slot1" = _Rec."Monday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Monday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Monday Time Slot2" = _Rec."Monday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot2");

                                if _Rec."Monday Time Slot2" = _Rec."Monday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Monday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Monday Time Slot3" = _Rec."Monday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot3");

                                if _Rec."Monday Time Slot3" = _Rec."Monday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Monday Time Slot3");
                            end;
                    end;
                end;
            'Tuesday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Tuesday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Tuesday Time Slot1" = _Rec."Tuesday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot1");

                                if _Rec."Tuesday Time Slot1" = _Rec."Tuesday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Tuesday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Tuesday Time Slot2" = _Rec."Tuesday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot2");

                                if _Rec."Tuesday Time Slot2" = _Rec."Tuesday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Tuesday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Tuesday Time Slot3" = _Rec."Tuesday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot3");

                                if _Rec."Tuesday Time Slot3" = _Rec."Tuesday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Tuesday Time Slot3");
                            end;
                    end;

                end;
            'Wednesday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Wednesday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Wednesday Time Slot1" = _Rec."Wednesday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot1");

                                if _Rec."Wednesday Time Slot1" = _Rec."Wednesday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Wednesday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Wednesday Time Slot2" = _Rec."Wednesday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot2");

                                if _Rec."Wednesday Time Slot2" = _Rec."Wednesday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Wednesday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Wednesday Time Slot3" = _Rec."Wednesday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot3");

                                if _Rec."Wednesday Time Slot3" = _Rec."Wednesday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Wednesday Time Slot3");
                            end;
                    end;
                end;
            'Thursday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Thursday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Thursday Time Slot1" = _Rec."Thursday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot1");

                                if _Rec."Thursday Time Slot1" = _Rec."Thursday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Thursday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Thursday Time Slot2" = _Rec."Thursday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot2");

                                if _Rec."Thursday Time Slot2" = _Rec."Thursday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Thursday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Thursday Time Slot3" = _Rec."Thursday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot3");

                                if _Rec."Thursday Time Slot3" = _Rec."Thursday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Thursday Time Slot3");
                            end;
                    end;

                end;
            'Friday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Friday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Friday Time Slot1" = _Rec."Friday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot1");

                                if _Rec."Friday Time Slot1" = _Rec."Friday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Friday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Friday Time Slot2" = _Rec."Friday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot2");

                                if _Rec."Friday Time Slot2" = _Rec."Friday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Friday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Friday Time Slot3" = _Rec."Friday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot3");

                                if _Rec."Friday Time Slot3" = _Rec."Friday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Friday Time Slot3");
                            end;
                    end;

                end;
            'Saturday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Saturday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Saturday Time Slot1" = _Rec."Saturday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot1");

                                if _Rec."Saturday Time Slot1" = _Rec."Saturday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Saturday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Saturday Time Slot2" = _Rec."Saturday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot2");

                                if _Rec."Saturday Time Slot2" = _Rec."Saturday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Saturday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Saturday Time Slot3" = _Rec."Saturday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot3");

                                if _Rec."Saturday Time Slot3" = _Rec."Saturday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Saturday Time Slot3");
                            end;
                    end;
                end;
            'Sunday':
                begin
                    case TimeSlot of
                        1:
                            begin
                                if _Rec."Sunday Time Slot1" = 0T then
                                    exit;

                                if _Rec."Sunday Time Slot1" = _Rec."Sunday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot1");

                                if _Rec."Sunday Time Slot1" = _Rec."Sunday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot1");
                            end;
                        2:
                            begin
                                if _Rec."Sunday Time Slot2" = 0T then
                                    exit;

                                if _Rec."Sunday Time Slot2" = _Rec."Sunday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot2");

                                if _Rec."Sunday Time Slot2" = _Rec."Sunday Time Slot3" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot2");
                            end;
                        3:
                            begin
                                if _Rec."Sunday Time Slot3" = 0T then
                                    exit;

                                if _Rec."Sunday Time Slot3" = _Rec."Sunday Time Slot1" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot3");

                                if _Rec."Sunday Time Slot3" = _Rec."Sunday Time Slot2" then
                                    Error('Time %1 already exist', _Rec."Sunday Time Slot3");
                            end;
                    end;
                end;
        end;

    end;

    // procedure CreateCallDistribution(Rec: Record "Customer Route Master")
    // var
    //     L_CallDistribution: Record "Call Distributions";
    //     L_CallDistribution1: Record "Call Distributions";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     SalesRecSetup: Record "Sales & Receivables Setup";
    //     L_Customer: Record Customer;
    //     L_CallBookSetup: Record "Call Book Setup";
    //     L_CallBookSetup1: Record "Call Book Setup";
    //     Day: Text;
    //     SystemTime: Time;
    //     NewDate: Date;
    //     DayTime: DateTime;
    //     L_Date: Record Date;
    //     L_Contact: Record Contact;
    //     tes: Page "Sales Order";
    // begin
    //     Clear(SystemTime);
    //     Clear(Day);
    //     Clear(NewDate);
    //     Clear(DayTime);
    //     L_CallBookSetup.Reset();
    //     L_CallBookSetup.SetRange("Call Book ID", Rec."Call Book ID");
    //     if L_CallBookSetup.FindFirst() then;

    //     L_Customer.Get(Rec."Customer Account");
    //     SalesRecSetup.Get();
    //     L_CallDistribution.Reset();
    //     L_CallDistribution.SetRange("Customer Account", Rec."Customer Account");
    //     L_CallDistribution.SetRange(Contact, Rec."Contact ID");
    //     L_CallDistribution.SetRange("Call Book ID", Rec."Call Book ID");
    //     L_CallDistribution.SetFilter(Status, '%1', L_CallDistribution.Status::Open);
    //     if L_CallDistribution.FindFirst() then begin
    //         L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
    //         L_CallDistribution.Validate(Contact, Rec."Contact ID");
    //         L_CallDistribution.Validate("Secondary Contact", Rec."Secondary Contact ID");
    //         L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
    //         L_Contact.Reset();
    //         if L_Contact.Get(Rec."Contact ID") then
    //             L_CallDistribution.Validate(Telephone, L_Contact."Phone No.");
    //         L_Contact.Reset();
    //         if L_Contact.Get(Rec."Secondary Contact ID") then
    //             L_CallDistribution.Validate("Secondary Telephone", L_Contact."Phone No.");
    //         L_CallDistribution.Validate("Customer name", L_Customer.Name);
    //         L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
    //         L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
    //         //Pranali08242023_US_13869++
    //         L_CallBookSetup1.Reset();
    //         L_CallBookSetup1.SetRange(L_CallBookSetup1."Call Book ID", L_CallDistribution."Call Book ID");
    //         if L_CallBookSetup1.FindFirst() then begin
    //             Day := format(L_CallBookSetup1."Call Day");
    //             L_Date.Reset();
    //             L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
    //             L_Date.SetFilter(L_Date."Period Start", '%1..%2', Today, CalcDate('+7D', Today));
    //             if L_Date.FindSet() then begin
    //                 repeat
    //                     if (L_Date."Period Name" = Day) and (L_Date."Period Start" = Today) then begin
    //                         NewDate := CalcDate('+7D', L_Date."Period Start");
    //                     end
    //                     else
    //                         if (L_Date."Period Name" = Day) and (L_Date."Period Start" <> Today) then begin
    //                             NewDate := L_Date."Period Start";
    //                         end;
    //                 until L_Date.Next() = 0;
    //             end;
    //             L_CallDistribution.Validate("Planned Date", NewDate);
    //             // if Day = 'Friday' then begin
    //             //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Pranali08222023_US_13869
    //             // end
    //             // else
    //             L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
    //         end;

    //         //Pranali08242023_US_13869--
    //         L_CallDistribution.Validate("Planned Time", Rec."Call Time");
    //         L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
    //         L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
    //         L_CallDistribution.Modify(true);
    //         Message('Call Log Updated.');
    //     end else begin
    //         L_CallDistribution.Init();
    //         L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
    //         L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
    //         L_CallDistribution.Validate(Contact, Rec."Contact ID");
    //         L_CallDistribution.Validate("Secondary Contact", Rec."Secondary Contact ID");
    //         L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
    //         L_Contact.Reset();
    //         if L_Contact.Get(Rec."Contact ID") then
    //             L_CallDistribution.Validate(Telephone, L_Contact."Phone No.");
    //         L_Contact.Reset();
    //         if L_Contact.Get(Rec."Secondary Contact ID") then
    //             L_CallDistribution.Validate("Secondary Telephone", L_Contact."Phone No.");
    //         L_CallDistribution.Validate("Customer name", L_Customer.Name);
    //         L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
    //         L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
    //         //Pranali08242023_US_13869++
    //         L_CallBookSetup1.Reset();
    //         L_CallBookSetup1.SetRange(L_CallBookSetup1."Call Book ID", L_CallDistribution."Call Book ID");
    //         if L_CallBookSetup1.FindFirst() then begin
    //             Day := format(L_CallBookSetup1."Call Day");
    //             L_Date.Reset();
    //             L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
    //             L_Date.SetFilter(L_Date."Period Start", '%1..%2', Today, CalcDate('+7D', Today));
    //             if L_Date.FindSet() then begin
    //                 repeat
    //                     if (L_Date."Period Name" = Day) and (L_Date."Period Start" = Today) then begin
    //                         NewDate := CalcDate('+7D', L_Date."Period Start");
    //                     end
    //                     else
    //                         if (L_Date."Period Name" = Day) and (L_Date."Period Start" <> Today) then begin
    //                             NewDate := L_Date."Period Start";
    //                         end;
    //                 until L_Date.Next() = 0;
    //             end;
    //             L_CallDistribution.Validate("Planned Date", NewDate);
    //             // if Day = 'Friday' then begin
    //             //     L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Pranali08222023_US_13869
    //             // end
    //             // else
    //             L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
    //         end;
    //         //Pranali08242023_US_13869--
    //         L_CallDistribution.Validate("Planned Time", Rec."Call Time");
    //         L_CallDistribution.Validate("Employee Responsible", L_CallBookSetup."Employee Responsible");
    //         // L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));//Pranali08222023_US_13869
    //         L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
    //         L_CallDistribution.Insert(true);
    //         Message('Call Log Created.');
    //     end;
    // end;

    procedure SetDistribution(Rec: Record "Customer Route Master")
    var
        L_Date: Record Date;
        i: Integer;
    begin
        L_Date.Reset();
        L_Date.SetRange(L_Date."Period Type", L_Date."Period Type"::Date);
        L_Date.SetFilter(L_Date."Period Start", '%1..%2', Today, CalcDate('+6D', Today));
        if L_Date.FindSet() then begin
            repeat
                case L_Date."Period Name" of
                    'Monday':
                        begin
                            if Rec.Monday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Monday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Monday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Monday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Monday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Monday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Monday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;

                                            end;
                                    end;
                                end;
                            end;
                        end;
                    'Tuesday':
                        begin
                            if Rec.Tuesday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Tuesday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Tuesday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Tuesday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Tuesday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Tuesday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Tuesday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;

                                            end;
                                    end;
                                end;
                            end;

                        end;
                    'Wednesday':
                        begin
                            if Rec.Wednesday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Wednesday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Wednesday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Wednesday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Wednesday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Wednesday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Wednesday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                    end;
                                end;
                            end;

                        end;
                    'Thursday':
                        begin
                            if Rec.Thursday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Thursday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Thursday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Thursday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Thursday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Thursday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Thursday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;

                                            end;
                                    end;
                                end;
                            end;

                        end;
                    'Friday':
                        begin
                            if Rec.Friday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Friday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Friday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Friday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Friday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Friday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Friday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                    end;
                                end;
                            end;

                        end;
                    'Saturday':
                        begin
                            if Rec.Saturday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Saturday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Saturday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Saturday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Saturday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Saturday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Saturday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                    end;
                                end;
                            end;

                        end;
                    'Sunday':
                        begin
                            if Rec.Sunday = true then begin
                                Clear(i);
                                i := 1;
                                for i := 1 to 3 do begin
                                    case i of
                                        1:
                                            begin
                                                if Rec."Sunday Time Slot1" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Sunday Time Slot1", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        2:
                                            begin
                                                if Rec."Sunday Time Slot2" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Sunday Time Slot2", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;
                                            end;
                                        3:
                                            begin
                                                if Rec."Sunday Time Slot3" <> 0T then begin
                                                    CreateCallDistribution(Rec, L_Date."Period Name", L_Date."Period Start", Rec."Sunday Time Slot3", L_Date."Period Name" + '_Slot_' + Format(i));
                                                end;

                                            end;
                                    end;
                                end;
                            end;

                        end;
                end;
            until L_Date.Next() = 0;
        end;

    end;

    procedure CreateCallDistribution(Rec: Record "Customer Route Master"; _Day: Text[50]; _Date: Date; _CallTime: Time; _DateSlotNo: Code[20])
    var
        L_CallDistribution: Record "Call Distributions";
        L_CallDistribution1: Record "Call Distributions";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesRecSetup: Record "Sales & Receivables Setup";
        L_Customer: Record Customer;
        Day: Text;
        NewDate: Date;
        L_Date: Record Date;
        L_Contact: Record Contact;
        L_ShippingAgentServices: Record "Shipping Agent Services";
        NewDFvar: DateFormula;
        ShippingTime: Text[100];
    begin
        Clear(ShippingTime);
        Clear(NewDFvar);
        Clear(Day);
        Day := _Day;
        Clear(NewDate);
        NewDate := _Date;

        L_Customer.Get(Rec."Customer Account");
        SalesRecSetup.Get();
        L_CallDistribution.Reset();
        L_CallDistribution.SetRange("Customer Account", Rec."Customer Account");
        L_CallDistribution.SetRange("Employee Responsible", Rec."Salesperson Code");
        L_CallDistribution.SetFilter(Status, '%1', L_CallDistribution.Status::Open);
        L_CallDistribution.SetRange("Day Slot No.", _DateSlotNo);
        if L_CallDistribution.FindFirst() then begin
            L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
            L_CallDistribution.Validate(Contact, Rec."Contact ID");
            L_CallDistribution.Validate("Secondary Contact", Rec."Secondary Contact ID");
            L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);
            L_Contact.Reset();
            if L_Contact.Get(Rec."Contact ID") then begin
                L_CallDistribution.Validate(Telephone, L_Contact."Phone No.");
                L_CallDistribution.Validate("Primary Contact Name", L_Contact.Name);
            end;
            L_Contact.Reset();
            if L_Contact.Get(Rec."Secondary Contact ID") then begin
                L_CallDistribution.Validate("Secondary Telephone", L_Contact."Phone No.");
                L_CallDistribution.Validate("Secondary Contact Name", L_Contact.Name);
            end;

            L_CallDistribution.Validate("Customer name", L_Customer.Name);
            L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
            //L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
            L_CallDistribution.Validate("Planned Date", NewDate);

            //Update Delivery date and day based on weekend shipping agent service code++
            //This is new requirement++
            if UpperCase(_Day) = UpperCase('FRIDAY') then begin
                if Rec."Weekend Ship. Agnt. Serv. Code" <> '' then begin
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date")); //Weekend+
                end else begin
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Monday++
                end;
            end else begin
                L_ShippingAgentServices.Reset();
                L_ShippingAgentServices.SetRange("Shipping Agent Code", Rec."Delivery Route");
                L_ShippingAgentServices.SetRange(Code, Rec."Delivery Sequence");
                if L_ShippingAgentServices.FindFirst() then begin
                    if L_ShippingAgentServices."Shipping Time" = NewDFvar then //NewDFvar is blank varible
                        L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"))
                    else begin
                        L_CallDistribution.Validate("Delivery Date", CalcDate(L_ShippingAgentServices."Shipping Time", L_CallDistribution."Planned Date"))
                    end;
                end else
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
            end;

            L_CallDistribution.Validate("Planned Time", _CallTime);
            L_CallDistribution.Validate("Employee Responsible", Rec."Salesperson Code");
            L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
            L_CallDistribution.Validate("Weekend Ship. Agnt. Serv. Code", Rec."Weekend Ship. Agnt. Serv. Code");
            L_CallDistribution.Validate("Day Slot No.", _DateSlotNo);
            L_CallDistribution.Validate("Call Day", _Day);
            L_CallDistribution.Modify(true);
            //Message('Call Log Updated.');
        end else begin
            L_CallDistribution.Init();
            L_CallDistribution.Validate("No.", NoSeriesMgt.GetNextNo(SalesRecSetup."Task Nos.", WORKDATE, TRUE));
            L_CallDistribution.Validate("Customer Account", Rec."Customer Account");
            L_CallDistribution.Validate(Contact, Rec."Contact ID");
            L_CallDistribution.Validate("Secondary Contact", Rec."Secondary Contact ID");
            L_CallDistribution.Validate(Status, L_CallDistribution.Status::Open);

            L_Contact.Reset();
            if L_Contact.Get(Rec."Contact ID") then begin
                L_CallDistribution.Validate(Telephone, L_Contact."Phone No.");
                L_CallDistribution.Validate("Primary Contact Name", L_Contact.Name);
            end;
            L_Contact.Reset();
            if L_Contact.Get(Rec."Secondary Contact ID") then begin
                L_CallDistribution.Validate("Secondary Telephone", L_Contact."Phone No.");
                L_CallDistribution.Validate("Secondary Contact Name", L_Contact.Name);
            end;

            L_CallDistribution.Validate("Customer name", L_Customer.Name);
            L_CallDistribution.Validate("Route Number", Rec."Delivery Route");
            //L_CallDistribution.Validate("Call Book ID", Rec."Call Book ID");
            L_CallDistribution.Validate("Planned Date", NewDate);
            //Update Delivery date and day based on weekend shipping agent service code++
            //This is new requirement++
            if UpperCase(_Day) = UpperCase('FRIDAY') then begin
                if Rec."Weekend Ship. Agnt. Serv. Code" <> '' then begin
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date")); //Weekend+
                end else begin
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+3D>', L_CallDistribution."Planned Date")); //Monday++
                end;
            end else begin
                L_ShippingAgentServices.Reset();
                L_ShippingAgentServices.SetRange("Shipping Agent Code", Rec."Delivery Route");
                L_ShippingAgentServices.SetRange(Code, Rec."Delivery Sequence");
                if L_ShippingAgentServices.FindFirst() then begin
                    if L_ShippingAgentServices."Shipping Time" = NewDFvar then //NewDFvar is blank varible
                        L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"))
                    else begin
                        L_CallDistribution.Validate("Delivery Date", CalcDate(L_ShippingAgentServices."Shipping Time", L_CallDistribution."Planned Date"))
                    end;
                end else
                    L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));
            end;

            L_CallDistribution.Validate("Planned Time", _CallTime);
            L_CallDistribution.Validate("Employee Responsible", Rec."Salesperson Code");
            // L_CallDistribution.Validate("Delivery Date", CalcDate('<+1D>', L_CallDistribution."Planned Date"));//Pranali08222023_US_13869
            L_CallDistribution.Validate("Route Sequence", Rec."Delivery Sequence");
            L_CallDistribution.Validate("Weekend Ship. Agnt. Serv. Code", Rec."Weekend Ship. Agnt. Serv. Code");
            L_CallDistribution.Validate("Day Slot No.", _DateSlotNo);
            L_CallDistribution.Validate("Call Day", _Day);
            L_CallDistribution.Insert(true);
            //Message('Call Log Created.');
        end;
    end;

}
