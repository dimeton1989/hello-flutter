import 'package:hello_flutter/user_registration/domain/events/event.dart';

class NameChanged extends Event {
  String value;
  NameChanged(this.value);
}
