import 'package:bloc_and_riverpod/user_registration/domain/events/event.dart';

class PhoneNumberChanged extends Event {
  String value;
  PhoneNumberChanged(this.value);
}
