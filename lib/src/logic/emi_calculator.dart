import 'dart:math';
import '../models/emi_input.dart';
import '../models/emi_result.dart';

class EmiCalculator {
  static EmiResult calculate(EmiInput input) {
    final r = input.annualRate / 12 / 100;

    final emi = (input.principal * r * pow(1 + r, input.months)) /
        (pow(1 + r, input.months) - 1);

    final totalPayable = emi * input.months;
    final totalInterest = totalPayable - input.principal;

    return EmiResult(
      emi: emi,
      totalInterest: totalInterest,
      totalPayable: totalPayable,
    );
  }
}
