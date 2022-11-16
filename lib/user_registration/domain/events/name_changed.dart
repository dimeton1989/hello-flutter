import 'package:bloc_and_riverpod/user_registration/domain/events/event.dart';

class NameChanged extends Event {
  String value;
  NameChanged(this.value);
}
