import 'package:hello_flutter/user_registration/domain/exceptions/name_required.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/name_invalid.dart';

// https://stackoverflow.com/questions/49757486/how-to-use-regex-in-dart, https://stackoverflow.com/questions/70187398/how-can-i-regexp-for-unicode-blocks-in-flutter-dart
class Name {
  final String value;
  Name(this.value);

  factory Name.fromString(String value) {
    if (value.isEmpty) {
      throw const NameRequired();
    }
    if (!RegExp(r"^\p{Script=Hani}+$", unicode: true).hasMatch(value)) {
      throw const NameInvalid();
    }

    return Name(value);
  }
}
