import 'package:bloc_and_riverpod/domain/events/event.dart';

class PhoneNumberChanged extends Event {
  String value;
  PhoneNumberChanged(this.value);
}
