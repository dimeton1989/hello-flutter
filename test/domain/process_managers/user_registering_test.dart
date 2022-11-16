import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/hello_flutter.dart';

void main() {
  group('UserRegistering', () {
    test('收到 NameChanged 事件時，若無法順利產生 Name 應該儲存錯誤。否則應清空錯誤。', () async {
      final UserRegistering processManager = UserRegistering({});

      processManager.add(NameChanged(''));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'name': const NameRequired()}));

      processManager.add(NameChanged('abc'));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'name': const NameInvalid()}));

      processManager.add(NameChanged('小菜'));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'name': null}));
    });

    test('收到 GenderChanged 事件時，若無法順利產生 Gender 應該儲存錯誤。否則應清空錯誤。', () async {
      final UserRegistering processManager = UserRegistering({});
      processManager.add(GenderChanged(''));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'gender': const GenderInvalid()}));

      processManager.add(GenderChanged('abc'));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'gender': const GenderInvalid()}));

      processManager.add(GenderChanged('male'));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'gender': null}));
    });

    test('收到 PhoneNumberChanged 事件時，若無法順利產生 PhoneNumber 應該儲存錯誤。否則應清空錯誤。',
        () async {
      final UserRegistering processManager = UserRegistering({});

      processManager.add(PhoneNumberChanged(''));
      await Future.delayed(Duration.zero);
      expect(processManager.state,
          equals({'phone_number': const PhoneNumberRequired()}));

      processManager.add(PhoneNumberChanged('abc'));
      await Future.delayed(Duration.zero);
      expect(processManager.state,
          equals({'phone_number': const PhoneNumberInvalid()}));

      processManager.add(PhoneNumberChanged('0985108940'));
      await Future.delayed(Duration.zero);
      expect(processManager.state, equals({'phone_number': null}));
    });

    test('所有資料皆填妥後，ready 應該要是 true', () async {
      final UserRegistering processManager = UserRegistering({});
      processManager.add(NameChanged('小菜'));
      processManager.add(GenderChanged('male'));
      processManager.add(PhoneNumberChanged('0985108940'));
      await Future.delayed(Duration.zero);
      expect(processManager.ready, true);
    });
  });
}
