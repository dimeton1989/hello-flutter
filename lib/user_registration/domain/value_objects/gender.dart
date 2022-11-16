import 'package:bloc_and_riverpod/user_registration/domain/exceptions/gender_invalid.dart';

// https://stackoverflow.com/questions/29567236/dart-how-to-get-the-name-of-an-enum-as-a-string
// https://stackoverflow.com/questions/27673781/enum-from-string#answer-70311579
// https://stackoverflow.com/questions/72434928/how-to-write-an-enum-factory-in-dart
// https://stackoverflow.com/questions/38908285/how-do-i-add-methods-or-values-to-enums-in-dart#answer-71412047
// https://stackoverflow.com/questions/27673781/enum-from-string#answer-70311579
enum Gender {
  male,
  female;

  @override
  String toString() {
    switch (this) {
      case Gender.male:
        return '男生';
      case Gender.female:
        return '女生';
    }
  }

  factory Gender.fromString(String value) {
    try {
      return values.byName(value);
    } on ArgumentError {
      throw const GenderInvalid();
    }
  }
}
