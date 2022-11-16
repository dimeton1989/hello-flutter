import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/hello_flutter.dart';

void main() {
  group('Gender', () {
    test('正確填寫性別時應該要順利產生 Gender 物件', () {
      expect(Gender.fromString('male'), equals(Gender.male));
    });

    test('錯誤填寫性別時應該要拋出例外', () {
      expect(() => Gender.fromString('unknown'),
          throwsA(const TypeMatcher<GenderInvalid>()));
    });
  });
}
