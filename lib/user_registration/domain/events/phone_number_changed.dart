import 'package:hello_flutter/user_registration/domain/events/event.dart';

class PhoneNumberChanged extends Event {
  String value;
  PhoneNumberChanged(this.value);
}
