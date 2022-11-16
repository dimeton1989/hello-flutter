import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/hello_flutter.dart';

// https://docs.flutter.dev/cookbook/testing/unit/introduction
// https://stackoverflow.com/questions/13298969/how-do-you-unittest-exceptions-in-dart
// https://api.flutter.dev/flutter/package-matcher_matcher/isInstanceOf-class.html
// https://dhruvnakum.xyz/testing-in-flutter-unit-test
// https://github.com/flutter/flutter/issues/57600

void main() {
  group('Name', () {
    test('未填寫姓名時應該要拋出例外', () {
      expect(() => Name.fromString(''),
          throwsA(const TypeMatcher<NameRequired>()));
    });

    test('錯誤填寫姓名時應該要拋出例外', () {
      expect(() => Name.fromString('invalid name'),
          throwsA(const TypeMatcher<NameInvalid>()));
    });

    test('正確填寫姓名時應該要順利產生 Name 物件', () {
      expect(Name.fromString('小菜'), isA<Name>());
    });
  });
}
