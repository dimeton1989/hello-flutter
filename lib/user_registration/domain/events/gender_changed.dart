import 'package:hello_flutter/user_registration/domain/events/event.dart';

class GenderChanged extends Event {
  final String value;
  GenderChanged(this.value);
}
