

import '../models/emi_input.dart';
import '../logic/emi_calculator.dart';


class EmiScheduleEntry {
  final int month;
  final double principalComponent;
  final double interestComponent;
  final double balance;

  const EmiScheduleEntry({
    required this.month,
    required this.principalComponent,
    required this.interestComponent,
    required this.balance,
  });
}

List<EmiScheduleEntry> generateEmiSchedule(EmiInput input) {
  final result = EmiCalculator.calculate(input);
  final monthlyEmi = result.emi;

  double balance = input.principal;
  final r = input.annualRate / 12 / 100;

  final schedule = <EmiScheduleEntry>[];

  for (int month = 1; month <= input.months; month++) {
    final interest = balance * r;
    final principal = monthlyEmi - interest;
    balance -= principal;

    schedule.add(
      EmiScheduleEntry(
        month: month,
        principalComponent: principal,
        interestComponent: interest,
        balance: balance <= 0 ? 0 : balance,
      ),
    );
  }

  return schedule;
}

