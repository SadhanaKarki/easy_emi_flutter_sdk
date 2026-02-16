import 'dart:math';
import '../models/emi_input.dart';
import '../models/emi_result.dart';
class EmiCalculator {
  static EmiResult calculate(EmiInput input) {
    final r = input.annualRate / 12 / 100;

    if (r == 0) {
      final emi = input.principal / input.months;
      final totalPayable = input.principal;
      final totalInterest = 0.0;

      return EmiResult(
        emi: emi,
        totalInterest: totalInterest,
        totalPayable: totalPayable,
      );
    }

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
