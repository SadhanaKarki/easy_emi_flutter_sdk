import 'package:flutter_test/flutter_test.dart';

import 'package:easy_emi_flutter_sdk/easy_emi_flutter_sdk.dart';

void main() {
 test('EMI calculation returns expected values', () {
  final input = EmiInput(
    principal: 100000,
    annualRate: 10,
    months: 12,
  );

  final schedule = generateEmiSchedule(input);

  final totalPrincipalPaid = schedule
      .map((e) => e.principalComponent)
      .reduce((a, b) => a + b);

  expect(totalPrincipalPaid, closeTo(input.principal, 1));
});

}
