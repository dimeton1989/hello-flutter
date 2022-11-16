import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/hello_flutter.dart';

void main() {
  group('PhoneNumber', () {
    test('未填寫電話時應該要拋出例外', () {
      expect(() => PhoneNumber.fromString(''),
          throwsA(const TypeMatcher<PhoneNumberRequired>()));
    });

    test('錯誤填寫電話時應該要拋出例外', () {
      expect(() => PhoneNumber.fromString('abc'),
          throwsA(const TypeMatcher<PhoneNumberInvalid>()));
    });

    test('正確填寫電話時應該要順利產生 PhoneNumber 物件', () {
      expect(PhoneNumber.fromString('0912345678'), isA<PhoneNumber>());
    });
  });
}
