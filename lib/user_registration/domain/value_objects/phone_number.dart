import 'package:hello_flutter/user_registration/domain/exceptions/phone_number_required.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/phone_number_invalid.dart';

class PhoneNumber {
  final String value;
  PhoneNumber(this.value);
  factory PhoneNumber.fromString(String value) {
    if (value.isEmpty) {
      throw const PhoneNumberRequired();
    }
    if (!RegExp(r'^09[0-9]{8}$').hasMatch(value)) {
      throw const PhoneNumberInvalid();
    }
    return PhoneNumber(value);
  }
}
