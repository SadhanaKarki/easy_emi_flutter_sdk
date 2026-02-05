import 'package:flutter_test/flutter_test.dart';

import 'package:easy_emi_flutter_sdk/easy_emi_flutter_sdk.dart';

void main() {
 test('EMI calculation returns expected values', () {
  final input = EmiInput(
    principal: 100000,
    annualRate: 10,
    months: 12,
  );

  final result = EmiCalculator.calculate(input);

  expect(result.emi, closeTo(8791.59, 0.1));
});

}
